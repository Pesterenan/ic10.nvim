" Vim syntax file
" Language: Stationeers IC10 assembly
" Maintainer: Renan Torres
" Latest Revision: 09 April 2026

if exists("b:current_syntax")
  finish
endif

" Comments
syn match ic10Comment "#\ .*$"

" Numbers
syn match ic10Number "\v-?\d+(\.\d+)?"
syn match ic10Number "\v0x[0-9a-fA-F]+"

" Operators
" System Keywords
syn keyword ic10SysKeyword alias define hcf sleep yield j jal jr
" Mathematical
syn keyword ic10Instruction abs add ceil div pow exp floor log max min mod move mul rand round sqrt sub trunc lerp
" Trigonometry
syn keyword ic10Instruction acos asin atan atan2 cos sin tan
" Stack
syn keyword ic10Instruction clr clrd get getd peek poke pop push put putd
" I/O
syn keyword ic10Instruction l lr ls s ss rmap lb lbn lbns lbs sb sbn sbs
" Bitwise
syn keyword ic10Instruction and nor not or sla sll sra srl xor ext ins
" Comparison
syn keyword ic10Instruction select seq sne sge sgt sle slt sap sapz
" Branching
syn keyword ic10Instruction beq bne bgt blt bge ble beqz bnez bgez blez bgtz bltz
" Relative Branching
syn keyword ic10Instruction breq brne brgt brlt brge brle breqz brnez brgez brlez brgtz brltz
" Branch and Link
syn keyword ic10Instruction beqal bneal bgtal bltal bgeal bleal beqzal bnezal bgezal blezal bgtzal bltzal

" Registers
syn match ic10Register "\<r\([0-9]\|1[0-5]\)\>"

" Devices
syn match ic10Device "\(d[0-5]\|db\)"

" Labels
syn match ic10Label "^[a-zA-Z][a-zA-Z0-9]*:"

" Constants
" System
syn keyword ic10ConstSystem MaxInstructionCount MaxRegisterCount StackSize
" Batch Mode
syn keyword ic10ConstBatch Average Sum Minimum Maximum
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

" Highlight Linking
hi ic10Number guifg=#24A09A
hi Constant guifg=#EC7609
hi ic10Device guifg=#00FD00
hi ic10Register guifg=#0067CF
hi ic10Label guifg=#841DC7
hi Keyword guifg=#E3D119
hi def link ic10Comment Comment
hi def link ic10ConstLogicTypes Constant
hi def link ic10ConstSlotTypes Constant
hi def link ic10ConstBatch Constant
hi def link ic10ConstReagent Constant
hi def link ic10ConstSystem Constant
hi def link ic10Instruction Function
hi def link ic10SysKeyword Keyword

let b:current_syntax = "ic10"
