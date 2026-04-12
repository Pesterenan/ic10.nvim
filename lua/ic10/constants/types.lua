local CATEGORIES = {
  SYST = "System",
  BATC = "Batch Mode",
  REAG = "Reagent Mode",
  LTYP = "Logic Type",
  LSTY = "Logic Slot Type",
}

local M = {}

---@class Type
---@field category string
---@field description string
---@field value? number

---@type table<string, Type>
M.system = {
  ["MaxInstructionCount"] = {
    category = CATEGORIES.SYST,
    description = "Maximum number of instructions per tick.",
    value = 128,
  },
  ["MaxRegisterCount"] = {
    category = CATEGORIES.SYST,
    description = "Total number of registers available (r0-r15).",
    value = 16,
  },
  ["StackSize"] = {
    category = CATEGORIES.SYST,
    description = "Returns the stack size of the devices internal memory.",
    value = 512,
  },
}

---@type table<string, Type>
M.batch_modes = {
  ["Average"] = {
    category = CATEGORIES.BATC,
    description = "Returns the average value of all devices in the batch.",
    value = 0,
  },
  ["Sum"] = {
    value = 1,
    category = CATEGORIES.BATC,
    description = "Returns the total sum of all values in the batch.",
  },
  ["Minimum"] = {
    value = 2,
    category = CATEGORIES.BATC,
    description = "Returns the lowest value found among the devices.",
  },
  ["Maximum"] = {
    category = CATEGORIES.BATC,
    description = "Returns the highest value found among the devices.",
    value = 3,
  },
}

---@type table<string, Type>
M.reagent_modes = {
  ["Contents"] = {
    value = 0,
    category = CATEGORIES.REAG,
    description = "Read contents of the device.",
  },
  ["Required"] = {
    value = 1,
    category = CATEGORIES.REAG,
    description = "Read required reagents for the recipe.",
  },
  ["Recipe"] = {
    value = 2,
    category = CATEGORIES.REAG,
    description = "Read the recipe output.",
  },
}

