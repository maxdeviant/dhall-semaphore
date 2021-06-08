let EnvironmentVariable = ./EnvironmentVariable.dhall

let Secret = ./Secret.dhall

let MachineType = ./MachineType.dhall

let OsImage = ./OsImage.dhall

let Machine = { type : MachineType, os_image : OsImage }

let Container = ./Container.dhall

let Agent = ./Agent.dhall

let Block = ./Block.dhall

let Pipeline =
      { version : Text
      , name : Optional Text
      , agent : Agent
      , blocks : List Block.Type
      }

in  Pipeline
