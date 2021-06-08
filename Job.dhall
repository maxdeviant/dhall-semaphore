let ExecutionTimeLimit = ./ExecutionTimeLimit.dhall

let Job =
      { name : Optional Text
      , execution_time_limit : Optional ExecutionTimeLimit
      , commands : List Text
      }

let default
    : Job
    = { name = None Text
      , execution_time_limit = None ExecutionTimeLimit
      , commands = [] : List Text
      }

in  { Type = Job, default }
