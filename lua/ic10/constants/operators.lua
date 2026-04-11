local CATEGORIES = {
  BRAL = "Branch and Link",
  BRAN = "Branch",
  BRRL = "Relative Branching",
  COMP = "Comparison",
  MATH = "Math",
  TRIG = "Trigonometry",
  UTIL = "Utility",
}

local M = {}

---@class Instruction
---@field category string
---@field description string
---@field example? string
---@field signature string

---@type table<string, Instruction>
M = {
  -- System Keywords
  alias = {
    category = CATEGORIES.UTIL,
    description = "Labels a register or device reference with a name.",
    example = "alias Temp r0",
    signature = "alias [name] [r?/d?]",
  },
  define = {
    category = CATEGORIES.UTIL,
    description = "Creates a constant value.",
    example = "define TargetTemp 293",
    signature = "define [name] [value]",
  },
  hcf = {
    category = CATEGORIES.UTIL,
    description = "Halt and catch fire. Stops execution.",
    signature = "hcf",
  },
  sleep = {
    category = CATEGORIES.UTIL,
    description = "Pauses execution on the IC for X seconds.",
    signature = "sleep [seconds]",
  },
  yield = {
    category = CATEGORIES.UTIL,
    description = "Pauses execution for 1 tick (0.5s).",
    signature = "yield",
  },

  -- Mathematical
  abs = {
    category = CATEGORIES.MATH,
    description = "Register = absolute value of a.",
    example = "abs Positive -123",
    signature = "abs [r?] [a]",
  },
  add = {
    category = CATEGORIES.MATH,
    description = "Register = a + b.",
    example = "add Sum 1 2 -> Sum = 3",
    signature = "add [r?] [a] [b]",
  },
  ceil = {
    category = CATEGORIES.MATH,
    description = "Register = smallest integer greater than a.",
    signature = "ceil [r?] [a]",
  },
  div = {
    category = CATEGORIES.MATH,
    description = "Register = a / b.",
    signature = "div [r?] [a] [b]",
  },
  pow = {
    category = CATEGORIES.MATH,
    description = "Register = a raised to the power of b.",
    signature = "pow [r?] [a] [b]",
  },
  exp = {
    category = CATEGORIES.MATH,
    description = "Register = e^a.",
    signature = "exp [r?] [a]",
  },
  floor = {
    category = CATEGORIES.MATH,
    description = "Register = largest integer less than a.",
    signature = "floor [r?] [a]",
  },
  log = {
    category = CATEGORIES.MATH,
    description = "Register = natural log of a (ln).",
    signature = "log [r?] [a]",
  },
  max = {
    category = CATEGORIES.MATH,
    description = "Register = maximum of a or b.",
    signature = "max [r?] [a] [b]",
  },
  min = {
    category = CATEGORIES.MATH,
    description = "Register = minimum of a or b.",
    signature = "min [r?] [a] [b]",
  },
  mod = {
    category = CATEGORIES.MATH,
    description = "Register = a mod b (remainder).",
    signature = "mod [r?] [a] [b]",
  },
  move = {
    category = CATEGORIES.MATH,
    description = "Register = a (copies value).",
    signature = "move [r?] [a]",
  },
  mul = {
    category = CATEGORIES.MATH,
    description = "Register = a * b.",
    signature = "mul [r?] [a] [b]",
  },
  rand = {
    category = CATEGORIES.MATH,
    description = "Register = random value between 0 and 1.",
    signature = "rand [r?]",
  },
  round = {
    category = CATEGORIES.MATH,
    description = "Register = a rounded to nearest integer.",
    signature = "round [r?] [a]",
  },
  sqrt = {
    category = CATEGORIES.MATH,
    description = "Register = square root of a.",
    signature = "sqrt [r?] [a]",
  },
  sub = {
    category = CATEGORIES.MATH,
    description = "Register = a - b.",
    signature = "sub [r?] [a] [b]",
  },
  trunc = {
    category = CATEGORIES.MATH,
    description = "Register = a with fractional part removed.",
    signature = "trunc [r?] [a]",
  },
  lerp = {
    category = CATEGORIES.MATH,
    description = "Linearly interpolates between a and b by ratio c.",
    signature = "lerp [r?] [a] [b] [c]",
  },

  -- Trigonometric
  acos = {
    category = CATEGORIES.TRIG,
    description = "Returns arccosine of a (radians).",
    signature = "acos [r?] [a]",
  },
  asin = {
    category = CATEGORIES.TRIG,
    description = "Returns arcsine of a (radians).",
    signature = "asin [r?] [a]",
  },
  atan = {
    category = CATEGORIES.TRIG,
    description = "Returns arctangent of a (radians).",
    signature = "atan [r?] [a]",
  },
  atan2 = {
    category = CATEGORIES.TRIG,
    description = "Returns arctangent of y/x (radians).",
    signature = "atan2 [r?] [y] [x]",
  },
  cos = {
    category = CATEGORIES.TRIG,
    description = "Returns cosine of a (radians).",
    signature = "cos [r?] [a]",
  },
  sin = {
    category = CATEGORIES.TRIG,
    description = "Returns sine of a (radians).",
    signature = "sin [r?] [a]",
  },
  tan = {
    category = CATEGORIES.TRIG,
    description = "Returns tangent of a (radians).",
    signature = "tan [r?] [a]",
  },

  -- Stack
  clr = {
    category = "Stack",
    description = "Clears stack memory for device d?.",
    signature = "clr [d?]",
  },
  clrd = {
    category = "Stack",
    description = "Clears stack memory for device ID.",
    signature = "clrd [id]",
  },
  get = {
    category = "Stack",
    description = "Reads stack value at address from device d?.",
    signature = "get [r?] [d?] [addr]",
  },
  getd = {
    category = "Stack",
    description = "Reads stack value at address from device ID.",
    signature = "getd [r?] [id] [addr]",
  },
  peek = {
    category = "Stack",
    description = "Register = value at top of stack.",
    signature = "peek [r?]",
  },
  poke = {
    category = "Stack",
    description = "Stores value at address in the stack.",
    signature = "poke [addr] [value]",
  },
  pop = {
    category = "Stack",
    description = "Register = top of stack; decrements sp.",
    signature = "pop [r?]",
  },
  push = {
    category = "Stack",
    description = "Pushes value to stack; increments sp.",
    signature = "push [value]",
  },
  put = {
    category = "Stack",
    description = "Writes value to stack at address on device d?.",
    signature = "put [d?] [addr] [value]",
  },
  putd = {
    category = "Stack",
    description = "Writes value to stack at address on device ID.",
    signature = "putd [id] [addr] [value]",
  },

  -- I/O & Logic
  l = {
    category = "I/O",
    description = "Loads logicType from device d? to r?.",
    signature = "l [r?] [d?] [logicType]",
  },
  lr = {
    category = "I/O",
    description = "Loads reagent data from device.",
    signature = "lr [r?] [d?] [reagentMode] [int]",
  },
  ls = {
    category = "I/O",
    description = "Loads logicSlotType from slotIndex on d?.",
    signature = "ls [r?] [d?] [slotIndex] [logicSlotType]",
  },
  s = {
    category = "I/O",
    description = "Stores register r? to logicType on device d?.",
    signature = "s [d?] [logicType] [r?]",
  },
  ss = {
    category = "I/O",
    description = "Stores r? to slotIndex logicSlotType on d?.",
    signature = "ss [d?] [slotIndex] [logicSlotType] [r?]",
  },
  rmap = {
    category = "I/O",
    description = "Maps reagent hash to prefab hash for device.",
    signature = "rmap [r?] [d?] [reagentHash]",
  },

  -- Batched I/O
  lb = {
    category = "Batch",
    description = "Loads logicType from all devices of deviceHash.",
    signature = "lb [r?] [deviceHash] [logicType] [mode]",
  },
  lbn = {
    category = "Batch",
    description = "Batch load filtered by type and name.",
    signature = "lbn [r?] [deviceHash] [nameHash] [logicType] [mode]",
  },
  lbns = {
    category = "Batch",
    description = "Batch load from slot filtered by type and name.",
    signature = "lbns [r?] [deviceHash] [nameHash] [slot] [logicType] [mode]",
  },
  lbs = {
    category = "Batch",
    description = "Batch load from slot filtered by type.",
    signature = "lbs [r?] [deviceHash] [slot] [logicType] [mode]",
  },
  sb = {
    category = "Batch",
    description = "Stores r? to logicType on all devices of deviceHash.",
    signature = "sb [deviceHash] [logicType] [r?]",
  },
  sbn = {
    category = "Batch",
    description = "Batch store filtered by type and name.",
    signature = "sbn [deviceHash] [nameHash] [logicType] [r?]",
  },
  sbs = {
    category = "Batch",
    description = "Batch store to slot on devices of deviceHash.",
    signature = "sbs [deviceHash] [slot] [logicType] [r?]",
  },

  -- Bitwise
  ["and"] = {
    category = "Bitwise",
    description = "Bitwise logical AND.",
    signature = "and [r?] [a] [b]",
  },
  nor = {
    category = "Bitwise",
    description = "Bitwise logical NOR.",
    signature = "nor [r?] [a] [b]",
  },
  ["not"] = {
    category = "Bitwise",
    description = "Bitwise logical NOT.",
    signature = "not [r?] [a]",
  },
  ["or"] = {
    category = "Bitwise",
    description = "Bitwise logical OR.",
    signature = "or [r?] [a] [b]",
  },
  sla = {
    category = "Bitwise",
    description = "Bitwise left shift (arithmetic).",
    signature = "sla [r?] [a] [b]",
  },
  sll = {
    category = "Bitwise",
    description = "Bitwise left shift (logical).",
    signature = "sll [r?] [a] [b]",
  },
  sra = {
    category = "Bitwise",
    description = "Bitwise right shift (arithmetic).",
    signature = "sra [r?] [a] [b]",
  },
  srl = {
    category = "Bitwise",
    description = "Bitwise right shift (logical).",
    signature = "srl [r?] [a] [b]",
  },
  xor = {
    category = "Bitwise",
    description = "Bitwise logical XOR.",
    signature = "xor [r?] [a] [b]",
  },
  ext = {
    category = "Bitwise",
    description = "Extracts bit field from source.",
    signature = "ext [r?] [source] [offset] [length]",
  },
  ins = {
    category = "Bitwise",
    description = "Inserts bit field into register.",
    signature = "ins [r?] [field] [offset] [length]",
  },

  -- Comparison
  select = {
    category = "Comparison",
    description = "r? = b if a != 0, else c.",
    signature = "select [r?] [a] [b] [c]",
  },
  seq = {
    category = "Comparison",
    description = "r? = 1 if a == b, else 0.",
    signature = "seq [r?] [a] [b]",
  },
  sne = {
    category = "Comparison",
    description = "r? = 1 if a != b, else 0.",
    signature = "sne [r?] [a] [b]",
  },
  sge = {
    category = "Comparison",
    description = "r? = 1 if a >= b, else 0.",
    signature = "sge [r?] [a] [b]",
  },
  sgt = {
    category = "Comparison",
    description = "r? = 1 if a > b, else 0.",
    signature = "sgt [r?] [a] [b]",
  },
  sle = {
    category = "Comparison",
    description = "r? = 1 if a <= b, else 0.",
    signature = "sle [r?] [a] [b]",
  },
  slt = {
    category = "Comparison",
    description = "r? = 1 if a < b, else 0.",
    signature = "slt [r?] [a] [b]",
  },
  sap = {
    category = "Comparison",
    description = "r? = 1 if a approx equal to b.",
    signature = "sap [r?] [a] [b] [c]",
  },
  sapz = {
    category = "Comparison",
    description = "r? = 1 if a approx zero.",
    signature = "sapz [r?] [a] [b]",
  },

  -- Branching
  j = {
    category = CATEGORIES.BRAN,
    description = "Jump execution to addr/label.",
    signature = "j [addr]",
  },
  jal = {
    category = CATEGORIES.BRAN,
    description = "Jump to addr/label and save return address in ra.",
    signature = "jal [addr]",
  },
  jr = {
    category = CATEGORIES.BRAN,
    description = "Relative jump by offset lines.",
    signature = "jr [offset]",
  },
  beq = {
    category = CATEGORIES.BRAN,
    description = "Branch to addr if a == b.",
    signature = "beq [a] [b] [addr]",
  },
  bne = {
    category = CATEGORIES.BRAN,
    description = "Branch to addr if a != b.",
    signature = "bne [a] [b] [addr]",
  },
  bgt = {
    category = CATEGORIES.BRAN,
    description = "Branch to addr if a > b.",
    signature = "bgt [a] [b] [addr]",
  },
  blt = {
    category = CATEGORIES.BRAN,
    description = "Branch to addr if a < b.",
    signature = "blt [a] [b] [addr]",
  },
  bge = {
    category = CATEGORIES.BRAN,
    description = "Branch to addr if a >= b.",
    signature = "bge [a] [b] [addr]",
  },
  ble = {
    category = CATEGORIES.BRAN,
    description = "Branch to addr if a <= b.",
    signature = "ble [a] [b] [addr]",
  },
  beqz = {
    category = CATEGORIES.BRAN,
    description = "Branch to addr if a == 0.",
    signature = "beqz [a] [addr]",
  },
  bnez = {
    category = CATEGORIES.BRAN,
    description = "Branch to addr if a != 0.",
    signature = "bnez [a] [addr]",
  },
  bgez = {
    category = CATEGORIES.BRAN,
    description = "Branch to addr if a >= 0.",
    signature = "bgez [a] [addr]",
  },
  blez = {
    category = CATEGORIES.BRAN,
    description = "Branch to addr if a <= 0.",
    signature = "blez [a] [addr]",
  },
  bgtz = {
    category = CATEGORIES.BRAN,
    description = "Branch to addr if a > 0.",
    signature = "bgtz [a] [addr]",
  },
  bltz = {
    category = CATEGORIES.BRAN,
    description = "Branch to addr if a < 0.",
    signature = "bltz [a] [addr]",
  },

  -- Relative Branching
  breq = {
    category = CATEGORIES.BRRL,
    description = "Relative branch if a == b.",
    signature = "breq [a] [b] [offset]",
  },
  brne = {
    category = CATEGORIES.BRRL,
    description = "Relative branch if a != b.",
    signature = "brne [a] [b] [offset]",
  },
  brgt = {
    category = CATEGORIES.BRRL,
    description = "Relative branch if a > b.",
    signature = "brgt [a] [b] [offset]",
  },
  brlt = {
    category = CATEGORIES.BRRL,
    description = "Relative branch if a < b.",
    signature = "brlt [a] [b] [offset]",
  },
  brge = {
    category = CATEGORIES.BRRL,
    description = "Relative branch if a >= b.",
    signature = "brge [a] [b] [offset]",
  },
  brle = {
    category = CATEGORIES.BRRL,
    description = "Relative branch if a <= b.",
    signature = "brle [a] [b] [offset]",
  },
  breqz = {
    category = CATEGORIES.BRRL,
    description = "Relative branch if a == 0.",
    signature = "breqz [a] [offset]",
  },
  brnez = {
    category = CATEGORIES.BRRL,
    description = "Relative branch if a != 0.",
    signature = "brnez [a] [offset]",
  },
  brgez = {
    category = CATEGORIES.BRRL,
    description = "Relative branch if a >= 0.",
    signature = "brgez [a] [offset]",
  },
  brlez = {
    category = CATEGORIES.BRRL,
    description = "Relative branch if a <= 0.",
    signature = "brlez [a] [offset]",
  },
  brgtz = {
    category = CATEGORIES.BRRL,
    description = "Relative branch if a > 0.",
    signature = "brgtz [a] [offset]",
  },
  brltz = {
    category = CATEGORIES.BRRL,
    description = "Relative branch if a < 0.",
    signature = "brltz [a] [offset]",
  },

  -- Branch and Link
  beqal = {
    category = CATEGORIES.BRAL,
    description = "Branch and link if a == b.",
    signature = "beqal [a] [b] [addr]",
  },
  bneal = {
    category = CATEGORIES.BRAL,
    description = "Branch and link if a != b.",
    signature = "bneal [a] [b] [addr]",
  },
  bgtal = {
    category = CATEGORIES.BRAL,
    description = "Branch and link if a > b.",
    signature = "bgtal [a] [b] [addr]",
  },
  bltal = {
    category = CATEGORIES.BRAL,
    description = "Branch and link if a < b.",
    signature = "bltal [a] [b] [addr]",
  },
  bgeal = {
    category = CATEGORIES.BRAL,
    description = "Branch and link if a >= b.",
    signature = "bgeal [a] [b] [addr]",
  },
  bleal = {
    category = CATEGORIES.BRAL,
    description = "Branch and link if a <= b.",
    signature = "bleal [a] [b] [addr]",
  },
  beqzal = {
    category = CATEGORIES.BRAL,
    description = "Branch and link if a == 0.",
    signature = "beqzal [a] [addr]",
  },
  bnezal = {
    category = CATEGORIES.BRAL,
    description = "Branch and link if a != 0.",
    signature = "bnezal [a] [addr]",
  },
  bgezal = {
    category = CATEGORIES.BRAL,
    description = "Branch and link if a >= 0.",
    signature = "bgezal [a] [addr]",
  },
  blezal = {
    category = CATEGORIES.BRAL,
    description = "Branch and link if a <= 0.",
    signature = "blezal [a] [addr]",
  },
  bgtzal = {
    category = CATEGORIES.BRAL,
    description = "Branch and link if a > 0.",
    signature = "bgtzal [a] [addr]",
  },
  bltzal = {
    category = CATEGORIES.BRAL,
    description = "Branch and link if a < 0.",
    signature = "bltzal [a] [addr]",
  },
}

return M
