let EnvironmentVariable = ./EnvironmentVariable.dhall

let Secret = ./Secret.dhall

let DockerRunParameters =
      { user : Optional Text
      , command : Optional Text
      , entrypoint : Optional Text
      }

let EnvVars = List EnvironmentVariable

let Secrets = List Secret

let InjectedParameters =
      { env_vars : Optional EnvVars, secrets : Optional Secrets }

let ContainerParameters = DockerRunParameters ⩓ InjectedParameters

let defaultContainerParameters
    : ContainerParameters
    = { user = None Text
      , command = None Text
      , entrypoint = None Text
      , env_vars = None EnvVars
      , secrets = None Secrets
      }

let ContainerParametersSchema =
      { Type = ContainerParameters, default = defaultContainerParameters }

let Container = { name : Text, image : Text } ⩓ ContainerParameters

in  { Type = Container, Parameters = ContainerParametersSchema }
