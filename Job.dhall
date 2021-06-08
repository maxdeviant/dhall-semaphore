let Job = { name : Optional Text, commands : List Text }

let default
    : Job
    = { name = None Text, commands = [] : List Text }

in  { Type = Job, default }
