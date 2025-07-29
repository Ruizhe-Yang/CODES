package TCS{
    private import CubeSat_Base::*;
    part def TCSParameters{
        attribute solarCellsEfficiency : Real;
        attribute solarCellsAbsorptivity : Real;
        attribute frameAbsorptivity : Real;
        attribute solarCellsEmissivity : Real;
        attribute frameEmissivity : Real;
        attribute PCBPanelsAbsorptivity : Real;
        attribute PCBPanelsEmissivity : Real;
    }
}