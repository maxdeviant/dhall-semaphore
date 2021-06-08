let semaphore = ../package.dhall

let pipeline
    : semaphore.Pipeline
    = { version = "v1.0"
      , name = Some "The name of the Semaphore 2.0 project"
      , agent.machine
        =
        { type = semaphore.MachineType.e1-standard-2
        , os_image = semaphore.OsImage.ubuntu1804
        }
      , agent.containers = None (List semaphore.Container.Type)
      , execution_time_limit = None semaphore.ExecutionTimeLimit
      , blocks =
        [ semaphore.Block::{
          , name = Some "Inspect Linux environment"
          , run = Some { when = "branch = 'master'" }
          , task = semaphore.Task::{
            , jobs =
              [ semaphore.Job::{
                , name = Some "Print Environment variables"
                , commands = [ "echo \$SEMAPHORE_PIPELINE_ID", "echo \$HOME" ]
                }
              ]
            }
          }
        ]
      }

in  pipeline
