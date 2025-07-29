package CubeSat_Action{
    private import CubeSat_Base::*;
    private import CubeSat_CalcFunctions::*;
    abstract item def DesignDocument;
    item def DesignRequirements :> DesignDocument;
    item def DesignConstraint :> DesignDocument;
    item def SubsystemsConstraint :> DesignDocument;
    item def testPiece :> CubeSatEntity;
    item def Prototype :> CubeSatEntity;
    item def Design :> CubeSatEntity;
    item def usersManual :> DesignDocument;
    // item def Conditions :> DesignRequirements;

    action def CubeStar_Lifecycle{
        in item designRequirements : DesignRequirements;
        in item designConstraint : DesignConstraint;
        in item subsystemsConstraint : SubsystemsConstraint;
        out item design : Design;
        out item prototype : Prototype;
        out item results : DesignDocument;

        bind 'Global system design'.designRequirements = designRequirements;
        bind 'Global system design'.designConstraint = designConstraint;
        bind 'Global system design'.subsystemsConstraint = subsystemsConstraint;

        action 'Global system design'{
            in item designRequirements;
            in item designConstraint;
            in item subsystemsConstraint;
            out item design;
        }

        succession flow from 'Global system design'.design to 'TestPiece manufacturing'.design;
        action 'TestPiece manufacturing'{
            in item design;
            out item testPiece;
        }

        succession flow from 'Global system design'.design to 'Qualification testing'.design;
        succession flow from 'TestPiece manufacturing'.testPiece to 'Qualification testing'.testPiece;
        action 'Qualification testing'{
            in item testPiece;
            in item design;
            out item designPlus;
        }
        succession flow from 'Qualification testing'.designPlus to 'Prototype manufacturing'.design;
        action 'Prototype manufacturing'{
            in item design;
            out item prototype;
        }

        succession flow from 'Qualification testing'.designPlus to 'Acceptance testing'.design;
        succession flow from 'Prototype manufacturing'.prototype to 'Acceptance testing'.prototype;
        action 'Acceptance testing'{
            in item prototype;
            in item design;
            out item usersManual;
            out item prototypeTested;
        }
        succession flow from 'Acceptance testing'.prototypeTested to 'Protoflight'.prototype;
        succession flow from 'Acceptance testing'.usersManual to 'Protoflight'.usersManual;
        action 'Protoflight'{
            in item usersManual;
            in item prototype;
            out item results;
        }
        bind 'Protoflight'.results = results;
        bind 'Acceptance testing'.prototype = prototype;
        bind 'Qualification testing'.designPlus = design;
    }

}