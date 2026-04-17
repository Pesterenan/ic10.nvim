local M = {
  REGISTERS = {
    "r0",
    "r1",
    "r2",
    "r3",
    "r4",
    "r5",
    "r6",
    "r7",
    "r8",
    "r9",
    "r10",
    "r11",
    "r12",
    "r13",
    "r14",
    "r15",
    "ra",
    "sp",
  },
  DEVICES = { "db", "d0", "d1", "d2", "d3", "d4", "d5" },
  operators = require("ic10.constants.operators"),
  types = require("ic10.constants.types"),
}

return M
