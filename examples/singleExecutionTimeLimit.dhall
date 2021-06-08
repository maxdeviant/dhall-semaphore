let semaphore = ../package.dhall

let pipeline
    : semaphore.Pipeline
    = { version = "v1.0"
      , name = Some "Using execution_time_limit"
      , agent.machine
        =
        { type = semaphore.MachineType.e1-standard-2
        , os_image = semaphore.OsImage.ubuntu1804
        }
      , agent.containers = None (List semaphore.Container.Type)
      , execution_time_limit = Some
          (semaphore.ExecutionTimeLimit.Hours { hours = 3 })
      , blocks =
        [ semaphore.Block::{
          , name = Some "Creating Docker Image"
          , task = semaphore.Task::{
            , jobs =
              [ semaphore.Job::{
                , name = Some "Docker build"
                , commands = [ "checkout", "sleep 120" ]
                }
              ]
            }
          }
        , semaphore.Block::{
          , name = Some "Building executable"
          , task = semaphore.Task::{
            , jobs =
              [ semaphore.Job::{
                , name = Some "Building job"
                , commands = [ "echo 360", "echo \"Building executable\"" ]
                }
              ]
            }
          }
        ]
      }

in  pipeline
