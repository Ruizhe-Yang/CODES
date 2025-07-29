package cubeSatProjects{
    private import ScalarValues::*;
    private import SI::*;
    part def CubeSat {
        part structure;
        attribute centre : Real;
        attribute centreOfGravity : Real;
        attribute ac : AccelerationCharacteristics;
		// port clutchPort;
		// perform action generateTorque;
	}
	
    attribute def AccelerationCharacteristics{
        attribute referenceFrame : String := "{BRF}";
        attribute direction : String := "X,Y,Z";
        attribute amplitude : Real := 0.0[mm];
        attribute method : Boolean := false;
    }

    part def CubeSatProject{
        part CubeSatQualification : CubeSat;
        part CubeSatAcceptance : CubeSat;
        part CubeSatProtoflight : CubeSat;
    }
    
    attribute def dis;
    
    calc def distenance{
        in x : Real;
        in y : Real;
        return : dis = x - y;
    }
}