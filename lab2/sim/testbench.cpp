// Copyright 2023 Sycuricon Group
// Author: Jinyan Xu (phantom@zju.edu.cn)

#define __STR(s) #s
#define STR(s) __STR(s)
#define CAT(a, b) a ## b

#define VTOP(a) CAT(V, a)
#define TOP_CLASS(a) CAT(a, _t)

#include "VTOP.h"
#include "verilated.h"
#include "verilated_vcd_c.h"

#include <stdio.h>
#include <memory>

#ifndef TOP
#error "TOP module macro is not defined!"
#endif

#include "cj.h"
cosim_cj_t* simulator = NULL;

#define MAX_SIM_TIME 5000

class DUT_t {
  public:
    VTOP(TOP) *topp;
    VerilatedVcdC *tfp;
    VerilatedContext* contextp;
    vluint64_t max_time;

    DUT_t() : max_time(MAX_SIM_TIME) {
        contextp = new VerilatedContext;
        contextp->debug(0);
        contextp->randReset(10);

        topp = new VTOP(TOP);
        tfp = new VerilatedVcdC;
        Verilated::traceEverOn(true);
        topp->trace(tfp, 99);
        tfp->open(STR(TOP)".vcd");
    }
    ~DUT_t() {
        tfp->close();
        delete topp;
        delete contextp;
    }
    virtual bool init() = 0;
    virtual void eval() = 0;
    virtual void poke() = 0;
    virtual bool peek_and_check() = 0;
    void main() {
        if (!init())
            return;

        while (contextp->time() < max_time && !contextp->gotFinish()) {
            poke();
            eval();
            // if(topp->cosim_mem_we){
            //     printf("data=%p\n",topp->cosim_mem_wdata);
            // }
            if (!peek_and_check()) {
                printf("Verification failed!\n");
                break;
            }
        }
    }
};

class Testbench_t : public DUT_t {
  public:
    // reference model
    unsigned char clk;
    unsigned char rstn;

    Testbench_t() : 
        clk(0), rstn(0) {}

    virtual void eval() {
        // rtl eval
        contextp->timeInc(1);
        topp->eval();
        tfp->dump(contextp->time());

        // ref eval
    }

    virtual void poke() {
        // ref poke
        clk = !clk;
        rstn = 1;
        
        // rtl poke
        topp->clk = clk;
        topp->rstn = rstn;
    }

    virtual bool peek_and_check() {
        return true;
    }

    virtual bool init() {
        int init_time = 10;
        clk = 0;
        rstn = 0;

        topp->rstn = rstn;
        for (int i = 0; i < init_time; i++) {
            topp->clk = clk;
            eval();
            if (!peek_and_check()) {
                printf("Initilization failed!\n");
                return false;
            }
            clk = !clk;
        }
        return true;
    }
};

int main(int argc, char **argv, char **env) {
    Verilated::commandArgs(argc, argv);

    config_t cfg;
    cfg.verbose = true;
    cfg.isa = "rv64i";
    cfg.boot_addr = 0x0;
    cfg.elffiles = std::vector<std::string> {
        "testcase.elf"
    };
    cfg.mem_layout = std::vector<mem_cfg_t> {
        mem_cfg_t(0x0UL, 0x1000UL)
    };
    simulator = new cosim_cj_t(cfg);

    TOP_CLASS(TOP) *dut = new TOP_CLASS(TOP);
    dut->main();
    delete dut;
    return 0;
}
