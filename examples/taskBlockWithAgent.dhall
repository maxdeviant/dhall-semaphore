let semaphore = ../package.dhall

let pipeline
    : semaphore.Pipeline
    = { version = "v1.0"
      , name = Some "YAML file example with task and agent."
      , agent.machine
        =
        { type = semaphore.MachineType.e1-standard-2
        , os_image = semaphore.OsImage.ubuntu1804
        }
      , agent.containers = None (List semaphore.Container.Type)
      , execution_time_limit = None semaphore.ExecutionTimeLimit
      , blocks =
        [ semaphore.Block::{
          , name = Some "Run in Linux environment"
          , task = semaphore.Task::{
            , jobs =
              [ semaphore.Job::{
                , name = Some "Learn about SEMAPHORE_GIT_DIR"
                , commands = [ "echo \$SEMAPHORE_GIT_DIR" ]
                }
              ]
            }
          }
        , semaphore.Block::{
          , name = Some "Run in macOS environment"
          , task = semaphore.Task::{
            , agent = Some
              { machine =
                { type = semaphore.MachineType.a1-standard-4
                , os_image = semaphore.OsImage.macos-xcode12
                }
              , containers = None (List semaphore.Container.Type)
              }
            , jobs =
              [ semaphore.Job::{
                , name = Some "Using agent job"
                , commands = [ "echo \$PATH" ]
                }
              ]
            }
          }
        ]
      }

in  pipeline