---@type table<string, Type>
M.logic_types = {
  -- Logic Types
  ["Acceleration"] = {
    category = CATEGORIES.LTYP,
    description = "Change in velocity. Rockets that are deccelerating when landing will show this as negative value.",
  },
  ["Activate"] = {
    category = CATEGORIES.LTYP,
    description = "1 if device is activated (usually means running), otherwise 0",
  },
  ["AirRelease"] = {
    category = CATEGORIES.LTYP,
    description = "The current state of the air release system, for example AirRelease = 1 for a Hardsuit sets Air Release to On",
  },
  ["AlignmentError"] = {
    category = CATEGORIES.LTYP,
    description = "The angular discrepancy between the telescope's current orientation and the target. Indicates how 'off target' the telescope is. Returns NaN when no target.",
  },
  ["Apex"] = {
    category = CATEGORIES.LTYP,
    description = "The lowest altitude that the rocket will reach before it starts travelling upwards again.",
  },
  ["AutoLand"] = {
    category = CATEGORIES.LTYP,
    description = "Engages the automatic landing algorithm.",
  },
  ["AutoShutOff"] = {
    category = CATEGORIES.LTYP,
    description = "Turns off all devices in the rocket upon reaching destination",
  },
  ["BestContactFilter"] = {
    category = CATEGORIES.LTYP,
    description = "Filters the satellite's auto selection of targets to a single reference ID.",
  },
  ["Bpm"] = {
    category = CATEGORIES.LTYP,
    description = "Bpm",
  },
  ["BurnTimeRemaining"] = {
    category = CATEGORIES.LTYP,
    description = "Estimated time in seconds until fuel is depleted.",
  },
  ["Bypass"] = {
    category = CATEGORIES.LTYP,
    description = "Bypasses some internal behavoiur of the atmospherics device.",
  },
  ["CelestialHash"] = {
    category = CATEGORIES.LTYP,
    description = "The current hash of the targeted celestial object.",
  },
  ["CelestialParentHash"] = {
    category = CATEGORIES.LTYP,
    description = "The hash for the name of the parent the celestial is orbiting, 0 if there is no parent celestial.",
  },
  ["Channel"] = {
    category = CATEGORIES.LTYP,
    description = "Channel on a cable network which should be considered volatile",
  },
  ["Charge"] = {
    category = CATEGORIES.LTYP,
    description = "The current charge the device has",
  },
  ["Chart"] = {
    category = CATEGORIES.LTYP,
    description = "Progress status of Chart scan at the rocket's target Space Map Location. Returns a clamped normalised value. If Chart scan is not available returns -1.",
  },
  ["ChartedNavPoints"] = {
    category = CATEGORIES.LTYP,
    description = "The number of charted NavPoints at the rocket's target Space Map Location.",
  },
  ["ClearMemory"] = {
    category = CATEGORIES.LTYP,
    description = "When set to 1, clears the counter memory (e.g. ExportCount). Will set itself back to 0 when actioned",
  },
  ["Color"] = {
    category = CATEGORIES.LTYP,
    description = "Color index of the device/item.",
  },
  ["Combustion"] = {
    category = CATEGORIES.LTYP,
    description = "The assess atmosphere is on fire. Returns 1 if atmosphere is on fire, 0 if not.",
  },
  ["CombustionInput"] = {
    category = CATEGORIES.LTYP,
    description = "The assess atmosphere is on fire. Returns 1 if device's input network is on fire, 0 if not.",
  },
  ["CombustionInput2"] = {
    category = CATEGORIES.LTYP,
    description = "The assess atmosphere is on fire. Returns 1 if device's Input2 network is on fire, 0 if not.",
  },
  ["CombustionLimiter"] = {
    category = CATEGORIES.LTYP,
    description = "Retards the rate of combustion inside the machine (range: 0-100), with 0 being the slowest rate of combustion and 100 being the fastest",
  },
  ["CombustionOutput"] = {
    category = CATEGORIES.LTYP,
    description = "The assess atmosphere is on fire. Returns 1 if device's Output network is on fire, 0 if not.",
  },
  ["CombustionOutput2"] = {
    category = CATEGORIES.LTYP,
    description = "The assess atmosphere is on fire. Returns 1 if device's Output2 network is on fire, 0 if not.",
  },
  ["CompletionRatio"] = {
    category = CATEGORIES.LTYP,
    description = "How complete the current production is for this device, between 0 and 1",
  },
  ["ContactSlotIndex"] = {
    category = CATEGORIES.LTYP,
    description = "The index of the slot in which the trader has spawned.",
  },
  ["ContactTypeId"] = {
    category = CATEGORIES.LTYP,
    description = "The type id of the contact.",
  },
  ["CurrentCode"] = {
    category = CATEGORIES.LTYP,
    description = "The Space Map Address of the rockets current Space Map Location",
  },
  ["Density"] = {
    category = CATEGORIES.LTYP,
    description = "The density of the rocket's target site's mine-able deposit.",
  },
  ["DestinationCode"] = {
    category = CATEGORIES.LTYP,
    description = "Unique identifier code for a destination on the space map.",
  },
  ["Discover"] = {
    category = CATEGORIES.LTYP,
    description = "Progress status of Discovery scan at the rocket's target Space Map Location. Returns a clamped normalised value. If Discovery scan is not available returns -1.",
  },
  ["DistanceAu"] = {
    category = CATEGORIES.LTYP,
    description = "The current distance to the celestial object, measured in astronomical units.",
  },
  ["DistanceKm"] = {
    category = CATEGORIES.LTYP,
    description = "The current distance to the celestial object, measured in kilometers.",
  },
  ["DrillCondition"] = {
    category = CATEGORIES.LTYP,
    description = "The current condition of the drill head in this devices drill slot. Expressed as a ratio between 0 and 1.",
  },
  ["DryMass"] = {
    category = CATEGORIES.LTYP,
    description = "The Mass in kilograms of the rocket excluding fuel.",
  },
  ["Eccentricity"] = {
    category = CATEGORIES.LTYP,
    description = "A measure of how elliptical (oval) an orbit is. Ranges from 0 (a perfect circle) to 1 (a parabolic trajectory).",
  },
  ["ElevatorLevel"] = {
    category = CATEGORIES.LTYP,
    description = "Level the elevator is currently at",
  },
  ["ElevatorSpeed"] = {
    category = CATEGORIES.LTYP,
    description = "Current speed of the elevator",
  },
  ["EntityState"] = {
    category = CATEGORIES.LTYP,
    description = "The current entity state, such as whether it is dead, unconscious or alive, expressed as a state integer.",
  },
  ["EnvironmentEfficiency"] = {
    category = CATEGORIES.LTYP,
    description = "The Environment Efficiency reported by the machine, as a float between 0 and 1",
  },
  ["Error"] = {
    category = CATEGORIES.LTYP,
    description = "1 if device is in error state, otherwise 0",
  },
  ["ExportCount"] = {
    category = CATEGORIES.LTYP,
    description = "How many items exported since last ClearMemory",
  },
  ["ExportQuantity"] = {
    category = CATEGORIES.LTYP,
    description = "Total quantity of items exported by the device",
  },
  ["Extended"] = {
    category = CATEGORIES.LTYP,
    description = "Extended",
  },
  ["Filtration"] = {
    category = CATEGORIES.LTYP,
    description = "The current state of the filtration system, for example Filtration = 1 for a Hardsuit sets filtration to On",
  },
  ["Flush"] = {
    category = CATEGORIES.LTYP,
    description = "Set to 1 to activate the flush function on the device",
  },
  ["ForceWrite"] = {
    category = CATEGORIES.LTYP,
    description = "Forces Logic Writer devices to rewrite value",
  },
  ["Forward"] = {
    category = CATEGORIES.LTYP,
    description = "The direction the entity is facing expressed as a normalized vector",
  },
  ["FreeSlots"] = {
    category = CATEGORIES.LTYP,
    description = "The number of free slots available in this object.",
  },
  ["Harvest"] = {
    category = CATEGORIES.LTYP,
    description = "Performs the harvesting action for any plant based machinery",
  },
  ["Horizontal"] = {
    category = CATEGORIES.LTYP,
    description = "Horizontal setting of the device",
  },
  ["HorizontalRatio"] = {
    category = CATEGORIES.LTYP,
    description = "Radio of horizontal setting for device",
  },
  ["Idle"] = {
    category = CATEGORIES.LTYP,
    description = "Returns 1 if the device is currently idle, otherwise 0",
  },
  ["ImportCount"] = {
    category = CATEGORIES.LTYP,
    description = "How many items imported since last ClearMemory",
  },
  ["ImportQuantity"] = {
    category = CATEGORIES.LTYP,
    description = "Total quantity of items imported by the device",
  },
  ["Inclination"] = {
    category = CATEGORIES.LTYP,
    description = "The tilt of an orbit's plane relative to the equatorial plane, measured in degrees. Defines the orbital plane's angle.",
  },
  ["Index"] = {
    category = CATEGORIES.LTYP,
    description = "The current index for the device.",
  },
  ["InterrogationProgress"] = {
    category = CATEGORIES.LTYP,
    description = "Progress of this sattellite dish's interrogation of its current target, as a ratio from 0-1",
  },
  ["LineNumber"] = {
    category = CATEGORIES.LTYP,
    description = "The line number of current execution for an integrated circuit running on this device. While this number can be written, use with caution",
  },
  ["Lock"] = {
    category = CATEGORIES.LTYP,
    description = "1 if device is locked, otherwise 0, can be set in most devices and prevents the user from access the values",
  },
  ["Mass"] = {
    category = CATEGORIES.LTYP,
    description = "The total Mass of the rocket in kilograms including fuel and cargo.",
  },
  ["MaturityRatio"] = {
    category = CATEGORIES.LTYP,
    description = "How far the plant is towards maturity represented as a fraction between 0 and 1, with 1 being mature and ready for harvest.",
  },
  ["Maximum"] = {
    category = CATEGORIES.LTYP,
    description = "Maximum setting of the device",
  },
  ["MinedQuantity"] = {
    category = CATEGORIES.LTYP,
    description = "The total number of resources that have been mined at the rocket's target Space Map Site.",
  },
  ["MinWattsToContact"] = {
    category = CATEGORIES.LTYP,
    description = "Minimum required amount of watts from the dish hitting the target trader contact to start interrogating the contact",
  },
  ["Mode"] = {
    category = CATEGORIES.LTYP,
    description = "Integer for mode state, different devices will have different mode states available to them",
  },
  ["NameHash"] = {
    category = CATEGORIES.LTYP,
    description = "Provides the hash value for the name of the object as a 32 bit integer.",
  },
  ["NavPoints"] = {
    category = CATEGORIES.LTYP,
    description = "The number of NavPoints at the rocket's target Space Map Location.",
  },
  ["None"] = {
    category = CATEGORIES.LTYP,
    description = "No description",
  },
  ["On"] = {
    category = CATEGORIES.LTYP,
    description = "The current state of the device, 0 for off, 1 for on",
  },
  ["Open"] = {
    category = CATEGORIES.LTYP,
    description = "1 if device is open, otherwise 0",
  },
  ["OperationalTemperatureEfficiency"] = {
    category = CATEGORIES.LTYP,
    description = "How the input pipe's temperature effects the machines efficiency",
  },
  ["Orientation"] = {
    category = CATEGORIES.LTYP,
    description = "The orientation of the entity in degrees in a plane relative towards the north origin",
  },
  ["Output"] = {
    category = CATEGORIES.LTYP,
    description = "The output operation for a sort handling device, such as a stacker or sorter",
  },
  ["OverShootTarget"] = {
    category = CATEGORIES.LTYP,
    description = "How far is the landing rocket going to overshoot its landing target at its current thrust.",
  },
  ["Period"] = {
    category = CATEGORIES.LTYP,
    description = "The time it takes for an object to complete one full orbit around another object, measured in days. Indicates the duration of the orbital cycle.",
  },
  ["Plant"] = {
    category = CATEGORIES.LTYP,
    description = "Performs the planting action for any plant based machinery",
  },
  ["PositionX"] = {
    category = CATEGORIES.LTYP,
    description = "The current position in X dimension in world coordinates",
  },
  ["PositionY"] = {
    category = CATEGORIES.LTYP,
    description = "The current position in Y dimension in world coordinates",
  },
  ["PositionZ"] = {
    category = CATEGORIES.LTYP,
    description = "The current position in Z dimension in world coordinates",
  },
  ["Power"] = {
    category = CATEGORIES.LTYP,
    description = "Can be read to return if the device is correctly powered or not, set via the power system, return 1 if powered and 0 if not",
  },
  ["PowerActual"] = {
    category = CATEGORIES.LTYP,
    description = "How much energy the device or network is actually using",
  },
  ["PowerGeneration"] = {
    category = CATEGORIES.LTYP,
    description = "Returns how much power is being generated",
  },
  ["PowerPotential"] = {
    category = CATEGORIES.LTYP,
    description = "How much energy the device or network potentially provides",
  },
  ["PowerRequired"] = {
    category = CATEGORIES.LTYP,
    description = "Power requested from the device and/or network",
  },
  ["PrefabHash"] = {
    category = CATEGORIES.LTYP,
    description = "The hash of the structure",
  },
  ["Pressure"] = {
    category = CATEGORIES.LTYP,
    description = "The current pressure reading of the device",
  },
  ["PressureEfficiency"] = {
    category = CATEGORIES.LTYP,
    description = "How the pressure of the input pipe and waste pipe effect the machines efficiency",
  },
  ["PressureExternal"] = {
    category = CATEGORIES.LTYP,
    description = "Setting for external pressure safety, in KPa. Represents the target pressure of the external atmosphere.",
  },
  ["PressureInput"] = {
    category = CATEGORIES.LTYP,
    description = "The current pressure reading of the device's Input Network",
  },
  ["PressureInput2"] = {
    category = CATEGORIES.LTYP,
    description = "The current pressure reading of the device's Input2 Network",
  },
  ["PressureInternal"] = {
    category = CATEGORIES.LTYP,
    description = "Setting for internal pressure safety, in KPa. Represents the target pressure of the atmosphere inside the connected pipe network.",
  },
  ["PressureOutput"] = {
    category = CATEGORIES.LTYP,
    description = "The current pressure reading of the device's Output Network",
  },
  ["PressureOutput2"] = {
    category = CATEGORIES.LTYP,
    description = "The current pressure reading of the device's Output2 Network",
  },
  ["PressureSetting"] = {
    category = CATEGORIES.LTYP,
    description = "The current setting for the internal pressure of the object (e.g. the Hardsuit Air release), in KPa",
  },
  ["Progress"] = {
    category = CATEGORIES.LTYP,
    description = "Progress of the rocket to the next node on the map expressed as a value between 0-1.",
  },
  ["Quantity"] = {
    category = CATEGORIES.LTYP,
    description = "Total quantity on the device",
  },
  ["Ratio"] = {
    category = CATEGORIES.LTYP,
    description = "Context specific value depending on device, 0 to 1 based ratio",
  },
  ["RatioCarbonDioxide"] = {
    category = CATEGORIES.LTYP,
    description = "The ratio of {GAS:CarbonDioxide} in device atmosphere",
  },
  ["RatioCarbonDioxideInput"] = {
    category = CATEGORIES.LTYP,
    description = "The ratio of {GAS:CarbonDioxide} in device's input network",
  },
  ["RatioCarbonDioxideInput2"] = {
    category = CATEGORIES.LTYP,
    description = "The ratio of {GAS:CarbonDioxide} in device's Input2 network",
  },
  ["RatioCarbonDioxideOutput"] = {
    category = CATEGORIES.LTYP,
    description = "The ratio of {GAS:CarbonDioxide} in device's Output network",
  },
  ["RatioCarbonDioxideOutput2"] = {
    category = CATEGORIES.LTYP,
    description = "The ratio of {GAS:CarbonDioxide} in device's Output2 network",
  },
  ["RatioHelium"] = {
    category = CATEGORIES.LTYP,
    description = "The ratio of {GAS:Helium} in device's Atmosphere",
  },
  ["RatioHeliumInput"] = {
    category = CATEGORIES.LTYP,
    description = "The ratio of {GAS:Helium} in device's Input Atmosphere",
  },
  ["RatioHeliumInput2"] = {
    category = CATEGORIES.LTYP,
    description = "The ratio of {GAS:Helium} in device's Input2 Atmosphere",
  },
  ["RatioHeliumOutput"] = {
    category = CATEGORIES.LTYP,
    description = "The ratio of {GAS:Helium} in device's Output Atmosphere",
  },
  ["RatioHeliumOutput2"] = {
    category = CATEGORIES.LTYP,
    description = "The ratio of {GAS:Helium} in device's Output2 Atmopshere",
  },
  ["RatioHydrazine"] = {
    category = CATEGORIES.LTYP,
    description = "The ratio of {GAS:Hydrazine} in device's Atmosphere",
  },
  ["RatioHydrazineInput"] = {
    category = CATEGORIES.LTYP,
    description = "The ratio of {GAS:Hydrazine} in device's Input Atmosphere",
  },
  ["RatioHydrazineInput2"] = {
    category = CATEGORIES.LTYP,
    description = "The ratio of {GAS:Hydrazine} in device's Input2 Atmosphere",
  },
  ["RatioHydrazineOutput"] = {
    category = CATEGORIES.LTYP,
    description = "The ratio of {GAS:Hydrazine} in device's Output Atmosphere",
  },
  ["RatioHydrazineOutput2"] = {
    category = CATEGORIES.LTYP,
    description = "The ratio of {GAS:Hydrazine} in device's Output2 Atmopshere",
  },
  ["RatioHydrochloricAcid"] = {
    category = CATEGORIES.LTYP,
    description = "The ratio of {GAS:HydrochloricAcid} in device's Atmosphere",
  },
  ["RatioHydrochloricAcidInput"] = {
    category = CATEGORIES.LTYP,
    description = "The ratio of {GAS:HydrochloricAcid} in device's Input Atmosphere",
  },
  ["RatioHydrochloricAcidInput2"] = {
    category = CATEGORIES.LTYP,
    description = "The ratio of {GAS:HydrochloricAcid} in device's Input2 Atmosphere",
  },
  ["RatioHydrochloricAcidOutput"] = {
    category = CATEGORIES.LTYP,
    description = "The ratio of {GAS:HydrochloricAcid} in device's Output Atmosphere",
  },
  ["RatioHydrochloricAcidOutput2"] = {
    category = CATEGORIES.LTYP,
    description = "The ratio of {GAS:HydrochloricAcid} in device's Output2 Atmopshere",
  },
  ["RatioHydrogen"] = {
    category = CATEGORIES.LTYP,
    description = "The ratio of {GAS:Hydrogen} in device's Atmopshere",
  },
  ["RatioHydrogenInput"] = {
    category = CATEGORIES.LTYP,
    description = "The ratio of {GAS:Hydrogen} in device's Input Atmosphere",
  },
  ["RatioHydrogenInput2"] = {
    category = CATEGORIES.LTYP,
    description = "The ratio of {GAS:Hydrogen} in device's Input2 Atmosphere",
  },
  ["RatioHydrogenOutput"] = {
    category = CATEGORIES.LTYP,
    description = "The ratio of {GAS:Hydrogen} in device's Output Atmosphere",
  },
  ["RatioHydrogenOutput2"] = {
    category = CATEGORIES.LTYP,
    description = "The ratio of {GAS:Hydrogen} in device's Output2 Atmopshere",
  },
  ["RatioLiquidAlcohol"] = {
    category = CATEGORIES.LTYP,
    description = "The ratio of {GAS:LiquidAlcohol} in device's Atmosphere",
  },
  ["RatioLiquidAlcoholInput"] = {
    category = CATEGORIES.LTYP,
    description = "The ratio of {GAS:LiquidAlcohol} in device's Input Atmosphere",
  },
  ["RatioLiquidAlcoholInput2"] = {
    category = CATEGORIES.LTYP,
    description = "The ratio of {GAS:LiquidCarbonDioxide} in device's Input2 Atmosphere",
  },
  ["RatioLiquidAlcoholOutput"] = {
    category = CATEGORIES.LTYP,
    description = "The ratio of {GAS:LiquidCarbonDioxide} in device's Output Atmosphere",
  },
  ["RatioLiquidAlcoholOutput2"] = {
    category = CATEGORIES.LTYP,
    description = "The ratio of {GAS:LiquidCarbonDioxide} in device's Output2 Atmopshere",
  },
  ["RatioLiquidCarbonDioxide"] = {
    category = CATEGORIES.LTYP,
    description = "The ratio of {GAS:LiquidCarbonDioxide} in device's Atmosphere",
  },
  ["RatioLiquidCarbonDioxideInput"] = {
    category = CATEGORIES.LTYP,
    description = "The ratio of {GAS:LiquidCarbonDioxide} in device's Input Atmosphere",
  },
  ["RatioLiquidCarbonDioxideInput2"] = {
    category = CATEGORIES.LTYP,
    description = "The ratio of {GAS:LiquidCarbonDioxide} in device's Input2 Atmosphere",
  },
  ["RatioLiquidCarbonDioxideOutput"] = {
    category = CATEGORIES.LTYP,
    description = "The ratio of {GAS:LiquidCarbonDioxide} in device's Output Atmosphere",
  },
  ["RatioLiquidCarbonDioxideOutput2"] = {
    category = CATEGORIES.LTYP,
    description = "The ratio of {GAS:LiquidCarbonDioxide} in device's Output2 Atmopshere",
  },
  ["RatioLiquidHydrazine"] = {
    category = CATEGORIES.LTYP,
    description = "The ratio of {GAS:LiquidHydrazine} in device's Atmosphere",
  },
  ["RatioLiquidHydrazineInput"] = {
    category = CATEGORIES.LTYP,
    description = "The ratio of {GAS:LiquidHydrazine} in device's Input Atmosphere",
  },
  ["RatioLiquidHydrazineInput2"] = {
    category = CATEGORIES.LTYP,
    description = "The ratio of {GAS:LiquidHydrazine} in device's Input2 Atmosphere",
  },
  ["RatioLiquidHydrazineOutput"] = {
    category = CATEGORIES.LTYP,
    description = "The ratio of {GAS:LiquidHydrazine} in device's Output Atmosphere",
  },
  ["RatioLiquidHydrazineOutput2"] = {
    category = CATEGORIES.LTYP,
    description = "The ratio of {GAS:LiquidHydrazine} in device's Output2 Atmopshere",
  },
  ["RatioLiquidHydrochloricAcid"] = {
    category = CATEGORIES.LTYP,
    description = "The ratio of {GAS:LiquidHydrochloricAcid} in device's Atmosphere",
  },
  ["RatioLiquidHydrochloricAcidInput"] = {
    category = CATEGORIES.LTYP,
    description = "The ratio of {GAS:LiquidHydrogen} in device's Input Atmosphere",
  },
  ["RatioLiquidHydrochloricAcidInput2"] = {
    category = CATEGORIES.LTYP,
    description = "The ratio of {GAS:LiquidHydrogen} in device's Input2 Atmosphere",
  },
  ["RatioLiquidHydrochloricAcidOutput"] = {
    category = CATEGORIES.LTYP,
    description = "The ratio of {GAS:LiquidHydrogen} in device's Output Atmosphere",
  },
  ["RatioLiquidHydrochloricAcidOutput2"] = {
    category = CATEGORIES.LTYP,
    description = "The ratio of {GAS:LiquidHydrogen} in device's Output2 Atmopshere",
  },
  ["RatioLiquidHydrogen"] = {
    category = CATEGORIES.LTYP,
    description = "The ratio of {GAS:LiquidHydrogen} in device's Atmopshere",
  },
  ["RatioLiquidHydrogenInput"] = {
    category = CATEGORIES.LTYP,
    description = "The ratio of {GAS:LiquidHydrogen} in device's Input Atmosphere",
  },
  ["RatioLiquidHydrogenInput2"] = {
    category = CATEGORIES.LTYP,
    description = "The ratio of {GAS:LiquidHydrogen} in device's Input2 Atmosphere",
  },
  ["RatioLiquidHydrogenOutput"] = {
    category = CATEGORIES.LTYP,
    description = "The ratio of {GAS:LiquidHydrogen} in device's Output Atmosphere",
  },
  ["RatioLiquidHydrogenOutput2"] = {
    category = CATEGORIES.LTYP,
    description = "The ratio of {GAS:LiquidHydrogen} in device's Output2 Atmopshere",
  },
  ["RatioLiquidMethane"] = {
    category = CATEGORIES.LTYP,
    description = "The ratio of {GAS:LiquidMethane} in device's Atmosphere",
  },
  ["RatioLiquidMethaneInput"] = {
    category = CATEGORIES.LTYP,
    description = "The ratio of {GAS:LiquidMethane} in device's Input Atmosphere",
  },
  ["RatioLiquidMethaneInput2"] = {
    category = CATEGORIES.LTYP,
    description = "The ratio of {GAS:LiquidMethane} in device's Input2 Atmosphere",
  },
  ["RatioLiquidMethaneOutput"] = {
    category = CATEGORIES.LTYP,
    description = "The ratio of {GAS:LiquidMethane} in device's Output Atmosphere",
  },
  ["RatioLiquidMethaneOutput2"] = {
    category = CATEGORIES.LTYP,
    description = "The ratio of {GAS:LiquidMethane} in device's Output2 Atmopshere",
  },
  ["RatioLiquidNitrogen"] = {
    category = CATEGORIES.LTYP,
    description = "The ratio of {GAS:LiquidNitrogen} in device atmosphere",
  },
  ["RatioLiquidNitrogenInput"] = {
    category = CATEGORIES.LTYP,
    description = "The ratio of {GAS:LiquidNitrogen} in device's input network",
  },
  ["RatioLiquidNitrogenInput2"] = {
    category = CATEGORIES.LTYP,
    description = "The ratio of {GAS:LiquidNitrogen} in device's Input2 network",
  },
  ["RatioLiquidNitrogenOutput"] = {
    category = CATEGORIES.LTYP,
    description = "The ratio of {GAS:LiquidNitrogen} in device's Output network",
  },
  ["RatioLiquidNitrogenOutput2"] = {
    category = CATEGORIES.LTYP,
    description = "The ratio of {GAS:LiquidNitrogen} in device's Output2 network",
  },
  ["RatioLiquidNitrousOxide"] = {
    category = CATEGORIES.LTYP,
    description = "The ratio of {GAS:LiquidNitrousOxide} in device's Atmosphere",
  },
  ["RatioLiquidNitrousOxideInput"] = {
    category = CATEGORIES.LTYP,
    description = "The ratio of {GAS:LiquidNitrousOxide} in device's Input Atmosphere",
  },
  ["RatioLiquidNitrousOxideInput2"] = {
    category = CATEGORIES.LTYP,
    description = "The ratio of {GAS:LiquidNitrousOxide} in device's Input2 Atmosphere",
  },
  ["RatioLiquidNitrousOxideOutput"] = {
    category = CATEGORIES.LTYP,
    description = "The ratio of {GAS:LiquidNitrousOxide} in device's Output Atmosphere",
  },
  ["RatioLiquidNitrousOxideOutput2"] = {
    category = CATEGORIES.LTYP,
    description = "The ratio of {GAS:LiquidNitrousOxide} in device's Output2 Atmopshere",
  },
  ["RatioLiquidOxygen"] = {
    category = CATEGORIES.LTYP,
    description = "The ratio of {GAS:LiquidOxygen} in device's Atmosphere",
  },
  ["RatioLiquidOxygenInput"] = {
    category = CATEGORIES.LTYP,
    description = "The ratio of {GAS:LiquidOxygen} in device's Input Atmosphere",
  },
  ["RatioLiquidOxygenInput2"] = {
    category = CATEGORIES.LTYP,
    description = "The ratio of {GAS:LiquidOxygen} in device's Input2 Atmosphere",
  },
  ["RatioLiquidOxygenOutput"] = {
    category = CATEGORIES.LTYP,
    description = "The ratio of {GAS:LiquidOxygen} in device's Output Atmosphere",
  },
  ["RatioLiquidOxygenOutput2"] = {
    category = CATEGORIES.LTYP,
    description = "The ratio of {GAS:LiquidOxygen} in device's Output2 Atmopshere",
  },
  ["RatioLiquidOzone"] = {
    category = CATEGORIES.LTYP,
    description = "The ratio of {GAS:LiquidOzone} in device's Atmosphere",
  },
  ["RatioLiquidOzoneInput"] = {
    category = CATEGORIES.LTYP,
    description = "The ratio of {GAS:LiquidOzone} in device's Input Atmosphere",
  },
  ["RatioLiquidOzoneInput2"] = {
    category = CATEGORIES.LTYP,
    description = "The ratio of {GAS:LiquidOzone} in device's Input2 Atmosphere",
  },
  ["RatioLiquidOzoneOutput"] = {
    category = CATEGORIES.LTYP,
    description = "The ratio of {GAS:LiquidOzone} in device's Output Atmosphere",
  },
  ["RatioLiquidOzoneOutput2"] = {
    category = CATEGORIES.LTYP,
    description = "The ratio of {GAS:LiquidOzone} in device's Output2 Atmopshere",
  },
  ["RatioLiquidPollutant"] = {
    category = CATEGORIES.LTYP,
    description = "The ratio of {GAS:LiquidPollutant} in device's Atmosphere",
  },
  ["RatioLiquidPollutantInput"] = {
    category = CATEGORIES.LTYP,
    description = "The ratio of {GAS:LiquidPollutant} in device's Input Atmosphere",
  },
  ["RatioLiquidPollutantInput2"] = {
    category = CATEGORIES.LTYP,
    description = "The ratio of {GAS:LiquidPollutant} in device's Input2 Atmosphere",
  },
  ["RatioLiquidPollutantOutput"] = {
    category = CATEGORIES.LTYP,
    description = "The ratio of {GAS:LiquidPollutant} in device's Output Atmosphere",
  },
  ["RatioLiquidPollutantOutput2"] = {
    category = CATEGORIES.LTYP,
    description = "The ratio of {GAS:LiquidPollutant} in device's Output2 Atmopshere",
  },
  ["RatioLiquidSilanol"] = {
    category = CATEGORIES.LTYP,
    description = "The ratio of {GAS:LiquidSilanol} in device's Atmosphere",
  },
  ["RatioLiquidSilanolInput"] = {
    category = CATEGORIES.LTYP,
    description = "The ratio of {GAS:LiquidSilanol} in device's Input Atmosphere",
  },
  ["RatioLiquidSilanolInput2"] = {
    category = CATEGORIES.LTYP,
    description = "The ratio of {GAS:LiquidSilanol} in device's Input2 Atmosphere",
  },
  ["RatioLiquidSilanolOutput"] = {
    category = CATEGORIES.LTYP,
    description = "The ratio of {GAS:LiquidSilanol} in device's Output Atmosphere",
  },
  ["RatioLiquidSilanolOutput2"] = {
    category = CATEGORIES.LTYP,
    description = "The ratio of {GAS:LiquidSilanol} in device's Output2 Atmopshere",
  },
  ["RatioLiquidSodiumChloride"] = {
    category = CATEGORIES.LTYP,
    description = "The ratio of {GAS:LiquidSodiumChloride} in device's Atmosphere",
  },
  ["RatioLiquidSodiumChlorideInput"] = {
    category = CATEGORIES.LTYP,
    description = "The ratio of {GAS:LiquidSodiumChloride} in device's Input Atmosphere",
  },
  ["RatioLiquidSodiumChlorideInput2"] = {
    category = CATEGORIES.LTYP,
    description = "The ratio of {GAS:LiquidSodiumChloride} in device's Input2 Atmosphere",
  },
  ["RatioLiquidSodiumChlorideOutput"] = {
    category = CATEGORIES.LTYP,
    description = "The ratio of {GAS:LiquidSodiumChloride} in device's Output Atmosphere",
  },
  ["RatioLiquidSodiumChlorideOutput2"] = {
    category = CATEGORIES.LTYP,
    description = "The ratio of {GAS:LiquidSodiumChloride} in device's Output2 Atmopshere",
  },
  ["RatioMethane"] = {
    category = CATEGORIES.LTYP,
    description = "The ratio of {GAS:Methane} in device atmosphere",
  },
  ["RatioMethaneInput"] = {
    category = CATEGORIES.LTYP,
    description = "The ratio of {GAS:Methane} in device's input network",
  },
  ["RatioMethaneInput2"] = {
    category = CATEGORIES.LTYP,
    description = "The ratio of {GAS:Methane} in device's Input2 network",
  },
  ["RatioMethaneOutput"] = {
    category = CATEGORIES.LTYP,
    description = "The ratio of {GAS:Methane} in device's Output network",
  },
  ["RatioMethaneOutput2"] = {
    category = CATEGORIES.LTYP,
    description = "The ratio of {GAS:Methane} in device's Output2 network",
  },
  ["RatioNitrogen"] = {
    category = CATEGORIES.LTYP,
    description = "The ratio of nitrogen in device atmosphere",
  },
  ["RatioNitrogenInput"] = {
    category = CATEGORIES.LTYP,
    description = "The ratio of nitrogen in device's input network",
  },
  ["RatioNitrogenInput2"] = {
    category = CATEGORIES.LTYP,
    description = "The ratio of nitrogen in device's Input2 network",
  },
  ["RatioNitrogenOutput"] = {
    category = CATEGORIES.LTYP,
    description = "The ratio of nitrogen in device's Output network",
  },
  ["RatioNitrogenOutput2"] = {
    category = CATEGORIES.LTYP,
    description = "The ratio of nitrogen in device's Output2 network",
  },
  ["RatioNitrousOxide"] = {
    category = CATEGORIES.LTYP,
    description = "The ratio of {GAS:NitrousOxide} in device atmosphere",
  },
  ["RatioNitrousOxideInput"] = {
    category = CATEGORIES.LTYP,
    description = "The ratio of {GAS:NitrousOxide} in device's input network",
  },
  ["RatioNitrousOxideInput2"] = {
    category = CATEGORIES.LTYP,
    description = "The ratio of {GAS:NitrousOxide} in device's Input2 network",
  },
  ["RatioNitrousOxideOutput"] = {
    category = CATEGORIES.LTYP,
    description = "The ratio of {GAS:NitrousOxide} in device's Output network",
  },
  ["RatioNitrousOxideOutput2"] = {
    category = CATEGORIES.LTYP,
    description = "The ratio of {GAS:NitrousOxide} in device's Output2 network",
  },
  ["RatioOxygen"] = {
    category = CATEGORIES.LTYP,
    description = "The ratio of oxygen in device atmosphere",
  },
  ["RatioOxygenInput"] = {
    category = CATEGORIES.LTYP,
    description = "The ratio of oxygen in device's input network",
  },
  ["RatioOxygenInput2"] = {
    category = CATEGORIES.LTYP,
    description = "The ratio of oxygen in device's Input2 network",
  },
  ["RatioOxygenOutput"] = {
    category = CATEGORIES.LTYP,
    description = "The ratio of oxygen in device's Output network",
  },
  ["RatioOxygenOutput2"] = {
    category = CATEGORIES.LTYP,
    description = "The ratio of oxygen in device's Output2 network",
  },
  ["RatioOzone"] = {
    category = CATEGORIES.LTYP,
    description = "The ratio of {GAS:Ozone} in device's Atmosphere",
  },
  ["RatioOzoneInput"] = {
    category = CATEGORIES.LTYP,
    description = "The ratio of {GAS:Ozone} in device's input network",
  },
  ["RatioOzoneInput2"] = {
    category = CATEGORIES.LTYP,
    description = "The ratio of {GAS:Ozone} in device's Input2 network",
  },
  ["RatioOzoneOutput"] = {
    category = CATEGORIES.LTYP,
    description = "The ratio of {GAS:Ozone} in device's Output network",
  },
  ["RatioOzoneOutput2"] = {
    category = CATEGORIES.LTYP,
    description = "The ratio of {GAS:Ozone} in device's Output2 network",
  },
  ["RatioPollutant"] = {
    category = CATEGORIES.LTYP,
    description = "The ratio of pollutant in device atmosphere",
  },
  ["RatioPollutantInput"] = {
    category = CATEGORIES.LTYP,
    description = "The ratio of pollutant in device's input network",
  },
  ["RatioPollutantInput2"] = {
    category = CATEGORIES.LTYP,
    description = "The ratio of pollutant in device's Input2 network",
  },
  ["RatioPollutantOutput"] = {
    category = CATEGORIES.LTYP,
    description = "The ratio of pollutant in device's Output network",
  },
  ["RatioPollutantOutput2"] = {
    category = CATEGORIES.LTYP,
    description = "The ratio of pollutant in device's Output2 network",
  },
  ["RatioPollutedWater"] = {
    category = CATEGORIES.LTYP,
    description = "The ratio of polluted water in device atmosphere",
  },
  ["RatioSilanol"] = {
    category = CATEGORIES.LTYP,
    description = "The ratio of {GAS:Silanol} in device's Atmosphere",
  },
  ["RatioSilanolInput"] = {
    category = CATEGORIES.LTYP,
    description = "The ratio of {GAS:Silanol} in device's input network",
  },
  ["RatioSilanolInput2"] = {
    category = CATEGORIES.LTYP,
    description = "The ratio of {GAS:Silanol} in device's Input2 network",
  },
  ["RatioSilanolOutput"] = {
    category = CATEGORIES.LTYP,
    description = "The ratio of {GAS:Silanol} in device's Output network",
  },
  ["RatioSilanolOutput2"] = {
    category = CATEGORIES.LTYP,
    description = "The ratio of {GAS:Silanol} in device's Output2 network",
  },
  ["RatioSteam"] = {
    category = CATEGORIES.LTYP,
    description = "The ratio of {GAS:Steam} in device's Atmosphere",
  },
  ["RatioSteamInput"] = {
    category = CATEGORIES.LTYP,
    description = "The ratio of {GAS:Steam} in device's Input Atmosphere",
  },
  ["RatioSteamInput2"] = {
    category = CATEGORIES.LTYP,
    description = "The ratio of {GAS:Steam} in device's Input2 Atmosphere",
  },
  ["RatioSteamOutput"] = {
    category = CATEGORIES.LTYP,
    description = "The ratio of {GAS:Steam} in device's Output Atmosphere",
  },
  ["RatioSteamOutput2"] = {
    category = CATEGORIES.LTYP,
    description = "The ratio of {GAS:Steam} in device's Output2 Atmopshere",
  },
  ["RatioWater"] = {
    category = CATEGORIES.LTYP,
    description = "The ratio of water in device atmosphere",
  },
  ["RatioWaterInput"] = {
    category = CATEGORIES.LTYP,
    description = "The ratio of water in device's input network",
  },
  ["RatioWaterInput2"] = {
    category = CATEGORIES.LTYP,
    description = "The ratio of water in device's Input2 network",
  },
  ["RatioWaterOutput"] = {
    category = CATEGORIES.LTYP,
    description = "The ratio of water in device's Output network",
  },
  ["RatioWaterOutput2"] = {
    category = CATEGORIES.LTYP,
    description = "The ratio of water in device's Output2 network",
  },
  ["Reagents"] = {
    category = CATEGORIES.LTYP,
    description = "Total number of reagents recorded by the device",
  },
  ["RecipeHash"] = {
    category = CATEGORIES.LTYP,
    description = "Current hash of the recipe the device is set to produce",
  },
  ["ReferenceId"] = {
    category = CATEGORIES.LTYP,
    description = "Unique Reference Identifier for this object",
  },
  ["RequestHash"] = {
    category = CATEGORIES.LTYP,
    description = "When set to the unique identifier, requests an item of the provided type from the device",
  },
  ["RequiredPower"] = {
    category = CATEGORIES.LTYP,
    description = "Idle operating power quantity, does not necessarily include extra demand power",
  },
  ["Richness"] = {
    category = CATEGORIES.LTYP,
    description = "The richness of the rocket's target site's mine-able deposit.",
  },
  ["Rpm"] = {
    category = CATEGORIES.LTYP,
    description = "The number of revolutions per minute that the device's spinning mechanism is doing",
  },
  ["SeedingRatio"] = {
    category = CATEGORIES.LTYP,
    description = "How far the plant is towards seeding represented as a fraction between 0 and 1, with 1 being seeding and will supply seeds when harvested.",
  },
  ["SemiMajorAxis"] = {
    category = CATEGORIES.LTYP,
    description = "The longest radius of an elliptical orbit in astronomical units, measuring half the major axis. Determines the size of the orbit.",
  },
  ["Setting"] = {
    category = CATEGORIES.LTYP,
    description = "A variable setting that can be read or written, depending on the device",
  },
  ["SettingInput"] = {
    category = CATEGORIES.LTYP,
    description = "The input setting for the device",
  },
  ["SettingInputHash"] = {
    category = CATEGORIES.LTYP,
    description = "The input setting for the device",
  },
  ["SettingOutput"] = {
    category = CATEGORIES.LTYP,
    description = "The output setting for the device",
  },
  ["SettingOutputHash"] = {
    category = CATEGORIES.LTYP,
    description = "The output setting for the device",
  },
  ["SignalID"] = {
    category = CATEGORIES.LTYP,
    description = "Returns the contact ID of the strongest signal from this Satellite",
  },
  ["SignalStrength"] = {
    category = CATEGORIES.LTYP,
    description = "Returns the degree offset of the strongest contact",
  },
  ["Sites"] = {
    category = CATEGORIES.LTYP,
    description = "The number of Sites that have been discovered at the rockets target Space Map location.",
  },
  ["Size"] = {
    category = CATEGORIES.LTYP,
    description = "The size of the rocket's target site's mine-able deposit.",
  },
  ["SizeX"] = {
    category = CATEGORIES.LTYP,
    description = "Size on the X (right) axis of the object in largeGrids (a largeGrid is 2meters)",
  },
  ["SizeY"] = {
    category = CATEGORIES.LTYP,
    description = "Size on the Y(Up) axis of the object in largeGrids (a largeGrid is 2meters)",
  },
  ["SizeZ"] = {
    category = CATEGORIES.LTYP,
    description = "Size on the Z(Forward) axis of the object in largeGrids (a largeGrid is 2meters)",
  },
  ["SolarAngle"] = {
    category = CATEGORIES.LTYP,
    description = "Solar angle of the device",
  },
  ["SolarConstant"] = {
    category = CATEGORIES.LTYP,
    description = "Solar constant of the world",
  },
  ["SolarIrradiance"] = {
    category = CATEGORIES.LTYP,
    description = "The current solar irradiance.",
  },
  ["SoundAlert"] = {
    category = CATEGORIES.LTYP,
    description = "Plays a sound alert on the devices speaker",
  },
  ["Stress"] = {
    category = CATEGORIES.LTYP,
    description = "Machines get stressed when working hard. When Stress reaches 100 the machine will automatically shut down",
  },
  ["Survey"] = {
    category = CATEGORIES.LTYP,
    description = "Progress status of Survey scan at the rocket's target Space Map Location. Returns a normalised value where 100% surveyed is equal to 1. If Survey scan is not available returns -1.",
  },
  ["TargetPadIndex"] = {
    category = CATEGORIES.LTYP,
    description = "The index of the trader landing pad on this devices data network that it will try to call a trader in to land",
  },
  ["TargetPrefabHash"] = {
    category = CATEGORIES.LTYP,
    description = "The prefab",
  },
  ["TargetSlotIndex"] = {
    category = CATEGORIES.LTYP,
    description = "The slot index that the target device that this device will try to interact with",
  },
  ["TargetX"] = {
    category = CATEGORIES.LTYP,
    description = "The target position in X dimension in world coordinates",
  },
  ["TargetY"] = {
    category = CATEGORIES.LTYP,
    description = "The target position in Y dimension in world coordinates",
  },
  ["TargetZ"] = {
    category = CATEGORIES.LTYP,
    description = "The target position in Z dimension in world coordinates",
  },
  ["Temperature"] = {
    category = CATEGORIES.LTYP,
    description = "The current temperature reading of the device",
  },
  ["TemperatureDifferentialEfficiency"] = {
    category = CATEGORIES.LTYP,
    description = "How the difference between the input pipe and waste pipe temperatures effect the machines efficiency",
  },
  ["TemperatureExternal"] = {
    category = CATEGORIES.LTYP,
    description = "The temperature of the outside of the device, usually the world atmosphere surrounding it",
  },
  ["TemperatureInput"] = {
    category = CATEGORIES.LTYP,
    description = "The current temperature reading of the device's Input Network",
  },
  ["TemperatureInput2"] = {
    category = CATEGORIES.LTYP,
    description = "The current temperature reading of the device's Input2 Network",
  },
  ["TemperatureOutput"] = {
    category = CATEGORIES.LTYP,
    description = "The current temperature reading of the device's Output Network",
  },
  ["TemperatureOutput2"] = {
    category = CATEGORIES.LTYP,
    description = "The current temperature reading of the device's Output2 Network",
  },
  ["TemperatureSetting"] = {
    category = CATEGORIES.LTYP,
    description = "The current setting for the internal temperature of the object (e.g. the Hardsuit A/C)",
  },
  ["Throttle"] = {
    category = CATEGORIES.LTYP,
    description = "Increases the rate at which the machine works (range: 0-100)",
  },
  ["Thrust"] = {
    category = CATEGORIES.LTYP,
    description = "Total current thrust of all rocket engines on the rocket in Newtons.",
  },
  ["ThrustToWeight"] = {
    category = CATEGORIES.LTYP,
    description = "Ratio of thrust to weight of rocket.",
  },
  ["Time"] = {
    category = CATEGORIES.LTYP,
    description = "Time",
  },
  ["TimeToDestination"] = {
    category = CATEGORIES.LTYP,
    description = "Estimated time in seconds until rocket arrives at target destination.",
  },
  ["TotalMoles"] = {
    category = CATEGORIES.LTYP,
    description = "Returns the total moles of the device",
  },
  ["TotalMolesInput"] = {
    category = CATEGORIES.LTYP,
    description = "Returns the total moles of the device's Input Network",
  },
  ["TotalMolesInput2"] = {
    category = CATEGORIES.LTYP,
    description = "Returns the total moles of the device's Input2 Network",
  },
  ["TotalMolesOutput"] = {
    category = CATEGORIES.LTYP,
    description = "Returns the total moles of the device's Output Network",
  },
  ["TotalMolesOutput2"] = {
    category = CATEGORIES.LTYP,
    description = "Returns the total moles of the device's Output2 Network",
  },
  ["TotalSlots"] = {
    category = CATEGORIES.LTYP,
    description = "The total number of slots available in this object.",
  },
  ["TrueAnomaly"] = {
    category = CATEGORIES.LTYP,
    description = "An angular parameter that defines the position of a body moving along a Keplerian orbit. It is the angle between the direction of periapsis and the current position of the body, as seen from the main focus of the ellipse (the point around which the object orbits).",
  },
  ["Unknown"] = {
    category = CATEGORIES.LTYP,
    description = "No description available",
  },
  ["VelocityMagnitude"] = {
    category = CATEGORIES.LTYP,
    description = "The current magnitude of the velocity vector",
  },
  ["VelocityRelativeX"] = {
    category = CATEGORIES.LTYP,
    description = "The current velocity X relative to the forward vector of this",
  },
  ["VelocityRelativeY"] = {
    category = CATEGORIES.LTYP,
    description = "The current velocity Y relative to the forward vector of this",
  },
  ["VelocityRelativeZ"] = {
    category = CATEGORIES.LTYP,
    description = "The current velocity Z relative to the forward vector of this",
  },
  ["VelocityX"] = {
    category = CATEGORIES.LTYP,
    description = "The world velocity of the entity in the X axis",
  },
  ["VelocityY"] = {
    category = CATEGORIES.LTYP,
    description = "The world velocity of the entity in the Y axis",
  },
  ["VelocityZ"] = {
    category = CATEGORIES.LTYP,
    description = "The world velocity of the entity in the Z axis",
  },
  ["Vertical"] = {
    category = CATEGORIES.LTYP,
    description = "Vertical setting of the device",
  },
  ["VerticalRatio"] = {
    category = CATEGORIES.LTYP,
    description = "Radio of vertical setting for device",
  },
  ["Volume"] = {
    category = CATEGORIES.LTYP,
    description = "Returns the device atmosphere volume",
  },
  ["VolumeOfLiquid"] = {
    category = CATEGORIES.LTYP,
    description = "The total volume of all liquids in Liters in the atmosphere",
  },
  ["WattsReachingContact"] = {
    category = CATEGORIES.LTYP,
    description = "The amount of watts actually hitting the contact. This is effected by the power of the dish and how far off-axis the dish is from the contact vector",
  },
  ["Weight"] = {
    category = CATEGORIES.LTYP,
    description = "Weight of Rocket in Newtons (Including fuel and cargo).",
  },
  ["WorkingGasEfficiency"] = {
    category = CATEGORIES.LTYP,
    description = "The Working Gas Efficiency reported by the machine, as a float between 0 and 1",
  },
}

