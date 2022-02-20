Assets {
  Id: 14857013457588830150
  Name: "Activator"
  PlatformAssetType: 5
  TemplateAsset {
    ObjectBlock {
      RootId: 1960177832676743713
      Objects {
        Id: 1960177832676743713
        Name: "TemplateBundleDummy"
        Transform {
          Location {
          }
          Rotation {
          }
          Scale {
            X: 1
            Y: 1
            Z: 1
          }
        }
        Folder {
          BundleDummy {
            ReferencedAssets {
              Id: 6041880902928097477
            }
            ReferencedAssets {
              Id: 7165532309299719857
            }
            ReferencedAssets {
              Id: 15319179288232174427
            }
            ReferencedAssets {
              Id: 6245091663761368581
            }
            ReferencedAssets {
              Id: 1102508149476537346
            }
          }
        }
      }
    }
    Assets {
      Id: 1102508149476537346
      Name: "Level Up VFX"
      PlatformAssetType: 5
      TemplateAsset {
        ObjectBlock {
          RootId: 8807441784971254081
          Objects {
            Id: 8807441784971254081
            Name: "Level Up VFX"
            Transform {
              Scale {
                X: 1
                Y: 1
                Z: 1
              }
            }
            ParentId: 4781671109827199097
            Collidable_v2 {
              Value: "mc:ecollisionsetting:inheritfromparent"
            }
            Visible_v2 {
              Value: "mc:evisibilitysetting:inheritfromparent"
            }
            CameraCollidable {
              Value: "mc:ecollisionsetting:inheritfromparent"
            }
            EditorIndicatorVisibility {
              Value: "mc:eindicatorvisibility:visiblewhenselected"
            }
            Blueprint {
              BlueprintAsset {
                Id: 12100286796155060558
              }
              TeamSettings {
              }
              Vfx {
                AutoPlay: true
              }
            }
            Relevance {
              Value: "mc:eproxyrelevance:medium"
            }
            NetworkRelevanceDistance {
              Value: "mc:eproxyrelevance:critical"
            }
          }
        }
        PrimaryAssetId {
          AssetType: "None"
          AssetId: "None"
        }
      }
      DirectlyPublished: true
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
    Assets {
      Id: 6245091663761368581
      Name: "Activator_Regen"
      PlatformAssetType: 3
      TextAsset {
        Text: "local DEBUG = script:GetCustomProperty(\"Debug\")\r\nlocal REGEN_AMOUNT = script:GetCustomProperty(\"RegenAmount\")\r\nlocal REGEN_SPEED = script:GetCustomProperty(\"RegenSpeed\")\r\nlocal EFFECT = script:GetCustomProperty(\"Effect\")\r\nlocal EFFECT_LOCATION = script:GetCustomProperty(\"EffectLocation\"):WaitForObject()\r\n\r\nlocal task = nil\r\nlocal played_effect = false\r\n\r\nlocal function enable(player)\r\n\tif(task == nil) then\r\n\t\tif(not played_effect and Environment.IsClient()) then\r\n\t\t\tWorld.SpawnAsset(EFFECT, { position = EFFECT_LOCATION:GetWorldPosition() })\r\n\t\t\tplayed_effect = true\r\n\t\tend\r\n\r\n\t\tif(DEBUG) then\r\n\t\t\tprint(\"Regen activator running\")\r\n\t\tend\r\n\r\n\t\tif(Environment.IsServer()) then\r\n\t\t\tEvents.Broadcast(\"activator.set_resource\", player, \"Bell\", 1)\r\n\t\tend\r\n\r\n\t\tif(Environment.IsServer()) then\r\n\t\t\ttask = Task.Spawn(function()\r\n\t\t\t\tif(DEBUG) then\r\n\t\t\t\t\tprint(\"Healing players\")\r\n\t\t\t\tend\r\n\r\n\t\t\t\tEvents.Broadcast(\"activate.apply_damage\", -REGEN_AMOUNT)\r\n\t\t\tend)\r\n\r\n\t\t\ttask.repeatInterval = REGEN_SPEED\r\n\t\t\ttask.repeatCount = -1\r\n\t\tend\r\n\tend\r\nend\r\n\r\nlocal function disable()\r\n\tif(task ~= nil) then\r\n\t\ttask:Cancel()\r\n\t\ttask = nil\r\n\r\n\t\tif(DEBUG) then\r\n\t\t\tprint(\"Regen activator stopped\")\r\n\t\tend\r\n\tend\r\n\r\n\tplayed_effect = false\r\nend\r\n\r\nEvents.Connect(\"activator.enable\", enable)\r\nEvents.Connect(\"activator.disable\", disable)"
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
      }
      DirectlyPublished: true
    }
    Assets {
      Id: 15319179288232174427
      Name: "Activator_Cross_Context_Server"
      PlatformAssetType: 3
      TextAsset {
        Text: "Events.Connect(\"activator.set_resource\", function(player, resource, value)\r\n\tplayer:SetResource(resource, value)\r\nend)\r\n\r\nEvents.Connect(\"activator.add_resource\", function(player, resource, value)\r\n\tplayer:AddResource(resource, value)\r\nend)\r\n\r\nEvents.Connect(\"activator.remove_resource\", function(player, resource, value)\r\n\tplayer:RemoveResource(resource, value)\r\nend)\r\n\r\nEvents.Connect(\"activator.apply_damage\", function(amount)\r\n\tfor i, p in ipairs(Game.GetPlayers()) do\r\n\t\tp:ApplyDamage(Damage.New(amount))\r\n\tend\r\nend)"
        CustomParameters {
        }
      }
      DirectlyPublished: true
    }
    Assets {
      Id: 7165532309299719857
      Name: "Activator"
      PlatformAssetType: 3
      TextAsset {
        Text: "local ROOT = script:GetCustomProperty(\"Root\"):WaitForObject()\r\nlocal TRIGGER = script:GetCustomProperty(\"Trigger\"):WaitForObject()\r\nlocal DEFAULT_STATE = script:GetCustomProperty(\"DefaultState\"):WaitForObject()\r\nlocal ACTIVE_STATE = script:GetCustomProperty(\"ActiveState\"):WaitForObject()\r\n\r\nlocal ACTIVE_STATE_DURATION = ROOT:GetCustomProperty(\"ActiveStateDuration\")\r\n\r\n\r\nlocal function on_trigger_enter(trigger, other)\r\n\tif(Object.IsValid(other) and other:IsA(\"Player\")) then\r\n\t\tDEFAULT_STATE.visibility = Visibility.FORCE_OFF\r\n\t\tDEFAULT_STATE.collision = Collision.FORCE_OFF\r\n\r\n\t\tACTIVE_STATE.visibility = Visibility.FORCE_ON\r\n\t\tACTIVE_STATE.collision = Collision.FORCE_ON\r\n\r\n\t\tEvents.Broadcast(\"activator.enable\", other)\r\n\r\n\t\tTask.Wait(ACTIVE_STATE_DURATION)\r\n\r\n\t\tDEFAULT_STATE.visibility = Visibility.FORCE_ON\r\n\t\tDEFAULT_STATE.collision = Collision.FORCE_ON\r\n\r\n\t\tACTIVE_STATE.visibility = Visibility.FORCE_OFF\r\n\t\tACTIVE_STATE.collision = Collision.FORCE_OFF\r\n\r\n\t\tEvents.Broadcast(\"activator.disable\")\r\n\tend\r\nend\r\n\r\nTRIGGER.beginOverlapEvent:Connect(on_trigger_enter)"
        CustomParameters {
        }
      }
      DirectlyPublished: true
    }
    Assets {
      Id: 6041880902928097477
      Name: "Activator"
      PlatformAssetType: 5
      TemplateAsset {
        ObjectBlock {
          RootId: 3428068341347595782
          Objects {
            Id: 3428068341347595782
            Name: "Player Activator"
            Transform {
              Scale {
                X: 1
                Y: 1
                Z: 1
              }
            }
            ParentId: 4781671109827199097
            ChildIds: 6817333277036584339
            Collidable_v2 {
              Value: "mc:ecollisionsetting:inheritfromparent"
            }
            Visible_v2 {
              Value: "mc:evisibilitysetting:inheritfromparent"
            }
            CameraCollidable {
              Value: "mc:ecollisionsetting:inheritfromparent"
            }
            EditorIndicatorVisibility {
              Value: "mc:eindicatorvisibility:visiblewhenselected"
            }
            Folder {
              IsGroup: true
            }
            NetworkRelevanceDistance {
              Value: "mc:eproxyrelevance:critical"
            }
          }
          Objects {
            Id: 6817333277036584339
            Name: "Activator"
            Transform {
              Location {
                X: 20.4203491
              }
              Rotation {
              }
              Scale {
                X: 1
                Y: 1
                Z: 1
              }
            }
            ParentId: 3428068341347595782
            ChildIds: 10746067029497623828
            ChildIds: 4384463584409284600
            ChildIds: 3389765659487694395
            ChildIds: 1438387032377482425
            UnregisteredParameters {
              Overrides {
                Name: "cs:ActiveStateDuration"
                Float: 5
              }
              Overrides {
                Name: "cs:ActiveStateDuration:isrep"
                Bool: false
              }
              Overrides {
                Name: "cs:ActiveStateDuration:ml"
                Bool: false
              }
            }
            NetworkContext {
              Type: Local
            }
          }
          Objects {
            Id: 10746067029497623828
            Name: "Server"
            Transform {
              Location {
                X: -20.4203491
              }
              Rotation {
              }
              Scale {
                X: 1
                Y: 1
                Z: 1
              }
            }
            ParentId: 6817333277036584339
            ChildIds: 3703659220080661868
            Collidable_v2 {
              Value: "mc:ecollisionsetting:inheritfromparent"
            }
            Visible_v2 {
              Value: "mc:evisibilitysetting:inheritfromparent"
            }
            CameraCollidable {
              Value: "mc:ecollisionsetting:inheritfromparent"
            }
            EditorIndicatorVisibility {
              Value: "mc:eindicatorvisibility:visiblewhenselected"
            }
            NetworkContext {
              Type: Server
            }
            NetworkRelevanceDistance {
              Value: "mc:eproxyrelevance:critical"
            }
          }
          Objects {
            Id: 3703659220080661868
            Name: "Activator_Cross_Context_Server"
            Transform {
              Location {
              }
              Rotation {
              }
              Scale {
                X: 1
                Y: 1
                Z: 1
              }
            }
            ParentId: 10746067029497623828
            Collidable_v2 {
              Value: "mc:ecollisionsetting:inheritfromparent"
            }
            Visible_v2 {
              Value: "mc:evisibilitysetting:inheritfromparent"
            }
            CameraCollidable {
              Value: "mc:ecollisionsetting:inheritfromparent"
            }
            EditorIndicatorVisibility {
              Value: "mc:eindicatorvisibility:visiblewhenselected"
            }
            Script {
              ScriptAsset {
                Id: 15319179288232174427
              }
            }
            NetworkRelevanceDistance {
              Value: "mc:eproxyrelevance:critical"
            }
          }
          Objects {
            Id: 4384463584409284600
            Name: "Activator"
            Transform {
              Location {
                X: -170.420349
              }
              Rotation {
              }
              Scale {
                X: 1
                Y: 1
                Z: 1
              }
            }
            ParentId: 6817333277036584339
            UnregisteredParameters {
              Overrides {
                Name: "cs:Trigger"
                ObjectReference {
                  SubObjectId: 7333907607841465395
                }
              }
              Overrides {
                Name: "cs:Root"
                ObjectReference {
                  SubObjectId: 6817333277036584339
                }
              }
              Overrides {
                Name: "cs:DefaultState"
                ObjectReference {
                  SubObjectId: 12156644691578349426
                }
              }
              Overrides {
                Name: "cs:ActiveState"
                ObjectReference {
                  SubObjectId: 12489751835026703264
                }
              }
            }
            Collidable_v2 {
              Value: "mc:ecollisionsetting:inheritfromparent"
            }
            Visible_v2 {
              Value: "mc:evisibilitysetting:inheritfromparent"
            }
            CameraCollidable {
              Value: "mc:ecollisionsetting:inheritfromparent"
            }
            EditorIndicatorVisibility {
              Value: "mc:eindicatorvisibility:visiblewhenselected"
            }
            Script {
              ScriptAsset {
                Id: 7165532309299719857
              }
            }
            NetworkRelevanceDistance {
              Value: "mc:eproxyrelevance:critical"
            }
          }
          Objects {
            Id: 3389765659487694395
            Name: "Activators"
            Transform {
              Location {
              }
              Rotation {
              }
              Scale {
                X: 1
                Y: 1
                Z: 1
              }
            }
            ParentId: 6817333277036584339
            ChildIds: 12262150691151982852
            Collidable_v2 {
              Value: "mc:ecollisionsetting:inheritfromparent"
            }
            Visible_v2 {
              Value: "mc:evisibilitysetting:inheritfromparent"
            }
            CameraCollidable {
              Value: "mc:ecollisionsetting:inheritfromparent"
            }
            EditorIndicatorVisibility {
              Value: "mc:eindicatorvisibility:visiblewhenselected"
            }
            Folder {
              IsGroup: true
            }
            NetworkRelevanceDistance {
              Value: "mc:eproxyrelevance:critical"
            }
          }
          Objects {
            Id: 12262150691151982852
            Name: "Activator_Regen"
            Transform {
              Location {
              }
              Rotation {
              }
              Scale {
                X: 1
                Y: 1
                Z: 1
              }
            }
            ParentId: 3389765659487694395
            UnregisteredParameters {
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
                  Id: 1102508149476537346
                }
              }
              Overrides {
                Name: "cs:EffectLocation"
                ObjectReference {
                  SubObjectId: 7170612628994408128
                }
              }
            }
            Collidable_v2 {
              Value: "mc:ecollisionsetting:inheritfromparent"
            }
            Visible_v2 {
              Value: "mc:evisibilitysetting:inheritfromparent"
            }
            CameraCollidable {
              Value: "mc:ecollisionsetting:inheritfromparent"
            }
            EditorIndicatorVisibility {
              Value: "mc:eindicatorvisibility:visiblewhenselected"
            }
            Script {
              ScriptAsset {
                Id: 6245091663761368581
              }
            }
            NetworkRelevanceDistance {
              Value: "mc:eproxyrelevance:critical"
            }
          }
          Objects {
            Id: 1438387032377482425
            Name: "States"
            Transform {
              Location {
                X: 150
              }
              Rotation {
              }
              Scale {
                X: 1
                Y: 1
                Z: 1
              }
            }
            ParentId: 6817333277036584339
            ChildIds: 12156644691578349426
            ChildIds: 12489751835026703264
            ChildIds: 7170612628994408128
            Collidable_v2 {
              Value: "mc:ecollisionsetting:inheritfromparent"
            }
            Visible_v2 {
              Value: "mc:evisibilitysetting:inheritfromparent"
            }
            CameraCollidable {
              Value: "mc:ecollisionsetting:inheritfromparent"
            }
            EditorIndicatorVisibility {
              Value: "mc:eindicatorvisibility:visiblewhenselected"
            }
            Folder {
              IsGroup: true
            }
            NetworkRelevanceDistance {
              Value: "mc:eproxyrelevance:critical"
            }
          }
          Objects {
            Id: 12156644691578349426
            Name: "Default State"
            Transform {
              Location {
              }
              Rotation {
              }
              Scale {
                X: 1
                Y: 1
                Z: 1
              }
            }
            ParentId: 1438387032377482425
            ChildIds: 18195735410505431123
            ChildIds: 7333907607841465395
            Collidable_v2 {
              Value: "mc:ecollisionsetting:inheritfromparent"
            }
            Visible_v2 {
              Value: "mc:evisibilitysetting:inheritfromparent"
            }
            CameraCollidable {
              Value: "mc:ecollisionsetting:inheritfromparent"
            }
            EditorIndicatorVisibility {
              Value: "mc:eindicatorvisibility:visiblewhenselected"
            }
            Folder {
              IsGroup: true
            }
            NetworkRelevanceDistance {
              Value: "mc:eproxyrelevance:critical"
            }
          }
          Objects {
            Id: 18195735410505431123
            Name: "Cube - Bottom-Aligned"
            Transform {
              Location {
              }
              Rotation {
              }
              Scale {
                X: 1
                Y: 1
                Z: 1
              }
            }
            ParentId: 12156644691578349426
            UnregisteredParameters {
              Overrides {
                Name: "ma:Shared_BaseMaterial:id"
                AssetReference {
                  Id: 5532858863921882602
                }
              }
              Overrides {
                Name: "ma:Shared_BaseMaterial:color"
                Color {
                  R: 1
                  G: 0.904222131
                  B: 0.138000011
                  A: 1
                }
              }
            }
            Collidable_v2 {
              Value: "mc:ecollisionsetting:forceoff"
            }
            Visible_v2 {
              Value: "mc:evisibilitysetting:inheritfromparent"
            }
            CameraCollidable {
              Value: "mc:ecollisionsetting:forceoff"
            }
            EditorIndicatorVisibility {
              Value: "mc:eindicatorvisibility:visiblewhenselected"
            }
            CoreMesh {
              MeshAsset {
                Id: 8926399518944649792
              }
              Teams {
                IsTeamCollisionEnabled: true
                IsEnemyCollisionEnabled: true
              }
              StaticMesh {
                Physics {
                  Mass: 100
                  LinearDamping: 0.01
                }
                BoundsScale: 1
              }
            }
            NetworkRelevanceDistance {
              Value: "mc:eproxyrelevance:critical"
            }
          }
          Objects {
            Id: 7333907607841465395
            Name: "Trigger"
            Transform {
              Location {
                Z: 50
              }
              Rotation {
              }
              Scale {
                X: 1
                Y: 1
                Z: 1
              }
            }
            ParentId: 12156644691578349426
            Collidable_v2 {
              Value: "mc:ecollisionsetting:inheritfromparent"
            }
            Visible_v2 {
              Value: "mc:evisibilitysetting:inheritfromparent"
            }
            CameraCollidable {
              Value: "mc:ecollisionsetting:inheritfromparent"
            }
            EditorIndicatorVisibility {
              Value: "mc:eindicatorvisibility:visiblewhenselected"
            }
            Trigger {
              TeamSettings {
                IsTeamCollisionEnabled: true
                IsEnemyCollisionEnabled: true
              }
              TriggerShape_v2 {
                Value: "mc:etriggershape:box"
              }
            }
            NetworkRelevanceDistance {
              Value: "mc:eproxyrelevance:critical"
            }
          }
          Objects {
            Id: 12489751835026703264
            Name: "Active State"
            Transform {
              Location {
              }
              Rotation {
              }
              Scale {
                X: 1
                Y: 1
                Z: 1
              }
            }
            ParentId: 1438387032377482425
            ChildIds: 17023413876425794524
            Collidable_v2 {
              Value: "mc:ecollisionsetting:inheritfromparent"
            }
            Visible_v2 {
              Value: "mc:evisibilitysetting:forceoff"
            }
            CameraCollidable {
              Value: "mc:ecollisionsetting:inheritfromparent"
            }
            EditorIndicatorVisibility {
              Value: "mc:eindicatorvisibility:visiblewhenselected"
            }
            Folder {
              IsGroup: true
            }
            NetworkRelevanceDistance {
              Value: "mc:eproxyrelevance:critical"
            }
          }
          Objects {
            Id: 17023413876425794524
            Name: "Cube - Bottom-Aligned"
            Transform {
              Location {
              }
              Rotation {
              }
              Scale {
                X: 1
                Y: 1
                Z: 1
              }
            }
            ParentId: 12489751835026703264
            UnregisteredParameters {
              Overrides {
                Name: "ma:Shared_BaseMaterial:id"
                AssetReference {
                  Id: 5532858863921882602
                }
              }
              Overrides {
                Name: "ma:Shared_BaseMaterial:color"
                Color {
                  G: 0.131714448
                  B: 0.922000051
                  A: 1
                }
              }
            }
            Collidable_v2 {
              Value: "mc:ecollisionsetting:forceoff"
            }
            Visible_v2 {
              Value: "mc:evisibilitysetting:inheritfromparent"
            }
            CameraCollidable {
              Value: "mc:ecollisionsetting:forceoff"
            }
            EditorIndicatorVisibility {
              Value: "mc:eindicatorvisibility:visiblewhenselected"
            }
            CoreMesh {
              MeshAsset {
                Id: 8926399518944649792
              }
              Teams {
                IsTeamCollisionEnabled: true
                IsEnemyCollisionEnabled: true
              }
              StaticMesh {
                Physics {
                  Mass: 100
                  LinearDamping: 0.01
                }
                BoundsScale: 1
              }
            }
            NetworkRelevanceDistance {
              Value: "mc:eproxyrelevance:critical"
            }
          }
          Objects {
            Id: 7170612628994408128
            Name: "Effect Location"
            Transform {
              Location {
                Z: 50
              }
              Rotation {
              }
              Scale {
                X: 1
                Y: 1
                Z: 1
              }
            }
            ParentId: 1438387032377482425
            UnregisteredParameters {
              Overrides {
                Name: "bp:Type"
                Enum {
                  Value: "mc:evolumetype:0"
                }
              }
            }
            Collidable_v2 {
              Value: "mc:ecollisionsetting:inheritfromparent"
            }
            Visible_v2 {
              Value: "mc:evisibilitysetting:inheritfromparent"
            }
            CameraCollidable {
              Value: "mc:ecollisionsetting:inheritfromparent"
            }
            EditorIndicatorVisibility {
              Value: "mc:eindicatorvisibility:visiblewhenselected"
            }
            Blueprint {
              BlueprintAsset {
                Id: 10566247032646574771
              }
              TeamSettings {
              }
            }
          }
        }
        PrimaryAssetId {
          AssetType: "None"
          AssetId: "None"
        }
      }
      DirectlyPublished: true
    }
    Assets {
      Id: 10566247032646574771
      Name: "Dummy Object"
      PlatformAssetType: 6
      PrimaryAsset {
        AssetType: "BlueprintAssetRef"
        AssetId: "fxbp_dummy_pivot"
      }
    }
    Assets {
      Id: 5532858863921882602
      Name: "Plastic Matte"
      PlatformAssetType: 2
      PrimaryAsset {
        AssetType: "MaterialAssetRef"
        AssetId: "plastic_matte_001"
      }
    }
    Assets {
      Id: 8926399518944649792
      Name: "Cube - Bottom-Aligned"
      PlatformAssetType: 1
      PrimaryAsset {
        AssetType: "StaticMeshAssetRef"
        AssetId: "sm_cube_001"
      }
    }
    PrimaryAssetId {
      AssetType: "None"
      AssetId: "None"
    }
  }
  Marketplace {
    Id: "bdbdc995245d45a9b47c364482afaf2c"
    OwnerAccountId: "93d6eaf2514940a08c5481a4c03c1ee3"
    OwnerName: "CommanderFoo"
    Description: "Activator"
  }
  SerializationVersion: 107
}
IncludesAllDependencies: true
