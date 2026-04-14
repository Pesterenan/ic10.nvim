
" Vim syntax file
" Language: Stationeers IC10 assembly
" Maintainer: Renan Torres
" Latest Revision: 14 April 2026

if exists("b:current_syntax")
  finish
endif

" Comments
syn match ic10Comment    "#\ .*$"

" Generic
syn match ic10AnyArg        contained /[^[:space:]]\+/
syn match ic10LabelArg      contained "\<[a-zA-Z][a-zA-Z0-9.]*\>"

" Special
syn region ic10Function start="\(HASH\|STR\)(\"" end="\")" contained

" Constants
" System
syn match ic10ConstSystem   contained "\v<(MaxInstructionCount|MaxRegisterCount|StackSize)>"
" Batch Mode
syn match ic10ConstBatch    contained "\v<(Average|Sum|Minimum|Maximum)>"
" Reagent Mode
syn match ic10ConstReagent  contained "\v<(Contents|Required|Recipe)>"
" Logic Types
syn keyword ic10ConstLogicTypes contained Acceleration Activate AirRelease AlignmentError Apex AutoLand AutoShutOff BestContactFilter Bpm BurnTimeRemaining
syn keyword ic10ConstLogicTypes contained Bypass CelestialHash CelestialParentHash Channel Charge Chart ChartedNavPoints ClearMemory Color Combustion
syn keyword ic10ConstLogicTypes contained CombustionInput CombustionInput2 CombustionLimiter CombustionOutput CombustionOutput2 CompletionRatio ContactSlotIndex ContactTypeId CurrentCode Density
syn keyword ic10ConstLogicTypes contained DestinationCode Discover DistanceAu DistanceKm DrillCondition DryMass Eccentricity ElevatorLevel ElevatorSpeed EntityState
syn keyword ic10ConstLogicTypes contained EnvironmentEfficiency Error ExportCount ExportQuantity Extended Filtration Flush ForceWrite Forward FreeSlots
syn keyword ic10ConstLogicTypes contained Harvest Horizontal HorizontalRatio Idle ImportCount ImportQuantity Inclination Index InterrogationProgress LineNumber
syn keyword ic10ConstLogicTypes contained Lock Mass MaturityRatio Maximum MinedQuantity MinWattsToContact Mode NameHash NavPoints None
syn keyword ic10ConstLogicTypes contained On Open OperationalTemperatureEfficiency Orientation Output OverShootTarget Period Plant PositionX PositionY
syn keyword ic10ConstLogicTypes contained PositionZ Power PowerActual PowerGeneration PowerPotential PowerRequired PrefabHash Pressure PressureEfficiency PressureExternal
syn keyword ic10ConstLogicTypes contained PressureInput PressureInput2 PressureInternal PressureOutput PressureOutput2 PressureSetting Progress Quantity Ratio RatioCarbonDioxide
syn keyword ic10ConstLogicTypes contained RatioCarbonDioxideInput RatioCarbonDioxideInput2 RatioCarbonDioxideOutput RatioCarbonDioxideOutput2 RatioHelium RatioHeliumInput RatioHeliumInput2 RatioHeliumOutput RatioHeliumOutput2 RatioHydrazine
syn keyword ic10ConstLogicTypes contained RatioHydrazineInput RatioHydrazineInput2 RatioHydrazineOutput RatioHydrazineOutput2 RatioHydrochloricAcid RatioHydrochloricAcidInput RatioHydrochloricAcidInput2 RatioHydrochloricAcidOutput RatioHydrochloricAcidOutput2 RatioHydrogen
syn keyword ic10ConstLogicTypes contained RatioHydrogenInput RatioHydrogenInput2 RatioHydrogenOutput RatioHydrogenOutput2 RatioLiquidAlcohol RatioLiquidAlcoholInput RatioLiquidAlcoholInput2 RatioLiquidAlcoholOutput RatioLiquidAlcoholOutput2 RatioLiquidCarbonDioxide
syn keyword ic10ConstLogicTypes contained RatioLiquidCarbonDioxideInput RatioLiquidCarbonDioxideInput2 RatioLiquidCarbonDioxideOutput RatioLiquidCarbonDioxideOutput2 RatioLiquidHydrazine RatioLiquidHydrazineInput RatioLiquidHydrazineInput2 RatioLiquidHydrazineOutput RatioLiquidHydrazineOutput2 RatioLiquidHydrochloricAcid
syn keyword ic10ConstLogicTypes contained RatioLiquidHydrochloricAcidInput RatioLiquidHydrochloricAcidInput2 RatioLiquidHydrochloricAcidOutput RatioLiquidHydrochloricAcidOutput2 RatioLiquidHydrogen RatioLiquidHydrogenInput RatioLiquidHydrogenInput2 RatioLiquidHydrogenOutput RatioLiquidHydrogenOutput2 RatioLiquidMethane
syn keyword ic10ConstLogicTypes contained RatioLiquidMethaneInput RatioLiquidMethaneInput2 RatioLiquidMethaneOutput RatioLiquidMethaneOutput2 RatioLiquidNitrogen RatioLiquidNitrogenInput RatioLiquidNitrogenInput2 RatioLiquidNitrogenOutput RatioLiquidNitrogenOutput2 RatioLiquidNitrousOxide
syn keyword ic10ConstLogicTypes contained RatioLiquidNitrousOxideInput RatioLiquidNitrousOxideInput2 RatioLiquidNitrousOxideOutput RatioLiquidNitrousOxideOutput2 RatioLiquidOxygen RatioLiquidOxygenInput RatioLiquidOxygenInput2 RatioLiquidOxygenOutput RatioLiquidOxygenOutput2 RatioLiquidOzone
syn keyword ic10ConstLogicTypes contained RatioLiquidOzoneInput RatioLiquidOzoneInput2 RatioLiquidOzoneOutput RatioLiquidOzoneOutput2 RatioLiquidPollutant RatioLiquidPollutantInput RatioLiquidPollutantInput2 RatioLiquidPollutantOutput RatioLiquidPollutantOutput2 RatioLiquidSilanol
syn keyword ic10ConstLogicTypes contained RatioLiquidSilanolInput RatioLiquidSilanolInput2 RatioLiquidSilanolOutput RatioLiquidSilanolOutput2 RatioLiquidSodiumChloride RatioLiquidSodiumChlorideInput RatioLiquidSodiumChlorideInput2 RatioLiquidSodiumChlorideOutput RatioLiquidSodiumChlorideOutput2 RatioMethane
syn keyword ic10ConstLogicTypes contained RatioMethaneInput RatioMethaneInput2 RatioMethaneOutput RatioMethaneOutput2 RatioNitrogen RatioNitrogenInput RatioNitrogenInput2 RatioNitrogenOutput RatioNitrogenOutput2 RatioNitrousOxide
syn keyword ic10ConstLogicTypes contained RatioNitrousOxideInput RatioNitrousOxideInput2 RatioNitrousOxideOutput RatioNitrousOxideOutput2 RatioOxygen RatioOxygenInput RatioOxygenInput2 RatioOxygenOutput RatioOxygenOutput2 RatioOzone
syn keyword ic10ConstLogicTypes contained RatioOzoneInput RatioOzoneInput2 RatioOzoneOutput RatioOzoneOutput2 RatioPollutant RatioPollutantInput RatioPollutantInput2 RatioPollutantOutput RatioPollutantOutput2 RatioPollutedWater
syn keyword ic10ConstLogicTypes contained RatioSilanol RatioSilanolInput RatioSilanolInput2 RatioSilanolOutput RatioSilanolOutput2 RatioSteam RatioSteamInput RatioSteamInput2 RatioSteamOutput RatioSteamOutput2
syn keyword ic10ConstLogicTypes contained RatioWater RatioWaterInput RatioWaterInput2 RatioWaterOutput RatioWaterOutput2 Reagents RecipeHash ReferenceId RequestHash RequiredPower
syn keyword ic10ConstLogicTypes contained Richness Rpm SeedingRatio SemiMajorAxis Setting SettingInput SettingInputHash SettingOutput SettingOutputHash SignalID
syn keyword ic10ConstLogicTypes contained SignalStrength Sites Size SizeX SizeY SizeZ SolarAngle SolarConstant SolarIrradiance SoundAlert
syn keyword ic10ConstLogicTypes contained Stress Survey TargetPadIndex TargetPrefabHash TargetSlotIndex TargetX TargetY TargetZ Temperature TemperatureDifferentialEfficiency
syn keyword ic10ConstLogicTypes contained TemperatureExternal TemperatureInput TemperatureInput2 TemperatureOutput TemperatureOutput2 TemperatureSetting Throttle Thrust ThrustToWeight Time
syn keyword ic10ConstLogicTypes contained TimeToDestination TotalMoles TotalMolesInput TotalMolesInput2 TotalMolesOutput TotalMolesOutput2 TotalSlots TrueAnomaly Unknown VelocityMagnitude
syn keyword ic10ConstLogicTypes contained VelocityRelativeX VelocityRelativeY VelocityRelativeZ VelocityX VelocityY VelocityZ Vertical VerticalRatio Volume VolumeOfLiquid
syn keyword ic10ConstLogicTypes contained WattsReachingContact Weight WorkingGasEfficiency
" Logic Slot Types
syn keyword ic10ConstSlotTypes contained Charge ChargeRatio Class Damage Efficiency FilterType FreeSlots Growth
syn keyword ic10ConstSlotTypes contained HarvestedHash Health LineNumber Lock Mature MaturityRatio MaxQuantity Mode
syn keyword ic10ConstSlotTypes contained OccupantHash Occupied On Open PrefabHash Pressure PressureAir PressureWaste
syn keyword ic10ConstSlotTypes contained Quantity ReferenceId Seeding SeedingRatio SortingClass Temperature TotalSlots Volume
" Others
syn match ic10LabelDef   "^\s*[a-zA-Z][a-zA-Z0-9.]*:"
syn match ic10RegisterArg   contained "\v<r([0-9]|1[0-5]|a)>|<sp>"
syn match ic10DeviceArg     contained "\v<(d[0-5]|db)>"
syn match ic10NumberArg     contained "\v-?\d+(\.\d+)?"
syn match ic10NumberArg     contained "\v0x[0-9a-fA-F]+"

