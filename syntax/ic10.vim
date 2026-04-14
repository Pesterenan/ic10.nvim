" Vim syntax file
" Language: Stationeers IC10 assembly
" Maintainer: Renan Torres
" Latest Revision: 13 April 2026

if exists("b:current_syntax")
  finish
endif

syn match ic10Comment    "#\ .*$"

" Grupos Atômicos (ordem define prioridade)
" Ordem: específicos primeiro, genérico por último

" Genérico
syn match ic10AnyArg        contained /[^[:space:]]\+/
syn match ic10LabelArg      contained "\<[a-zA-Z][a-zA-Z0-9.]*\>"

" Constants
" System
syn match ic10ConstSystem contained "\v<(MaxInstructionCount|MaxRegisterCount|StackSize)>"
" Batch Mode
syn match ic10ConstBatch     contained "\v<(Average|Sum|Minimum|Maximum)>"
" Reagent Mode
syn keyword ic10ConstReagent Contents Required Recipe
" Logic Types
syn keyword ic10ConstLogicTypes Acceleration Activate AirRelease AlignmentError Apex AutoLand AutoShutOff BestContactFilter Bpm BurnTimeRemaining
syn keyword ic10ConstLogicTypes Bypass CelestialHash CelestialParentHash Channel Charge Chart ChartedNavPoints ClearMemory Color Combustion
syn keyword ic10ConstLogicTypes CombustionInput CombustionInput2 CombustionLimiter CombustionOutput CombustionOutput2 CompletionRatio ContactSlotIndex ContactTypeId CurrentCode Density
syn keyword ic10ConstLogicTypes DestinationCode Discover DistanceAu DistanceKm DrillCondition DryMass Eccentricity ElevatorLevel ElevatorSpeed EntityState
syn keyword ic10ConstLogicTypes EnvironmentEfficiency Error ExportCount ExportQuantity Extended Filtration Flush ForceWrite Forward FreeSlots
syn keyword ic10ConstLogicTypes Harvest Horizontal HorizontalRatio Idle ImportCount ImportQuantity Inclination Index InterrogationProgress LineNumber
syn keyword ic10ConstLogicTypes Lock Mass MaturityRatio Maximum MinedQuantity MinWattsToContact Mode NameHash NavPoints None
syn keyword ic10ConstLogicTypes On Open OperationalTemperatureEfficiency Orientation Output OverShootTarget Period Plant PositionX PositionY
syn keyword ic10ConstLogicTypes PositionZ Power PowerActual PowerGeneration PowerPotential PowerRequired PrefabHash Pressure PressureEfficiency PressureExternal
syn keyword ic10ConstLogicTypes PressureInput PressureInput2 PressureInternal PressureOutput PressureOutput2 PressureSetting Progress Quantity Ratio RatioCarbonDioxide
syn keyword ic10ConstLogicTypes RatioCarbonDioxideInput RatioCarbonDioxideInput2 RatioCarbonDioxideOutput RatioCarbonDioxideOutput2 RatioHelium RatioHeliumInput RatioHeliumInput2 RatioHeliumOutput RatioHeliumOutput2 RatioHydrazine
syn keyword ic10ConstLogicTypes RatioHydrazineInput RatioHydrazineInput2 RatioHydrazineOutput RatioHydrazineOutput2 RatioHydrochloricAcid RatioHydrochloricAcidInput RatioHydrochloricAcidInput2 RatioHydrochloricAcidOutput RatioHydrochloricAcidOutput2 RatioHydrogen
syn keyword ic10ConstLogicTypes RatioHydrogenInput RatioHydrogenInput2 RatioHydrogenOutput RatioHydrogenOutput2 RatioLiquidAlcohol RatioLiquidAlcoholInput RatioLiquidAlcoholInput2 RatioLiquidAlcoholOutput RatioLiquidAlcoholOutput2 RatioLiquidCarbonDioxide
syn keyword ic10ConstLogicTypes RatioLiquidCarbonDioxideInput RatioLiquidCarbonDioxideInput2 RatioLiquidCarbonDioxideOutput RatioLiquidCarbonDioxideOutput2 RatioLiquidHydrazine RatioLiquidHydrazineInput RatioLiquidHydrazineInput2 RatioLiquidHydrazineOutput RatioLiquidHydrazineOutput2 RatioLiquidHydrochloricAcid
syn keyword ic10ConstLogicTypes RatioLiquidHydrochloricAcidInput RatioLiquidHydrochloricAcidInput2 RatioLiquidHydrochloricAcidOutput RatioLiquidHydrochloricAcidOutput2 RatioLiquidHydrogen RatioLiquidHydrogenInput RatioLiquidHydrogenInput2 RatioLiquidHydrogenOutput RatioLiquidHydrogenOutput2 RatioLiquidMethane
syn keyword ic10ConstLogicTypes RatioLiquidMethaneInput RatioLiquidMethaneInput2 RatioLiquidMethaneOutput RatioLiquidMethaneOutput2 RatioLiquidNitrogen RatioLiquidNitrogenInput RatioLiquidNitrogenInput2 RatioLiquidNitrogenOutput RatioLiquidNitrogenOutput2 RatioLiquidNitrousOxide
syn keyword ic10ConstLogicTypes RatioLiquidNitrousOxideInput RatioLiquidNitrousOxideInput2 RatioLiquidNitrousOxideOutput RatioLiquidNitrousOxideOutput2 RatioLiquidOxygen RatioLiquidOxygenInput RatioLiquidOxygenInput2 RatioLiquidOxygenOutput RatioLiquidOxygenOutput2 RatioLiquidOzone
syn keyword ic10ConstLogicTypes RatioLiquidOzoneInput RatioLiquidOzoneInput2 RatioLiquidOzoneOutput RatioLiquidOzoneOutput2 RatioLiquidPollutant RatioLiquidPollutantInput RatioLiquidPollutantInput2 RatioLiquidPollutantOutput RatioLiquidPollutantOutput2 RatioLiquidSilanol
syn keyword ic10ConstLogicTypes RatioLiquidSilanolInput RatioLiquidSilanolInput2 RatioLiquidSilanolOutput RatioLiquidSilanolOutput2 RatioLiquidSodiumChloride RatioLiquidSodiumChlorideInput RatioLiquidSodiumChlorideInput2 RatioLiquidSodiumChlorideOutput RatioLiquidSodiumChlorideOutput2 RatioMethane
syn keyword ic10ConstLogicTypes RatioMethaneInput RatioMethaneInput2 RatioMethaneOutput RatioMethaneOutput2 RatioNitrogen RatioNitrogenInput RatioNitrogenInput2 RatioNitrogenOutput RatioNitrogenOutput2 RatioNitrousOxide
syn keyword ic10ConstLogicTypes RatioNitrousOxideInput RatioNitrousOxideInput2 RatioNitrousOxideOutput RatioNitrousOxideOutput2 RatioOxygen RatioOxygenInput RatioOxygenInput2 RatioOxygenOutput RatioOxygenOutput2 RatioOzone
syn keyword ic10ConstLogicTypes RatioOzoneInput RatioOzoneInput2 RatioOzoneOutput RatioOzoneOutput2 RatioPollutant RatioPollutantInput RatioPollutantInput2 RatioPollutantOutput RatioPollutantOutput2 RatioPollutedWater
syn keyword ic10ConstLogicTypes RatioSilanol RatioSilanolInput RatioSilanolInput2 RatioSilanolOutput RatioSilanolOutput2 RatioSteam RatioSteamInput RatioSteamInput2 RatioSteamOutput RatioSteamOutput2
syn keyword ic10ConstLogicTypes RatioWater RatioWaterInput RatioWaterInput2 RatioWaterOutput RatioWaterOutput2 Reagents RecipeHash ReferenceId RequestHash RequiredPower
syn keyword ic10ConstLogicTypes Richness Rpm SeedingRatio SemiMajorAxis Setting SettingInput SettingInputHash SettingOutput SettingOutputHash SignalID
syn keyword ic10ConstLogicTypes SignalStrength Sites Size SizeX SizeY SizeZ SolarAngle SolarConstant SolarIrradiance SoundAlert
syn keyword ic10ConstLogicTypes Stress Survey TargetPadIndex TargetPrefabHash TargetSlotIndex TargetX TargetY TargetZ Temperature TemperatureDifferentialEfficiency
syn keyword ic10ConstLogicTypes TemperatureExternal TemperatureInput TemperatureInput2 TemperatureOutput TemperatureOutput2 TemperatureSetting Throttle Thrust ThrustToWeight Time
syn keyword ic10ConstLogicTypes TimeToDestination TotalMoles TotalMolesInput TotalMolesInput2 TotalMolesOutput TotalMolesOutput2 TotalSlots TrueAnomaly Unknown VelocityMagnitude
syn keyword ic10ConstLogicTypes VelocityRelativeX VelocityRelativeY VelocityRelativeZ VelocityX VelocityY VelocityZ Vertical VerticalRatio Volume VolumeOfLiquid
syn keyword ic10ConstLogicTypes WattsReachingContact Weight WorkingGasEfficiency

