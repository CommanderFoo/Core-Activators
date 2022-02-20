Assets {
  Id: 6245091663761368581
  Name: "Activator_Regen"
  PlatformAssetType: 3
  TextAsset {
    CustomParameters {
      Overrides {
        Name: "cs:Debug"
        Bool: false
      }
      Overrides {
        Name: "cs:RegenAmount"
        Float: 5
      }
      Overrides {
        Name: "cs:RegenSpeed"
        Float: 3
      }
      Overrides {
        Name: "cs:Effect"
        AssetReference {
          Id: 12100286796155060558
        }
      }
      Overrides {
        Name: "cs:EffectLocation"
        ObjectReference {
        }
      }
    }
    Assets {
      Id: 12100286796155060558
      Name: "Level Up VFX"
      PlatformAssetType: 8
      PrimaryAsset {
        AssetType: "VfxBlueprintAssetRef"
        AssetId: "fxbp_Level_Up"
      }
    }
  }
  SerializationVersion: 107
  DirectlyPublished: true
}