" System Instructions
" No Argument Instructions
syn keyword ic10NoArgSystemInstr hcf yield
hi def link ic10NoArgSystemInstr Keyword

" One Argument
syn match ic10OneArgSystemLine "^\s*\<\(sleep\)\>\s\+[^[:space:]]\+" contains=ic10OneArgSystemInstr,ic10RegisterArg,ic10NumberArg
syn keyword ic10OneArgSystemInstr contained sleep
hi def link ic10OneArgSystemInstr Keyword

" Two Argument
syn match ic10TwoArgSystemLine "^\s*\<\(alias\|define\)\>\s\+[^[:space:]]\+\s\+[^[:space:]]\+" contains=ic10TwoArgSystemInstr,ic10RegisterArg,ic10DeviceArg,ic10NumberArg
syn keyword ic10TwoArgSystemInstr contained alias define
hi def link ic10TwoArgSystemInstr Keyword

" Math Instructions
" One Argument
syn match ic10OneArgMathLine "^\s*\<rand\>\s\+[^[:space:]]\+" contains=ic10OneArgMathInstr,ic10RegisterArg,ic10NumberArg
syn keyword ic10OneArgMathInstr contained rand
hi def link ic10OneArgMathInstr Keyword

" Two Arguments
syn match ic10TwoArgMathLine "^\s*\<\(abs\|ceil\|exp\|floor\|log\|move\|round\|sqrt\|trunc\|acos\|asin\|atan\|cos\|sin\|tan\)\>\s\+[^[:space:]]\+\s\+[^[:space:]]\+" contains=ic10TwoArgMathInstr,ic10RegisterArg,ic10NumberArg,ic10Function
syn keyword ic10TwoArgMathInstr contained abs ceil exp floor log move round sqrt trunc acos asin atan cos sin tan
hi def link ic10TwoArgMathInstr Function

