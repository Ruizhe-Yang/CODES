package DSP_DUT{
    private import CubeSat_Definitions::*;
    /* 1. System Overview */
    part dsp_entity : CubeSatEntity{
        :>> vendor = "NPU";
        // :>> sys :>  aoXiang1Sys;
        // :>> ss  :>  twoU;
        // :>> pay  =  INMS;
        // :>> adcs =  (sunSensor_1, sunSensor_2, sunSensor_3,
        //             HMC5983,
        //             ADIS16355,
        //             GPSReceiver,
        //             threeAxisReactionWeel,
        //             ISIS_MTQ);
        // :>> eps  =  (tripleJunctionGaAs_SolarPanels, 
        //             P31U);
        // :>> obdh =  (AoXiang1OBC,
        //             Aoxiang1DataBUS);
        // :>> comm =  (antenna,
        //             AoXiang1Transceiver);
        // :>> tcs = AoXiang1TCS;
        // :>> dep;
        // :>> prop;
        // :>> gs = NPU_GroundStation;
        // :>> others = (connector1, connector2);
        part dsp_entity_sys :> sys;
        part dsp_entity_ss :> ss;
        part dsp_entity_pay :> pay;
        part dsp_entity_adcs :> adcs;
        part dsp_entity_eps :> eps;
        part dsp_entity_obdh :> obdh;
        part dsp_entity_comm :> comm;
        part dsp_entity_tcs :> tcs;
        part dsp_entity_dep :> dep;
        part dsp_entity_prop :> prop;
        part dsp_entity_gs :> gs;
        part dsp_entity_others :> others;
    }

}

