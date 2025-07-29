package SS{
    private import CubeSat_Base::*;
    part def OneUnitStructure :> EntityComponent{
        :>> sysType = SystemType::SS;
        part body{
            item :>> shape : Box {
                :>> length = 100.0 [mm];
                :>> width = 100.0 [mm];
                :>> height = 100.0 [mm];
            }
            attribute :>> coordinateFrame {
                :>> transformation : TranslationRotationSequence {
                    :>> elements = (Translation( (0, 0, 0)[source]), Rotation((0, 0, 1)[source], 0['°']));
                }
            }
            attribute lengthError : LengthValue[0..1];
            attribute widthError : LengthValue[0..1];
            attribute heightError : LengthValue[0..1];
        }
        part feet {
            item :>> shape : Rectangle {
                :>> length = 8.5 [mm];
                :>> width = 8.5 [mm];
            }
            attribute lengthError : LengthValue[0..1];
            attribute widthError : LengthValue[0..1];
        }
        attribute :>> geometricCenter{
            :> x = 50.0 [mm];
            :> y = 50.0 [mm];
            :> z = 50.0 [mm];
        }
    }

    part def TwoUnitsStructure :> OneUnitStructure{
        :>> shape {
            :>> height = 277.0 [mm];
        }
        attribute :>> geometricCenter{
            :> x = 50.0 [mm];
            :> y = 50.0 [mm];
            :> z = 138.5 [mm];
        }
    }

    part def ThreeUnitsStructure :> OneUnitStructure{
        item :>> shape {
            :>> height = 340.0 [mm];
        }
        attribute :>> geometricCenter{
            :> x = 50.0 [mm];
            :> y = 50.0 [mm];
            :> z = 170.0 [mm];
        }
    }
}