" Three Arguments
syn match ic10ThreeArgMathLine "^\s*\<\(add\|div\|pow\|max\|min\|mod\|mul\|sub\|atan2\)\>\s\+[^[:space:]]\+\s\+[^[:space:]]\+\s\+[^[:space:]]\+" contains=ic10ThreeArgMathInstr,ic10RegisterArg,ic10NumberArg
syn keyword ic10ThreeArgMathInstr contained add div pow max min mod mul sub atan2
hi def link ic10ThreeArgMathInstr Function

" Four Arguments
syn match ic10FourArgMathLine "^\s*\<lerp\>\s\+[^[:space:]]\+\s\+[^[:space:]]\+\s\+[^[:space:]]\+\s\+[^[:space:]]\+" contains=ic10FourArgMathInstr,ic10RegisterArg,ic10NumberArg
syn keyword ic10FourArgMathInstr contained lerp
hi def link ic10FourArgMathInstr Function

" Stack Instructions
" One Argument
syn match ic10OneArgStackLine "^\s*\<\(clr\|clrd\|peek\|pop\|push\)\?\>\s\+[^[:space:]]\+" contains=ic10OneArgStackInstr,ic10RegisterArg,ic10NumberArg,ic10LabelArg,ic10Function
syn keyword ic10OneArgStackInstr contained clr clrd peek pop push
hi def link ic10OneArgStackInstr Function

