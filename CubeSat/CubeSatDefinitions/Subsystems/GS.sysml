package GS{
    private import CubeSat_Base::*;
    part def GroundStation :> Building{
        :>> sysType = GS;
        attribute frequencyRange[0..*] : Range{
            attribute waveType : WaveBand;
            :>> upper : FrequencyValue;
            :>> lower : FrequencyValue;
        }
        attribute modulationType : Range;
        attribute UplinkCapabilities[1..*] : Capability;
        attribute DownlinkCapabilities[1..*] : Capability;
    }

    enum def Capability{
        enum '1200bd AFSK';
        enum '1200bd BPSK';
        enum '9600bd G3RUH FSK';
    }
}