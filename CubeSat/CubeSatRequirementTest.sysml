package CubeSatRequirementTest{
    private import CubeSat_Definitions::*;
    private import Time::Iso8601DateTime;
    requirement def CubeSatRequirement{
        attribute id : String;
        attribute description : String;
        attribute priority : RequirementPriority;
        attribute status : RequirementStatus;
        attribute verificationMethod : VerificationMethod;
        attribute verificationStatus : VerificationStatus;
    }

    part CubeSatProject{
        attribute name : String;
        attribute description : String;
        attribute startDate : Iso8601DateTime;
        attribute endDate : Iso8601DateTime;
        part entity : CubeSatEntity;
        action actions : CubeStar_Lifecycle;
    }

    requirement CubeSatRequirements : CubeSatRequirement{
        :> id = "CR-001";
        :> description = "The CubeSat must be capable of operating in low Earth orbit.";
        :> priority = RequirementPriority::Critical;
        :> status = RequirementStatus::Proposed;
        :> verificationMethod = VerificationMethod::Analysis;
        :> verificationStatus = VerificationStatus::NotStarted;
    }

    satisfy CubeSatRequirements by CubeSatProject;

    enum def RequirementPriority{
        enum Critical;
        enum High;
        enum Medium;
        enum Low;
    }

    enum def RequirementStatus {
        enum Proposed;
        enum Approved;
        enum Rejected;
        enum Implemented;
        enum Verified;
    }

    enum def VerificationMethod {
        enum Analysis;
        enum Inspection;
        enum Test;
        enum Demonstration;
    }

    enum def VerificationStatus {
        enum NotStarted;
        enum InProgress;
        enum Completed;
        enum Failed;
    }
}