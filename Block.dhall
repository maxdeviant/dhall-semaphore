let Task = ./Task.dhall

let Block = { name : Optional Text, task : Task.Type }

let default
    : Block
    = { name = None Text, task = Task.default }

in  { Type = Block, default }
