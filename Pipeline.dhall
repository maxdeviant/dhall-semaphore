let EnvironmentVariable = ./EnvironmentVariable.dhall

let Secret = ./Secret.dhall

let MachineType = ./MachineType.dhall

let OsImage = ./OsImage.dhall

let Machine = { type : MachineType, os_image : OsImage }

let Container = ./Container.dhall

let Agent = { machine : Machine, containers : Optional (List Container.Type) }

let Job = { name : Optional Text, commands : List Text }

let Task = { jobs : List Job }

let Block = { name : Optional Text, task : Task }

let Pipeline =
      { version : Text
      , name : Optional Text
      , agent : Agent
      , blocks : List Block
      }

in  Pipeline
