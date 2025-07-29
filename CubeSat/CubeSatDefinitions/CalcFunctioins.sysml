package CubeSat_CalcFunctions {
    private import CubeSat_Base::*;
    private import CubeSat_Definitions::*;
    private import Time::DurationValue;

    calc def CountCubeSatSystemMass{
        in cs : CubeSatEntity;
        return cubesatMass : ISQ::MassValue = sum(cs.sys.mass, cs.ss.mass, cs.pay.mass, cs.adcs.mass,
        cs.eps.mass, cs.obdh.mass, cs.comm.mass, cs.tcs.mass, cs.dep.mass, cs.prop.mass,
        cs.sys.massError, cs.ss.massError, cs.pay.massError, cs.adcs.massError,
        cs.eps.massError, cs.obdh.massError, cs.comm.massError, cs.tcs.massError, cs.dep.massError, cs.prop.massError);
    }

    calc def CountCubeSatGravityCenter{
        in cs : CubeSatEntity;
        return : CartesianPosition3dVector;
    }
    calc def CountOrbitalPeriod{
        doc/*
            Calculation of orbital period
        */
        in a : ISQ::LengthValue;
        return : ISQ::TimeValue = 2*PI*sqrt(a^3/GravitationalConstant);
    }

    calc def OrbitalAttenuation{
		in m : ISQ::MassValue;
        in dt : Time::DurationValue;
        in rho : Real; //TBD
        attribute C_D = 2.2;
	    language "Latex"
	        /* 
	        $$ \frac{da}{dt} = -\frac{C_D A \rho}{m} \sqrt{\frac{\mu}{a}} $$
	        */
        return : ISQ::LengthValue;
	}

    calc def CountSysPowerConsumed{
        in cubeSat : CubeSatEntity;
        return : ISQ::PowerValue;
    }
    
    calc def CountSysPowerGenerated{
        in cubeSat : CubeSatEntity;
        return : ISQ::PowerValue;
    }
    

}