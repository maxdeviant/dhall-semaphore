let Agent = ./Agent.dhall

let Job = ./Job.dhall

let Secret = ./Secret.dhall

let Task =
      { jobs : List Job.Type
      , agent : Optional Agent
      , secrets : Optional (List Secret)
      }

let default
    : Task
    = { jobs = [] : List Job.Type
      , agent = None Agent
      , secrets = None (List Secret)
      }

in  { Type = Task, default }