" Logic Slot Types
syn keyword ic10ConstSlotTypes Charge ChargeRatio Class Damage Efficiency FilterType FreeSlots Growth
syn keyword ic10ConstSlotTypes HarvestedHash Health LineNumber Lock Mature MaturityRatio MaxQuantity Mode
syn keyword ic10ConstSlotTypes OccupantHash Occupied On Open PrefabHash Pressure PressureAir PressureWaste
syn keyword ic10ConstSlotTypes Quantity ReferenceId Seeding SeedingRatio SortingClass Temperature TotalSlots Volume

syn match ic10LabelDef   "^\s*[a-zA-Z][a-zA-Z0-9.]*:"
syn match ic10RegisterArg   contained "\v<r([0-9]|1[0-5]|a)>|<sp>"
syn match ic10DeviceArg     contained "\v<(d[0-5]|db)>"
syn match ic10NumberArg     contained "\v-?\d+(\.\d+)?"
syn match ic10NumberArg     contained "\v0x[0-9a-fA-F]+"

" Operators

" Branch
syn match ic10BLine "^\s*\<\(beq\|bne\|bge\|ble\|bgt\|blt\)\>\s\+[^[:space:]]\+\s\+[^[:space:]]\+\s\+[^[:space:]]\+" contains=ic10BInstr,ic10NumberArg,ic10RegisterArg,ic10LabelArg,
syn keyword ic10BInstr contained beq bne bge ble bgt blt
hi def link ic10BInstr Function

