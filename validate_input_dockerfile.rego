package main

import future.keywords



# Use multi-stage builds
multi_stage[msg]{
   input[_].Cmd == "from"
   input[_].Stage == 0

   msg:=sprintf("Multi-stage Dockerfiles allowed")
}

disallow_latest_tag[msg]{
    input[_].Cmd == "from"
    tag:= split (input[_].Value[0],":")
    contains(lower(tag[0]),"latest")

    msg:=sprintf("Use of latest tag is Disallowed")
}

