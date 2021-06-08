let Condition = ./Condition.dhall

let Task = ./Task.dhall

let Block =
      { name : Optional Text
      , dependencies : Optional (List Text)
      , task : Task.Type
      , skip : Optional Condition
      , run : Optional Condition
      }

let default
    : Block
    = { name = None Text
      , dependencies = None (List Text)
      , task = Task.default
      , skip = None Condition
      , run = None Condition
      }

in  { Type = Block, default }
