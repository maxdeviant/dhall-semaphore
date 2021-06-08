let Container = ./Container.dhall

let MachineType = ./MachineType.dhall

let OsImage = ./OsImage.dhall

let Machine = { type : MachineType, os_image : OsImage }

let Agent = { machine : Machine, containers : Optional (List Container.Type) }

in  Agent
