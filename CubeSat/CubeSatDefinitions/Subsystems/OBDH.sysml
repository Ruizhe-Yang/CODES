package OBDH{
    private import CubeSat_Base::*;
    part def OnBoardComputer :> FunctionComponent{
        :>> sysType = SystemType::OBDH;
        attribute operationSystem : String;
    }
    part def Magnetometer :> FunctionComponent{
        :>> sysType = SystemType::OBDH;
    }

    part def ElectronicComponents :> FunctionComponent;
    part def FPGA :> ElectronicComponents{
        :>> sysType = SystemType::OBDH;
        attribute fpgaType : FPGAType;
    }

    part def FRAM :> ElectronicComponents{
        :>> sysType = SystemType::OBDH;

    }
    enum def FPGAType{
        enum DataProcessingUnit;
        enum VotingControlUnit;
    }
    
    part def I2C :> FunctionComponent;
}
