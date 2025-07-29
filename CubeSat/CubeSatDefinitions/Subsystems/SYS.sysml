package SYS{
    private import CubeSat_Base::*;
    private import CubeSat_CalcFunctions::*;
    public import Time::Iso8601DateTime;
    part def CubeSatSystem :> FunctionComponent{
        attribute track : Track;
        

    }
    part def QB50_SYS :> CubeSatSystem;
    
    attribute def Track{
        attribute SatelliteCatalogNumber : Integer;
        attribute Classification : ClassificationType;
        attribute InternationalDesignator : String;
    }

    attribute def EarthOrbit :> Track{
        attribute Epoch : Iso8601DateTime;
        attribute semiMajorAxis : ISQ::LengthValue;
        attribute inclination : ISQ::AngularMeasureValue;
        attribute eccentricity : Positive;
        attribute RAAN : ISQ::AngularMeasureValue;
        attribute argumentOfPerigee : ISQ::AngularMeasureValue;
        attribute meanAnomalyAtEpoch : ISQ::AngularMeasureValue;

        attribute orbitAltitude : ISQ::LengthValue[1..2];
        attribute orbitalPeriod : ISQ::TimeValue = CountOrbitalPeriod(semiMajorAxis, GravitationalConstant);
    }

    attribute def EarthOrbit2 :> Track{
        attribute Epoch : Iso8601DateTime;
        attribute ndot : Real;
        attribute ndotdot : Real;
        attribute bSTAR : Real;
        attribute ephemerisType : Integer;
        attribute elementSetNumber : String;
        attribute checksum : Integer;
        attribute inclination : ISQ::AngularMeasureValue;
        attribute raan : ISQ::AngularMeasureValue;
        attribute eccentricity : Real;
        attribute argumentofPerigee : ISQ::AngularMeasureValue;
        attribute meanAnomaly : ISQ::AngularMeasureValue;
        attribute meanMotion : Positive;
    }

    attribute ASRTU1 : EarthOrbit2{
        :> SatelliteCatalogNumber = 99130;
        // :> Classification = Unclassified;
        :> InternationalDesignator = "24099A";
        :> Epoch {
            :> val = "2024-11-09T01:10:14.533Z";
        }
        :> ndot = -0.00328134;
        :> ndotdot = 0;
        :> bSTAR = -0.00328134;
        :> ephemerisType = 0;  
        :> elementSetNumber = "0000";
        :> checksum = 9;
        :> inclination = 97['°'];
        :> raan = 181.2765['°'];
        :> eccentricity = 0.001672;
        :> argumentofPerigee = 216.0612['°'];
        :> meanAnomaly = 302.6737['°'];
        :> meanMotion = 15.23;
    }

    enum def ClassificationType{
        enum Unclassified;
        enum Classified;
        enum Secret;
    }
}