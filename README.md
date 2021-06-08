# dhall-semaphore

[Dhall](https://dhall-lang.org/) bindings for [Semaphore CI](https://docs.semaphoreci.com/reference/pipeline-yaml-reference/).

## Usage

```sh
dhall-to-yaml <<< ./examples/preface.dhall
```

```yaml
agent:
  machine:
    os_image: ubuntu1804
    type: e1-standard-2
blocks:
  - name: Inspect Linux environment
    task:
      jobs:
        - commands:
            - "echo $SEMAPHORE_PIPELINE_ID"
          name: Print Environment variable
name: The name of the Semaphore 2.0 project
version: v1.0
```
