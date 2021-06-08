let Agent = ./Agent.dhall

let Block = ./Block.dhall

let ExecutionTimeLimit = ./ExecutionTimeLimit.dhall

let Pipeline =
      { version : Text
      , name : Optional Text
      , agent : Agent
      , execution_time_limit : Optional ExecutionTimeLimit
      , blocks : List Block.Type
      }

in  Pipeline
