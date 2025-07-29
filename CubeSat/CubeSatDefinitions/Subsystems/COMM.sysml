package COMM{
    private import CubeSat_Base::*;
    part def Antenna :> FunctionComponent{
        :>> sysType = SystemType::COMM;
    }
    part def Transceiver :> FunctionComponent{
        :>> sysType = SystemType::COMM;
        attribute waveType [1..*]: WaveBand;
        attribute Downlink{
            attribute frequencyRange : Range{
                :>> upper : ISQ::FrequencyValue;
                :>> lower : ISQ::FrequencyValue;
            }
            attribute transmitPower : ISQ::PowerValue;
            attribute modulation : String;
        }
        attribute Uplink{
            attribute protocol : String;
            attribute frequencyRange : Range{
                :>> upper : ISQ::FrequencyValue;
                :>> lower : ISQ::FrequencyValue;
            }
            attribute receivePower : ISQ::PowerValue;
            attribute modulation : String;
        }
    }
    

}