package EPS{
    private import CubeSat_Base::*;
    part def SolarPanels :> FunctionComponent{
        :>> sysType = SystemType::EPS;
        part solarPanels : SolarPanel[0..*];
    }
    part def SolarPanel :> FunctionComponent{
        :>> sysType = SystemType::EPS;
        attribute conversionEfficiency : Natural;

    }
    part def PowerSupplyBoard :> FunctionComponent{
        :>> sysType = SystemType::EPS;
        attribute converterEfficiency : Natural;
        attribute interfaceType : InterfaceType[1..*];
        part lithiumIonBatteryPack : BatteryPack;
    }
    part def BatteryPack:> FunctionComponent{
        attribute power : ISQ::PowerValue;
    }
}