---@type table<string, Type>
M.logic_slot_types = {
  ["Charge"] = {
    category = CATEGORIES.LSTY,
    description = "Returns current energy charge the slot occupant is holding",
  },
  ["ChargeRatio"] = {
    category = CATEGORIES.LSTY,
    description = "Returns current energy charge the slot occupant is holding as a ratio between 0 and 1 of its maximum.",
  },
  ["Class"] = {
    category = CATEGORIES.LSTY,
    description = "Returns an integer representing the class of the object.",
  },
  ["Damage"] = {
    category = CATEGORIES.LSTY,
    description = "The damage percentage of the item in the slot.",
  },
  ["Efficiency"] = {
    category = CATEGORIES.LSTY,
    description = "The growth efficiency of the plant in the slot",
  },
  ["FilterType"] = {
    category = CATEGORIES.LSTY,
    description = "The type of the element of the filter",
  },
  ["FreeSlots"] = {
    category = CATEGORIES.LSTY,
    description = "The number of free slots available in this object.",
  },
  ["Growth"] = {
    category = CATEGORIES.LSTY,
    description = "The growth stage of a plant in the slot (0.0 to 1.0).",
  },
  ["HarvestedHash"] = {
    category = CATEGORIES.LSTY,
    description = "Returns the Prefab Hash of what will be harvested from the plant. 0 if the plant is not mature.",
  },
  ["Health"] = {
    category = CATEGORIES.LSTY,
    description = "The health of a plant/entity in the slot.",
  },
  ["LineNumber"] = {
    category = CATEGORIES.LSTY,
    description = "The line number of current execution for an integrated circuit running on this device. While this number can be written, use with caution",
  },
  ["Lock"] = {
    category = CATEGORIES.LSTY,
    description = "1 if device is locked, otherwise 0, can be set in most devices and prevents the user from access the values",
  },
  ["Mature"] = {
    category = CATEGORIES.LSTY,
    description = "Returns 1 if the plant in this slot is mature, 0 if its not.",
  },
  ["MaturityRatio"] = {
    category = CATEGORIES.LSTY,
    description = "How far the plant is towards maturity represented as a fraction between 0 and 1, with 1 being mature and ready for harvest.",
  },
  ["MaxQuantity"] = {
    category = CATEGORIES.LSTY,
    description = "Returns the max stack size of the item in the slot.",
  },
  ["Mode"] = {
    category = CATEGORIES.LSTY,
    description = "Integer for mode state, different devices will have different mode states available to them",
  },
  ["OccupantHash"] = {
    category = CATEGORIES.LSTY,
    description = "The PrefabHash of the item currently in the slot.",
  },
  ["Occupied"] = {
    category = CATEGORIES.LSTY,
    description = "Returns 1 if the slot contains an item, 0 if empty.",
  },
  ["On"] = {
    category = CATEGORIES.LSTY,
    description = "The current state of the device in the slot, 0 for off, 1 for on",
  },
  ["Open"] = {
    category = CATEGORIES.LSTY,
    description = "1 if device is open, otherwise 0",
  },
  ["PrefabHash"] = {
    category = CATEGORIES.LSTY,
    description = "Returns the hash of the structure in the slot.",
  },
  ["Pressure"] = {
    category = CATEGORIES.LSTY,
    description = "Returns the pressure of the slot occupant's internal atmosphere",
  },
  ["PressureAir"] = {
    category = CATEGORIES.LSTY,
    description = "Returns the pressure in the air tank of the jetpack in this slot",
  },
  ["PressureWaste"] = {
    category = CATEGORIES.LSTY,
    description = "Returns the pressure in the waste tank of the jetpack in this slot",
  },
  ["Quantity"] = {
    category = CATEGORIES.LSTY,
    description = "Returns the current quantity, such as stack size, of the item in the slot",
  },
  ["ReferenceId"] = {
    category = CATEGORIES.LSTY,
    description = "Unique Reference Identifier for this object",
  },
  ["Seeding"] = {
    category = CATEGORIES.LSTY,
    description = "Whether a plant is seeding (ready to harvest seeds from). Returns 1 if seeding or 0 if not.",
  },
  ["SeedingRatio"] = {
    category = CATEGORIES.LSTY,
    description = "How far the plant is towards seeding represented as a fraction between 0 and 1, with 1 being mature and ready for harvest.",
  },
  ["SortingClass"] = {
    category = CATEGORIES.LSTY,
    description = "Returns an integer representing the sorting class of the object in the slot.",
  },
  ["Temperature"] = {
    category = CATEGORIES.LSTY,
    description = "Returns the temperature of the slot occupant's internal atmosphere",
  },
  ["TotalSlots"] = {
    category = CATEGORIES.LSTY,
    description = "The total number of slots available in this object.",
  },
  ["Volume"] = {
    category = CATEGORIES.LSTY,
    description = "The volume capacity of the slot.",
  },
}

return M
