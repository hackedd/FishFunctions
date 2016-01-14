function docker-activate
    eval (docker-machine env --shell fish $argv)
end
