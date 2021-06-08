let Agent = ./Agent.dhall

let EnvironmentVariable = ./EnvironmentVariable.dhall

let Job = ./Job.dhall

let Secret = ./Secret.dhall

let Prologue = { commands : List Text }

let Epilogue = { commands : List Text }

let Task =
      { jobs : List Job.Type
      , agent : Optional Agent
      , secrets : Optional (List Secret)
      , prologue : Optional Prologue
      , epilogue : Optional Epilogue
      , env_vars : Optional (List EnvironmentVariable)
      }

let default
    : Task
    = { jobs = [] : List Job.Type
      , agent = None Agent
      , secrets = None (List Secret)
      , prologue = None Prologue
      , epilogue = None Epilogue
      , env_vars = None (List EnvironmentVariable)
      }

in  { Type = Task, default }
