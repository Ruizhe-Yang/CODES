package 'CubeSatBasicModel' {
    private import ScalarValues::*;
	part def CubeSat {
		part power;
		part communication;
		part thermal;
		part control;
		part payload;
	}

	requirement def MBSEBenefits {
		doc /* MBSE提供一致性、可重用性、无歧义性和可计算性 */
        subject : CubeSat;
        attribute consistency : Boolean;
        attribute reusability : Boolean;
        attribute unambiguity : Boolean;
        attribute computability : Boolean;
		assert constraint {
			consistency & reusability & unambiguity & computability
		}
	}
}

package 'CubeSatArchitectureModel' {

	/* Conceptual definition for the whole system */
	package SystemConceptDefinitions {
		doc /* Contains conceptual-level parameter definitions for CubeSat subsystems. */
		
		attribute def powerCapacity;
		attribute def thermalLimit;
		attribute def communicationRange;
		attribute def controlAlgorithm;
		attribute def payloadSpecification;
	}

	/* Library of subsystem device parameters, reused in physical designs */
	package SubsystemDeviceLibrary {
		private import SystemConceptDefinitions::*;

		part def PowerSubsystem {
			attribute capacity : powerCapacity;
		}
		part def ThermalSubsystem {
			attribute limit : thermalLimit;
		}
		part def CommunicationSubsystem {
			attribute range : communicationRange;
		}
		part def ControlSubsystem {
			attribute algorithm : controlAlgorithm;
		}
		part def PayloadSubsystem {
			attribute specification : payloadSpecification;
		}
	}

	/* Physical design elements inheriting subsystem definitions */
	package SatellitePhysicalDesign {
		private import SubsystemDeviceLibrary::*;

		part def SatelliteDesign {
			part power : PowerSubsystem;
			part thermal : ThermalSubsystem;
			part communication : CommunicationSubsystem;
			part control : ControlSubsystem;
			part payload : PayloadSubsystem;
		}
	}

	/* Lifecycle indexing to physical and textual elements */
	package MissionLifecycle {
		private import SatellitePhysicalDesign::*;

		part def MissionLifecyclePhases {
			part conceptPhase;
			part designPhase;
			part testingPhase;
			part launchPhase;
			part operationPhase;

			ref satelliteDesign : SatelliteDesign;
		}
	}

	/* System engineering documentation index */
	package EngineeringDocuments {
		private import MissionLifecycle::*;

		part def SystemEngineeringText {
			ref part linksToLifecycle : MissionLifecyclePhases;
		}
	}

    
}


package 'Benefits of MBSE compared to TBSE' { 
	private import ScalarValues::*;

	part MBSE {
		part automation;
		part standardization;
	}

	part automation {
		part source: machineReadable;
	}

	part standardization {
		part source1: bottomUpDefinition;
		part source2: topDownModeling;
	}

	part def machineReadable;
	part def bottomUpDefinition;
	part def topDownModeling;
}


