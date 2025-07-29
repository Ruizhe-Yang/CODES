package demo1{
    private import CubeSat_Definitions::*;
    /* 1. System Overview */
    part demo1Entity : CubeSatEntity{
        // :>> sys :>  demo1Sys;
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
        // :>> obdh =  (demo1OBC,
        //             demo1DataBUS);
        // :>> comm =  (antenna,
        //             demo1Transceiver);
        // :>> tcs = demo1TCS;
        // :>> dep;
        // :>> prop;
        // :>> gs = NPU_GroundStation;
        // :>> others = (connector1, connector2);
        part demo1_sys :> sys = demo1Sys;
        part demo1_ss :> ss = twoU;
        
        part demo1_pay :> pay = INMS;
        part demo1_adcs :> adcs = (sunSensor_1, sunSensor_2, sunSensor_3,
                                        HMC5983,
                                        ADIS16355,
                                        GPSReceiver,
                                        threeAxisReactionWeel,
                                        ISIS_MTQ, NPU_MTQ);
        part demo1_eps :> eps = (tripleJunctionGaAs_SolarPanels,
                                        P31U);
        part demo1_obdh :> obdh = (demo1OBC,
                                        demo1DataBUS);
        part demo1_comm :> comm = (antenna,
                                        demo1Transceiver);
        part demo1_tcs :> tcs = demo1TCS;
        part demo1_dep :> dep;
        part demo1_prop :> prop;
        part demo1_gs :> gs = NPU_GroundStation;
        part demo1_others :> others = (connector1, connector2);
    }

    part demo1Entity2 : CubeSatEntity{
        :>> vendor = "NPU";
        :>> sys :>  demo1Sys;
        :>> ss  :>  twoU;
        :>> pay  =  INMS;
        :>> adcs =  (sunSensor_1, sunSensor_2, sunSensor_3,
                    HMC5983,
                    ADIS16355,
                    GPSReceiver,
                    threeAxisReactionWeel,
                    ISIS_MTQ);
        :>> eps  =  (tripleJunctionGaAs_SolarPanels, 
                    P31U);
        :>> obdh =  (demo1OBC,
                    demo1DataBUS);
        :>> comm =  (antenna,
                    demo1Transceiver);
        :>> tcs = demo1TCS;
        :>> dep;
        :>> prop;
        :>> gs = NPU_GroundStation;
        :>> others = (connector1, connector2);
    }

    part demo1Entity3 : CubeSatEntity{
        :> vendor = "NPU";
        :> sys :>  demo1Sys;
        :> ss  :>  twoU;
        :> pay  =  INMS;
        :> adcs =  (sunSensor_1, sunSensor_2, sunSensor_3,
                    HMC5983,
                    ADIS16355,
                    GPSReceiver,
                    threeAxisReactionWeel,
                    ISIS_MTQ);
        :> eps  =  (tripleJunctionGaAs_SolarPanels, 
                    P31U);
        :> obdh =  (demo1OBC,
                    demo1DataBUS);
        :> comm =  (antenna,
                    demo1Transceiver);
        :> tcs = demo1TCS;
        :> dep;
        :> prop;
        :> gs = NPU_GroundStation;
        :> others = (connector1, connector2);
    }

    part demo1Sys : SYS::QB50_SYS{
        :>> geometricCenter = demo1Entity.ss.geometricCenter;
        :>> gravityCenter = CountCubeSatGravityCenter(demo1Entity);
        // TBD
        :>> track : EarthOrbit{
            :>> Epoch {
                :>> val = "2016-03-00T15:12:00.000Z";
            }
            // {
            //     :>> year = 2016;
            //     :>> month = 3;
            //     :>> day = 15;
            //     :>> hour = 12;
            //     :>> minute = 0;
            //     :>> second = 0;
            // }
            :>> semiMajorAxis = 6751.0[km];
            :>> inclination = 98['°'];
            :>> eccentricity = 0.001;
            :>> RAAN = 175.72['°'];
            :>> argumentOfPerigee = 167.0['°'];
            :>> meanAnomalyAtEpoch = 0.0['°'];
        }
        attribute sysPowerConsumed = CountSysPowerConsumed(demo1Entity);
        attribute sysPowerGenerated = CountSysPowerGenerated(demo1Entity);
        attribute powerMargin = sysPowerConsumed / sysPowerGenerated;
    }

    /* 2. Payload Subsystem */
    part INMS : PAY::PayloadDevice{
        doc /* 
            The INMS is a miniaturized analyzer designed for sampling of low mass ionized and neutral 
            particles in lower thermosphere, i.e., O, O2, and N2. The key sensor components consist of
            a collimatorion filter, an ionizer and a charged particle spectrometer. 
            */
        :>> mass = 210 [g];
        :>> massError = 90 [g];
        :>> tempRange{
            :>> upper = 40['°C'];
            :>> lower = -20['°C'];
        }
        :>> vendor = "University College London";
        port INMSport :> dataEnd {
            :>> BAUDRate = 38400;
            :>> dataWidth = 8 [bit];
            :>> parityBit = false;
            :>> STARTBit = 1 [bit];
            :>> STOPBit = 1 [bit];
        }
    }

    /* 3. Structural Subsystem */
    /* 3.1 Dimension */
    part twoU : SS::TwoUnitsStructure{
        doc /*
            demo-1 is a 2U CubeSat.
            */
        :>> vendor = "ISIS";
        :>> mass = 280 [g];
        :>> massError = 20 [g];
        :>> tempRange{
            :>> upper = 80['°C'];
            :>> lower = -40['°C'];
        }
        :>> body{
            :>> lengthError = 0.1 [mm];
            :>> widthError = 0.1 [mm];
            :>> heightError = 0.1 [mm];
        }
        :>> feet{
            :>> lengthError = 0.1 [mm];
            :>> widthError = 0.1 [mm];
        }
        :>> material = AL7075;
    }

    /* 3.2 Material */
    attribute AL7075 : Material{
        doc /*
            The material adopted to construct the demo-1 CubeSat is aluminum 7075, 
            since the AL7075 has relative high yield strength and ultimate strength with low density.
            */
        :>> name = "Aluminum 7075";
        :>> mechanicalProperty{
            :>> youngsModule = 72e9 [Pa];
            :>> yieldStress = 320e6 [Pa];
            :>> ultimateStrength = 650e6 [Pa];
        }
    }
    /* 3.3 Main components of structure */

    /* 3.4 Mass budget */
    attribute demo1EntityMass : ISQ::MassValue = CountCubeSatSystemMass(demo1Entity);
    
    /* 3.5 Center of gravity */
    attribute demo1GeometricCenter = demo1Entity2.sys.geometricCenter;
    attribute demo1GravityCenter = demo1Entity2.sys.gravityCenter;
    // TBD

    /* 3.6 Access hatch on the structure */
    part def MDC1_9S1 :> FunctionComponent{
        :>> sysType = SystemType::OTHERS;
        doc /*
            The umbilical connector is MDC1-9S1. The dimension of the connector is in12.2ⅹ3.6ⅹ7.5mm.
            The detail information is in the figure below.
            */
        item :>> shape : Box {
            :>> length = 12.2 [mm];
            :>> width = 3.6 [mm];
            :>> height =7.5 [mm];
        }
    }
    part connector1 : MDC1_9S1{
        attribute :>> coordinateFrame {
            :>> transformation : TranslationRotationSequence {
                :>> elements = (Translation((43.5, 12, 0)[source]), Rotation((0, 0, 1)[source], 0['°']));
            }
        }
    }
    part connector2 : MDC1_9S1{
        attribute :>> coordinateFrame {
            :>> transformation : TranslationRotationSequence {
                :>> elements = (Translation((43.5, 63, 0)[source]), Rotation((0, 0, 1)[source], 0['°']));
            }
        }
    }

    /* 4 Attitude Determination and Control Subsystem */
    // TBD
    /* 4.1 Sensors */
    /* 4.1.1 Sun Sensor */
    part sunSensor : ADCS::SunSensor{
        doc /*
            In order to achieve high resolution,
            demo-1 select CubeSat Sun Sensor (CSS) for QB50 mission.
            */
        :>> vendor = "SSBV Space and Ground System Ltd";
        item :>> shape : Box {
            :>> length = 33 [mm];
            :>> width = 11 [mm];
            :>> height = 6 [mm];
        }
        :>> mass = 0.5[g];
        :>> accuracy = 0.5['°'];
        :>> power = 10e-3[A];
        :>> fieldOfView = 114['°'];
        :>> updateRate = 10[Hz];
        :>> powerConsumption = 0.05[W];
        :>> mode : demo1Modes{
            safe{:>> percent = 0;}
            recovery{:>> percent = 100;}
            payloadOperation{:>> percent = 100;}
        }
    }

    part sunSensor_1 :> sunSensor;
    part sunSensor_2 :> sunSensor;
    part sunSensor_3 :> sunSensor;

    /* 4.1.2 Magnetometer */
    part HMC5983 : ADCS::Magnetometer{
        doc /*
            On the OBC board, we utilize HMC5983 magnetometer from Honeywell as one of the attitude determination device.
            HMC5983 is a low cost three-axis low cost magnetometer. The HMC5983 includes magnetoresistive sensors, amplification,
            automatic degaussing strap drivers, offset cancellation, and a 12-bit ADC.
            */
        :>> vendor = "Honeywell";
        item :>> shape : Box {
            :>> length = 33 [mm];
            :>> width = 11 [mm];
            :>> height = 6 [mm];
        }
        :>> mass = 15e-3[g];
        :>> tempRange{
            :>> upper = 70['°C'];
            :>> lower = -40['°C'];
        }
        :>> accuracy = 2.0e-3[T];
        :>> magneticFieldRange{
            :>> upper = 8.0 [H];
            :>> lower = -8.0 [H];
        }
        :>> interfaceType = (InterfaceType::I2C, InterfaceType::SPI);
        :>> offsetCompensatio = "Automatic";
        :>> powerConsumption = 0.43e-3[W];
        // :>> power = 0.43e-3[W];
        :>> updateRate = 220[Hz];
    }

    /* 4.1.3 Gyro */
    part ADIS16355 : ADCS::Gyro{
        doc /*
            An Analog DeviceADIS16355 was used to measure the tip-off rates of demo-1.
            ADIS 16355 incorporate a Tri-axis gyroscope and a Tri-axis accelerometer.
            */
            :>> vendor = "ADI";
        :>> tempRange{
            :>> upper = 70['°C'];
            :>> lower = -40['°C'];
        }
        :>> digitalRangeScaling =(75, 150, 300)['°'/s];
        :>> triAxisMeasurementRange = 14[bit];
        :>> powerConsumption = 0.25[W];
        :>> mode : demo1Modes{
            safe{:>> percent = 0;}
            recovery{:>> percent = 100;}
            payloadOperation{:>> percent = 0;}
        }
    }

    /* 4.1.4 GPS receiver */
    part GPSReceiver : ADCS::Reaction{
        doc /*
            The GPS receiver is used to get the position information of demo-1. 
            Low latency and high update rates give the response time and accuracy required for precise dynamic applications.
            */
        :>> vendor = "NPU";
        :>> tempRange{
            :>> upper = 60['°C'];
            :>> lower = -30['°C'];
        }
        port TLL :> dataEnd;
    }
    
    /* 4.2 Actuator */
    /* 4.2.1 Reaction Wheel */
    part threeAxisReactionWeel : ADCS::ThreeAxisReactionWeel{
        doc /*
            The reaction wheel is the implement of brushless DC motor speed control with PWM control mode. 
            Reaction wheel uses Faulhaber brushless DC motor as a drive. 
            */
        item :>> shape : Box {
            :>> length = 33 [mm];
            :>> width = 11 [mm];
            :>> height = 6 [mm];
        }
        :>> mass = 80 [g];
        :>> accuracy = 0.5['°'];
        :>> powerConsumption{
            :>> typical = 250e-3[W];
            :>> peak = 1.5[W];
        }
        :>> maxRotateSpeed = 12000['s⁻¹'];
        :>> momentum = 6e-6['kg⋅m²'];
        :>> maxTorque = 0.2e-3['N⋅m'];
        :>> mode : demo1Modes{
            safe{:>> percent = 0;}
            recovery{:>> percent = 0;}
            payloadOperation{:>> percent = 50;}
        }
    }

    /* 4.2 MTQ */
    part ISIS_MTQ : ADCS::MTQ{
        doc /*
            The ISIS MTQ is a PCB based 3-axis actuator. 
            It is designed to provide maximum flexibility in placing actuators in a CubeSat structure.
            */
        item :>> shape : Box {
            :>> length = 96 [mm];
            :>> width = 90 [mm];
            :>> height = 22 [mm];
        }
        :>> vendor = ("ISIS", "NPU");
        :>> mass = 200[g];
        :>> tempRange{
            :>> upper = 70['°C'];
            :>> lower = -40['°C'];
        }
        :>> actuationPower_Rods = "0.5W/0.2Am2"; // TBD
        :>> actuationPower_AirCore = "0.7W/0.2Am2"; // TBD
        :>> interfaceType = InterfaceType::I2C;
        :>> offsetCompensatio = "Automatic";
        :>> updateRate = 220[Hz];
        :>> processor = "MSP430";
        :>> mode : demo1Modes{
            safe{:>> percent = 0;}
            recovery{:>> percent = 20;}
            payloadOperation{:>> percent = 20;}
        }
    }

    part NPU_MTQ : ADCS::MTQ{
        doc /*
            Another candidate MTQ is made by NPU. The system use a MSP430 controller to receive the temperature information of board, 
            control command from OBC and generate control momentum.
            The communication bus is I2C.
            */
    }

    /* 4.3 Attitude determination */
    // TBD

    /* 4.4 Attitude control */
    /* 4.4.1 De-tumbling control*/
    // TBD

    /* 4.4.2 Attitude stabilization */
    // TBD

    /* 5. Electrical Power Subsystem */
    part tripleJunctionGaAs_SolarPanels : EPS::SolarPanels{
        :>> powerConsumption = 0.25[W];
        :>> mode : demo1Modes{
            safe{:>> percent = 100;}
            recovery{:>> percent = 100;}
            payloadOperation{:>> percent = 100;}
        }
        part solarPanel_1 :> tripleJunctionGaAs;
        part solarPanel_2 :> tripleJunctionGaAs;
        part solarPanel_3 :> tripleJunctionGaAs;
        part solarPanel_4 :> tripleJunctionGaAs;
        part solarPanel_5 :> tripleJunctionGaAs;
        part solarPanel_6 :> tripleJunctionGaAs;
    }

    part tripleJunctionGaAs : EPS::SolarPanel{
        :>> vendor = "ISIS";
        :>> conversionEfficiency = 0.28;
        :>> tempRange{
            :>> upper = 125['°C'];
            :>> lower = -20['°C'];
        }
    }
    
    attribute def demo1Mode{
        attribute name : String;
        attribute percent : Natural;
    }

    enum def demo1Modes :> demo1Mode{
        enum safe{
            :>> name = "Safe Mode";
        }
        enum recovery{
            :>> name = "Recovery Mode";
        }
        enum payloadOperation{
            :>> name = "Payload Operation Mode";
        }
    }

    attribute demo1PowerMargin = demo1Sys.powerMargin;

    /* 5.1 P31U from Gomspace for electrical power control */
    part P31U : EPS::PowerSupplyBoard{
        doc /*
            The NanoPower is designed as fully analogue solution,
            but with a microcontroller for digital interfacing and maximum power point tracking. 
            This together with a simple and flight proven architecture ensures high reliability. 
            */
        :>> vendor = ("Gomspace", "NPU");
        item :>> shape : Box {
            :>> length = 96 [mm];
            :>> width = 90 [mm];
            :>> height = 26 [mm];
        }
        attribute ChargeTempRange :> tempRange{
            :>> upper = 45['°C'];
            :>> lower = -5['°C'];
        }
        attribute DischargeTempRange :> tempRange{
            :>> upper = 60['°C'];
            :>> lower = -20['°C'];
        }
        :>> powerEnd[3]{
            attribute power = 30[W];
        }
        :>> converterEfficiency = 0.93;
        attribute photovoltaicPowerPoint : photovoltaicPowerPointOperations;
        :>> interfaceType = InterfaceType::I2C;
        :>> lithiumIonBatteryPack{
            :>> power = 2600e-3['A'*'h'];
        }
    }

    enum def photovoltaicPowerPointOperations{
        enum HardwareFixedVoltage;
        enum SoftwareAdjustableVoltage;
        enum MaximumPowerPointTracking;
    }

    /* 5.2 EPS board from NPU for another candidate */
    // TBD

    /* 6、7 On Board Computer */
    part demo1OBC : OBDH::OnBoardComputer{
        doc /*
            There are two parallel processors are embedded in one SRAM CycloneV FPGA 
            and an arbitrator is embedded in another Flash Based FPGA.
            */
        :>> vendor = "NPU";
        :>> operationSystem = "MicroC/OSII";
        :>> tempRange{
            :>> upper = 70['°C'];
            :>> lower = -40['°C'];
        }
        :>> powerConsumption = 0.9[W];
        :>> mode : demo1Modes{
            safe{:>> percent = 100;}
            recovery{:>> percent = 100;}
            payloadOperation{:>> percent = 100;}
        }
        part SRAM_FPGA : OBDH::FPGA{
            :>> fpgaType = DataProcessingUnit;
            doc /*
                The ferroelectric RAM cell, known as FRAM or FRAM, is conceptually similar to the DRAM cell,
                in that a single capacitor stores one bit of information and the cell is connected to a memory
                column via a single pass transistor(1T-1C cell, although 2T cells are also common).
                */
            part SoftKernelProcessor_1 : OBDH::FRAM;
            part SoftKernelProcessor_2 : OBDH::FRAM;
        }
        part FLASHS29GL256 : OBDH::FPGA{
            :>> fpgaType = VotingControlUnit;
            action Switcher;
            action ReconfigurationControl;
            action VotingControl;
            action ErrorDectection;
            action SyncControl;
        }
        part CrystalOscillator [2] : OBDH::ElectronicComponents;
        part FPGACycloneV : OBDH::FPGA;
        part PowerRegulatorEP53A [3] : OBDH::ElectronicComponents;
        part PC104Connector : OBDH::ElectronicComponents;
        part ConfigurationChipEPCQ256 : OBDH::ElectronicComponents;
        part Proasic3FPGA : OBDH::FPGA;

        interface : BUS connect SRAM_FPGA.dataEnd to demo1DataBUS.dataEnd;
        interface : DataLine connect SRAM_FPGA.dataEnd to HMC5983.dataEnd;
        interface Processor1Output : DataLine connect SRAM_FPGA.dataEnd to FLASHS29GL256.dataEnd;
        interface Processor2Output : DataLine connect SRAM_FPGA.dataEnd to FLASHS29GL256.dataEnd;
    }

    part demo1DataBUS : OBDH::I2C;

    /* 8 Communication Subsystem */
    part demo1Transceiver : COMM::Transceiver{
        doc/*
            ‘demo-1’ use amateur radio band UHF and VHF for the communication between ground station and satellite. 
            */
        :>> vendor = "ISIS";
        :>> tempRange{
            :>> upper = 50['°C'];
            :>> lower = -20['°C'];
        }
        :>> waveType = (UHF, VHF);
        :>> powerConsumption = 1.7[W];
        :>> mode : demo1Modes{
            safe{:>> percent = 100;}
            recovery{:>> percent = 100;}
            payloadOperation{:>> percent = 100;}
        }
        attribute UHFDownlink :>> Downlink{
            :>> frequencyRange{
                :>> upper = 450e6[Hz];
                :>> lower = 400e6[Hz];
            }
            :>> transmitPower = 500e-3[W];
            :>> modulation = "Raised Shift Keying (BPSK)";
        }

        attribute VHFUplink :>> Uplink{
            :>> frequencyRange{
                :>> upper = 170e6[Hz];
                :>> lower = 130e6[Hz];
            }
            :>> receivePower = 100e-3[W];
            :>> modulation = "Audio Frequency Shift Keyinng 1200Hz/2200Hz (Bell202)";
            :>> protocol = "AX.25";
        }
    }

    part antenna : COMM::Antenna{
        :>> vendor = "ISIS";
        :>> tempRange{
            :>> upper = 70['°C'];
            :>> lower = -30['°C'];
        }
    }

    /* 9 Ground Station */
    part NPU_GroundStation : GS::GroundStation{
        :>> location = "Xi'an, China";
        :>> latitude = 34.2392['°'];
        :>> longitude = 108.915['°'];
        UHFfrequency :> frequencyRange{
            :>> waveType = UHF;
            :>> upper = 450e6[Hz];
            :>> lower = 430e6[Hz];
        }
        VHFfrequency :> frequencyRange{
            :>> waveType = VHF;
            :>> upper = 146e6[Hz];
            :>> lower = 144e6[Hz];
        }
        :>> modulationType{
            :>> upper = 1200;
            :>> lower = 9600;
        }
        :>> UplinkCapabilities = ('1200bd AFSK', '9600bd G3RUH FSK');
        :>> DownlinkCapabilities = ('1200bd AFSK', '1200bd BPSK', '9600bd G3RUH FSK');
    }

    /* 10 Thermal Control Subsystem */
    part demo1TCS : TCS::TCSParameters{
        :>> solarCellsEfficiency = 0.2;
        :>> solarCellsAbsorptivity = 0.9;
        :>> frameAbsorptivity = 0.25;
        :>> solarCellsEmissivity = 0.8;
        :>> frameEmissivity = 0.8;
        :>> PCBPanelsAbsorptivity = 0.75;
        :>> PCBPanelsEmissivity = 0.89;

    }

    // private import 'Requirement CubeSat'::*;
    // private import cubeSatProjects::*;
    // part demo_1System{
    //     part demo : CubeSat;
    //     part demoProject : CubeSatProject;
    //     satisfy CubeSatSystemRequirements by demo{
    //         satisfy 'QB50-SYS-1.1.6' by demo;
    //     }
    //     satisfy '2' by demoProject{
    //         satisfy 'QB50-SYS-2.1.1' by demoProject;
    //     }
    // }
}