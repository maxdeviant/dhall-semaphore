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
      , blocks =
        [ { name = None Text
          , task.jobs
            =
            [ { name = Some "Check environment variables"
              , commands = [ "echo \$SEMAPHORE_PIPELINE_ID", "pwd" ]
              }
            ]
          }
        ]
      }

in  pipeline