" Two Arguments
syn match ic10TwoArgStackLine "^\s*\<poke\>\s\+[^[:space:]]\+\s\+[^[:space:]]\+" contains=ic10TwoArgStackInstr,ic10RegisterArg,ic10NumberArg,ic10Function
syn keyword ic10TwoArgStackInstr contained poke
hi def link ic10TwoArgStackInstr Function

" Three Arguments
syn match ic10ThreeArgStackLine "^\s*\<\(get\|getd\|put\|putd\)\>\s\+[^[:space:]]\+\s\+[^[:space:]]\+\s\+[^[:space:]]\+" contains=ic10ThreeArgStackInstr,ic10RegisterArg,ic10NumberArg,ic10Function
syn keyword ic10ThreeArgStackInstr contained get getd put putd
hi def link ic10ThreeArgStackInstr Function

" I/O Instructions
" Three Arguments
syn match ic10ThreeArgIOLine "^\s*\<\(l\|s\|rmap\)\>\s\+[^[:space:]]\+\s\+[^[:space:]]\+\s\+[^[:space:]]\+" contains=ic10ThreeArgIOInstr,ic10RegisterArg,ic10DeviceArg,ic10NumberArg,ic10ConstLogicTypes,ic10Function
syn keyword ic10ThreeArgIOInstr contained l s rmap
hi def link ic10ThreeArgIOInstr Function

" Four Arguments
syn match ic10FourArgIOLine "^\s*\<\(lr\|ls\|ss\)\>\s\+[^[:space:]]\+\s\+[^[:space:]]\+\s\+[^[:space:]]\+\s\+[^[:space:]]\+" contains=ic10FourArgIOInstr,ic10RegisterArg,ic10NumberArg,ic10ConstReagent,ic10ConstSlotTypes,ic10Function
syn keyword ic10FourArgIOInstr contained lr ls ss
hi def link ic10FourArgIOInstr Function

