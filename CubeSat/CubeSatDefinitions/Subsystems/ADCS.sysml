package ADCS{
    private import CubeSat_Base::*;

    part def Gyro :> FunctionComponent{
        :>> sysType = SystemType::ADCS;
        attribute digitalRangeScaling[1..*] : ISQ::AngularVelocityValue;
        attribute triAxisMeasurementRange : ISQ::StorageCapacityValue;
    }

    part def Magnetometer :> FunctionComponent{
        :>> sysType = SystemType::ADCS;
        attribute accuracy : ISQ::MagneticFluxDensityValue;
        attribute magneticFieldRange : Range{
            :>> upper : ISQ::MagneticFieldStrengthValue;
            :>> lower : ISQ::MagneticFieldStrengthValue;
        }
        attribute interfaceType : InterfaceType[1..*];
        attribute offsetCompensatio : String;
        // attribute power : ISQ::PowerValue;
        attribute updateRate : ISQ::FrequencyValue;
    }

    part def SunSensor :> FunctionComponent{
        doc /*
            CSS could determines the spacecraft body angles with respect to the sun. 
            It could achieve much higher measurement accuracy than traditional photodiode cosine sensors.
            */
        :>> sysType = SystemType::ADCS;
        attribute accuracy : ISQ::AngularMeasureValue;
        attribute power : ISQ::ElectricCurrentValue;
        attribute fieldOfView : ISQ::AngularMeasureValue;
        attribute updateRate : ISQ::FrequencyValue;
    }

    part def Reaction :> FunctionComponent{
        :>> sysType = SystemType::ADCS;
    }

    part def ThreeAxisReactionWeel :> FunctionComponent{
        :>> sysType = SystemType::ADCS;
        attribute accuracy : ISQ::AngularMeasureValue;
        // attribute powerConsumption {
        //     attribute typical : ISQ::PowerValue;
        //     attribute peak : ISQ::PowerValue;
        // }
        attribute maxRotateSpeed : ISQ::AngularVelocityValue;
        attribute momentum : ISQ::MomentOfInertiaUnit;
        attribute maxTorque : ISQ::MomentOfForceUnit;
    }

    part def MTQ :> FunctionComponent{
        :>> sysType = SystemType::ADCS;
        attribute actuationPower_Rods : String; // TBD
        attribute actuationPower_AirCore : String; // TBD
        attribute interfaceType : InterfaceType[1..*];
        attribute offsetCompensatio : String;
        attribute updateRate : ISQ::FrequencyValue;
        attribute processor : String;
    }
}