" Branch Zero
syn match ic10BZLine "^\s*\<\(beqz\|bnez\|bgez\|blez\|bgtz\|bltz\)\>\s\+[^[:space:]]\+\s\+[^[:space:]]\+" contains=ic10BZInstr,ic10NumberArg,ic10RegisterArg,ic10LabelArg,
syn keyword ic10BZInstr contained beqz bnez bgez blez bgtz bltz
hi def link ic10BZInstr Function

" Branch and Link
syn match ic10BALLine "^\s*\<\(beqal\|bneal\|bgeal\|bleal\|bgtal\|bltal\)\>\s\+[^[:space:]]\+\s\+[^[:space:]]\+\s\+[^[:space:]]\+" contains=ic10BALInstr,ic10NumberArg,ic10RegisterArg,ic10LabelArg,
syn keyword ic10BALInstr contained beqal bneal bgeal bleal bgtal bltal
hi def link ic10BALInstr Function

" Branch Zero and Link
syn match ic10BZALLine "^\s*\<\(beqzal\|bnezal\|bgezal\|blezal\|bgtzal\|bltzal\)\>\s\+[^[:space:]]\+\s\+[^[:space:]]\+" contains=ic10BZALInstr,ic10NumberArg,ic10RegisterArg,ic10LabelArg,
syn keyword ic10BZALInstr contained beqzal bnezal bgezal blezal bgtzal bltzal
hi def link ic10BZALInstr Function