" Batched I/O Instructions
" Three Arguments
syn match ic10ThreeArgBatchIOLine "^\s*\<sb\>\s\+[^[:space:]]\+\s\+[^[:space:]]\+\s\+[^[:space:]]\+" contains=ic10ThreeArgBatchIOInstr,ic10RegisterArg,ic10NumberArg,ic10ConstLogicTypes,ic10ConstBatch,ic10Function
syn keyword ic10ThreeArgBatchIOInstr contained sb
hi def link ic10ThreeArgBatchIOInstr Function

" Four Arguments
syn match ic10FourArgBatchIOLine "^\s*\<\(lb\|sbn\|sbs\)\>\s\+[^[:space:]]\+\s\+[^[:space:]]\+\s\+[^[:space:]]\+\s\+[^[:space:]]\+" contains=ic10FourArgBatchIOInstr,ic10RegisterArg,ic10NumberArg,ic10ConstLogicTypes,ic10ConstSlotTypes,ic10ConstBatch,ic10Function
syn keyword ic10FourArgBatchIOInstr contained lb sbn sbs
hi def link ic10FourArgBatchIOInstr Function

" Five Arguments
syn match ic10FiveArgBatchIOLine "^\s*\<\(lbn\|lbs\)\>\s\+[^[:space:]]\+\s\+[^[:space:]]\+\s\+[^[:space:]]\+\s\+[^[:space:]]\+\s\+[^[:space:]]\+" contains=ic10FiveArgBatchIOInstr,ic10RegisterArg,ic10NumberArg,ic10ConstLogicTypes,ic10ConstSlotTypes,ic10ConstBatch,ic10Function
syn keyword ic10FiveArgBatchIOInstr contained lbn lbs
hi def link ic10FiveArgBatchIOInstr Function

" Six Arguments
syn match ic10SixArgBatchIOLine "^\s*\<\(lbns\)\>\s\+[^[:space:]]\+\s\+[^[:space:]]\+\s\+[^[:space:]]\+\s\+[^[:space:]]\+\s\+[^[:space:]]\+\s\+[^[:space:]]\+" contains=ic10SixArgBatchIOInstr,ic10RegisterArg,ic10NumberArg,ic10ConstLogicTypes,ic10ConstSlotTypes,ic10ConstBatch,ic10Function
syn keyword ic10SixArgBatchIOInstr contained lbns
hi def link ic10SixArgBatchIOInstr Function

" Bitwise Instructions
" Two Arguments
syn match ic10TwoArgBitwiseLine "^\s*\<\(not\)\>\s\+[^[:space:]]\+\s\+[^[:space:]]\+" contains=ic10TwoArgBitwiseInstr,ic10RegisterArg,ic10NumberArg
syn keyword ic10TwoArgBitwiseInstr contained not
hi def link ic10TwoArgBitwiseInstr Function

" Three Arguments
syn match ic10ThreeArgBitwiseLine "^\s*\<\(and\|nor\|or\|sla\|sll\|sra\|srl\|xor\)\>\s\+[^[:space:]]\+\s\+[^[:space:]]\+\s\+[^[:space:]]\+" contains=ic10ThreeArgBitwiseInstr,ic10RegisterArg,ic10NumberArg
syn keyword ic10ThreeArgBitwiseInstr contained and nor or sla sll sra srl xor
hi def link ic10ThreeArgBitwiseInstr Function

" Four Arguments
syn match ic10FourArgBitwiseLine "^\s*\<\(ext\|ins\)\>\s\+[^[:space:]]\+\s\+[^[:space:]]\+\s\+[^[:space:]]\+\s\+[^[:space:]]\+" contains=ic10FourArgBitwiseInstr,ic10RegisterArg,ic10NumberArg,ic10Function
syn keyword ic10FourArgBitwiseInstr contained ext ins
hi def link ic10FourArgBitwiseInstr Function

