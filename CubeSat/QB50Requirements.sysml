package QB50Requirements {
	// private import 'Requirement Definitions'::*;
	// private import 'Requirement Usages'::*;
	private import ScalarValues::*;
    // private import ISQ::*;
    private import SI::*;
    private import cubeSatProjects::*;

	requirement <'1'> CubeSatSystemRequirements {
		doc /* Overall vehicle requirements group */
		
		subject cubesat : CubeSat;
        requirement <'QB50-SYS-1.1.6'> cubeSatCentre{
            doc /* The CubeSat centre of gravity shall be located within a sphere of 20 mm diameter, centered on the CubeSat geometric centre. */
            subject cubesat : CubeSat;
            constraint{
                distenance(cubesat.centre, cubesat.centreOfGravity) <= 20.00
            }
        }
	}
	
	requirement <'2'>  QualificationandAcceptanceTestingRequirementsforLaunc {
		doc /* Engine power requirements group */
		
		subject p : CubeSatProject;
		requirement <'QB50-SYS-2.1.1'> acceleration {
			doc /* CubeSat shall pass the acceleration (quasi-static) test as per Table6. */
            subject : p;
            constraint {
                p.CubeSatQualification.ac.amplitude >= 13.0[mm] &
                p.CubeSatQualification.ac.method == true &
                p.CubeSatAcceptance.ac.method == false &
                p.CubeSatProtoflight.ac.amplitude >= 10.0[mm] &
                p.CubeSatProtoflight.ac.method == true
		    }
		}
	}
}