" Branch Relative
syn match ic10BRLine "^\s*\<\(breq\|brne\|brge\|brle\|brgt\|brlt\)\>\s\+[^[:space:]]\+\s\+[^[:space:]]\+\s\+[^[:space:]]\+" contains=ic10BRInstr,ic10NumberArg,ic10RegisterArg,ic10LabelArg,
syn keyword ic10BRInstr contained breq brne brge brle brgt brlt
hi def link ic10BRInstr Function

" Branch Relative Zero
syn match ic10BRZLine "^\s*\<\(breqz\|brnez\|brgez\|brlez\|brgtz\|brltz\)\>\s\+[^[:space:]]\+\s\+[^[:space:]]\+" contains=ic10BRZInstr,ic10NumberArg,ic10RegisterArg,ic10ConstLogicTypes,ic10LabelArg,
syn keyword ic10BRZInstr contained breqz brnez brgez brlez brgtz brltz
hi def link ic10BRZInstr Function

" Jump
syn match ic10JumpLine "^\s*\<j\(r\|al\)\?\>\s\+[^[:space:]]\+" contains=ic10JumpInstr,ic10RegisterArg,ic10NumberArg,ic10LabelArg
syn keyword ic10JumpInstr contained j jr jal
hi def link ic10JumpInstr Keyword

" Alias|Define
syn match ic10AliasDefineLine "^\s*\<\(alias\|define\)\>\s\+[^[:space:]]\+\s\+[^[:space:]]\+" contains=ic10AliasDefineInstr,ic10RegisterArg,ic10DeviceArg,ic10NumberArg
syn keyword ic10AliasDefineInstr contained alias define
hi def link ic10AliasDefineInstr Keyword

" No Argument Instructions
syn keyword ic10NoArgInstr hcf yield
hi def link ic10NoArgInstr Keyword

" One Argument Instructions
syn match ic10OneArgLine "^\s*\<\(sleep\|rand\|clrd\?\|p\(eek\|op\|ush\)\)\>\s\+[^[:space:]]\+" contains=ic10OneArgInstr,ic10RegisterArg,ic10NumberArg
syn keyword ic10OneArgInstr contained sleep rand clr clrd peek pop push
hi def link ic10OneArgInstr Keyword

" Two Argument Math Instructions
syn match ic10TwoArgMathLine "^\s*\<\(abs\|ceil\|exp\|floor\|log\|move\|round\|sqrt\|trunc\|acos\|asin\|atan\|cos\|sin\|tan\)\>\s\+[^[:space:]]\+\s\+[^[:space:]]\+" contains=ic10TwoArgMathInstr,ic10RegisterArg,ic10NumberArg
syn keyword ic10TwoArgMathInstr contained abs ceil exp floor log move round sqrt trunc acos asin atan cos sin tan
hi def link ic10TwoArgMathInstr Keyword

" Three Argument Math Instructions
syn match ic10ThreeArgMathLine "^\s*\<\(add\|div\|pow\|max\|min\|mod\|mul\|sub\|atan2\)\>\s\+[^[:space:]]\+\s\+[^[:space:]]\+\s\+[^[:space:]]\+" contains=ic10ThreeArgMathInstr,ic10RegisterArg,ic10NumberArg
syn keyword ic10ThreeArgMathInstr contained add div pow max min mod mul sub atan2
hi def link ic10ThreeArgMathInstr Keyword

