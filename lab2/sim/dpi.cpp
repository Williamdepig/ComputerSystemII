// Copyright 2023 Sycuricon Group
// Author: Jinyan Xu (phantom@zju.edu.cn)

#include <svdpi.h>
#include <stdio.h>
#include <unistd.h>
#include <fcntl.h>
#include <time.h>
#include "cj.h"

extern cosim_cj_t* simulator;

extern "C" int cosim_commit (int hartid, reg_t dut_pc, uint32_t dut_insn) {
  assert(simulator);
  return simulator->cosim_commit_stage(0, dut_pc, dut_insn, true);
}

extern "C" int cosim_judge (int hartid, const char * which, int dut_waddr, reg_t dut_wdata) {
  assert(simulator);
  if (strcmp(which, "float") == 0)
    return simulator->cosim_judge_stage(0, dut_waddr, dut_wdata, true);
  else
    return simulator->cosim_judge_stage(0, dut_waddr, dut_wdata, false);
}
