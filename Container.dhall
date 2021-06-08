let EnvironmentVariable = ./EnvironmentVariable.dhall

let Secret = ./Secret.dhall

let DockerRunParameters =
      { user : Optional Text
      , command : Optional Text
      , entrypoint : Optional Text
      }

let InjectedParameters =
      { env_vars : Optional (List EnvironmentVariable)
      , secrets : Optional (List Secret)
      }

let ContainerParameters = DockerRunParameters ⩓ InjectedParameters

let defaultContainerParameters
    : ContainerParameters
    = { user = None Text
      , command = None Text
      , entrypoint = None Text
      , env_vars = None (List EnvironmentVariable)
      , secrets = None (List Secret)
      }

let ContainerParametersSchema =
      { Type = ContainerParameters, default = defaultContainerParameters }

let Container = { name : Text, image : Text } ⩓ ContainerParameters

in  { Type = Container, Parameters = ContainerParametersSchema }