" Four Argument Math Instructions
syn match ic10FourArgMathLine "^\s*\<lerp\>\s\+[^[:space:]]\+\s\+[^[:space:]]\+\s\+[^[:space:]]\+\s\+[^[:space:]]\+" contains=ic10FourArgMathInstr,ic10RegisterArg,ic10NumberArg
syn keyword ic10FourArgMathInstr contained lerp
hi def link ic10FourArgMathInstr Keyword

" Stack Device Instructions
syn match ic10StackDeviceLine "^\s*\<\(get\|poke\|put\)\>\s\+[^[:space:]]\+\s\+[^[:space:]]\+\s\+[^[:space:]]\+" contains=ic10StackDeviceInstr,ic10DeviceArg,ic10RegisterArg,ic10NumberArg
syn keyword ic10StackDeviceInstr contained get poke put
hi def link ic10StackDeviceInstr Keyword

" Stack ID Instructions
syn match ic10StackIDLine "^\s*\<\(getd\|\|putd\)\>\s\+[^[:space:]]\+\s\+[^[:space:]]\+\s\+[^[:space:]]\+" contains=ic10StackIDInstr,ic10RegisterArg,ic10NumberArg,ic10LabelArg
syn keyword ic10StackIDInstr contained getd putd
hi def link ic10StackIDInstr Keyword



    "signature = "and [r?] [a] [b]",
    "signature = "nor [r?] [a] [b]",
    "signature = "not [r?] [a]",
    "signature = "or [r?] [a] [b]",
    "signature = "xor [r?] [a] [b]",
    "signature = "ext [r?] [source] [offset] [length]",
    "signature = "ins [r?] [field] [offset] [length]",
    "
    "
    "signature = "select [r?] [a] [b] [c]",
    "signature = "seq [r?] [a] [b]",
    "signature = "sge [r?] [a] [b]",
    "signature = "sgt [r?] [a] [b]",
    "signature = "sla [r?] [a] [b]",
    "signature = "sle [r?] [a] [b]",
    "signature = "sll [r?] [a] [b]",
    "signature = "slt [r?] [a] [b]",
    "signature = "sne [r?] [a] [b]",
    "signature = "sra [r?] [a] [b]",
    "signature = "srl [r?] [a] [b]",
    "signature = "sapz [r?] [a] [b]",
    "signature = "sap [r?] [a] [b] [c]",
    "
    "
    "signature = "l [r?] [d?] [logicType]",
    "signature = "lr [r?] [d?] [reagentMode] [int]",
    "signature = "ls [r?] [d?] [slotIndex] [logicSlotType]",
    "signature = "lb [r?] [deviceHash] [logicType] [mode]",
    "signature = "lbn [r?] [deviceHash] [nameHash] [logicType] [mode]",
    "signature = "lbns [r?] [deviceHash] [nameHash] [slot] [logicType] [mode]",
    "signature = "lbs [r?] [deviceHash] [slot] [logicType] [mode]",
    "signature = "sb [deviceHash] [logicType] [r?]",
    "signature = "sbn [deviceHash] [nameHash] [logicType] [r?]",
    "signature = "sbs [deviceHash] [slot] [logicType] [r?]",
    "signature = "s [d?] [logicType] [r?]",
    "signature = "ss [d?] [slotIndex] [logicSlotType] [r?]",
    "
    "
    "signature = "rmap [r?] [d?] [reagentHash]",

" ========== HIGHLIGHT LINKS FINAIS ==========
hi def link ic10Comment      Comment
hi def link ic10NumberArg    Number
hi def link ic10RegisterArg  Type
hi def link ic10DeviceArg    Special
hi def link ic10LabelDef     Label

" Cores personalizadas (opcional, ajuste ao seu gosto)
hi ic10NumberArg     guifg=#24A09A
hi ic10RegisterArg   guifg=#0067CF
hi ic10DeviceArg     guifg=#00FD00
hi ic10LabelDef   guifg=#841DC7
hi ic10LabelArg   guifg=Violet

let b:current_syntax = "ic10"
