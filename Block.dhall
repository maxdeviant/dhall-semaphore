let Condition = ./Condition.dhall

let ExecutionTimeLimit = ./ExecutionTimeLimit.dhall

let Task = ./Task.dhall

let Block =
      { name : Optional Text
      , execution_time_limit : Optional ExecutionTimeLimit
      , dependencies : Optional (List Text)
      , task : Task.Type
      , skip : Optional Condition
      , run : Optional Condition
      }

let default
    : Block
    = { name = None Text
      , execution_time_limit = None ExecutionTimeLimit
      , dependencies = None (List Text)
      , task = Task.default
      , skip = None Condition
      , run = None Condition
      }

in  { Type = Block, default }