" Comparison Instructions
" Three Arguments
syn match ic10ThreeArgComparisonLine "^\s*\<\(and\|nor\|or\|sla\|sll\|sra\|srl\|xor\)\>\s\+[^[:space:]]\+\s\+[^[:space:]]\+\s\+[^[:space:]]\+" contains=ic10ThreeArgComparisonInstr,ic10RegisterArg,ic10NumberArg,ic10Function
syn keyword ic10ThreeArgComparisonInstr contained seq sne sge sgt sle slt sapz
hi def link ic10ThreeArgComparisonInstr Function

" Four Arguments
syn match ic10FourArgComparisonLine "^\s*\<\(select\|sap\)\>\s\+[^[:space:]]\+\s\+[^[:space:]]\+\s\+[^[:space:]]\+\s\+[^[:space:]]\+" contains=ic10FourArgComparisonInstr,ic10RegisterArg,ic10NumberArg,ic10Function
syn keyword ic10FourArgComparisonInstr contained select sap
hi def link ic10FourArgComparisonInstr Function

" Branching Instructions
" One Argument
syn match ic10OneArgBranchLine "^\s*\<j\(r\|al\)\?\>\s\+[^[:space:]]\+" contains=ic10OneArgBranchInstr,ic10RegisterArg,ic10NumberArg,ic10LabelArg
syn keyword ic10OneArgBranchInstr contained j jr jal
hi def link ic10OneArgBranchInstr Keyword

" Two Arguments
syn match ic10TwoArgBranchLine "^\s*\<\(beqz\|bnez\|bgez\|blez\|bgtz\|bltz\|beqzal\|bnezal\|bgezal\|blezal\|bgtzal\|bltzal\|breqz\|brnez\|brgez\|brlez\|brgtz\|brltz\)\>\s\+[^[:space:]]\+\s\+[^[:space:]]\+" contains=ic10TwoArgBranchInstr,ic10NumberArg,ic10RegisterArg,ic10LabelArg,
syn keyword ic10TwoArgBranchInstr contained beqz bnez bgez blez bgtz bltz beqzal bnezal bgezal blezal bgtzal bltzal breqz brnez brgez brlez brgtz brltz
hi def link ic10TwoArgBranchInstr Function

" Three Arguments
syn match ic10ThreeArgBranchLine "^\s*\<\(beq\|bne\|bge\|ble\|bgt\|blt\|beqal\|bneal\|bgeal\|bleal\|bgtal\|bltal\|breq\|brne\|brge\|brle\|brgt\|brlt\)\>\s\+[^[:space:]]\+\s\+[^[:space:]]\+\s\+[^[:space:]]\+" contains=ic10ThreeArgBranchInstr,ic10NumberArg,ic10RegisterArg,ic10LabelArg,
syn keyword ic10ThreeArgBranchInstr contained beq bne bge ble bgt blt beqal bneal bgeal bleal bgtal bltal breq brne brge brle brgt brlt
hi def link ic10ThreeArgBranchInstr Function

" Highlight links
hi def link ic10Comment      Comment
hi def link ic10NumberArg    Number
hi def link ic10RegisterArg  Type
hi def link ic10DeviceArg    Special
hi def link ic10LabelDef     Label
hi def link ic10Function     Function
hi def link ic10ConstBatch   ic10ConstLogicTypes

" Custom Colors
hi ic10NumberArg        guifg=#24A09A
hi ic10RegisterArg      guifg=#0067CF
hi ic10DeviceArg        guifg=#00FD00
hi ic10LabelDef         guifg=#841DC7
hi ic10LabelArg         guifg=Violet
hi ic10ConstLogicTypes  guifg=Orange
hi ic10ConstSlotTypes   guifg=Yellow
hi ic10Function         guifg=#0099EE

let b:current_syntax = "ic10"
