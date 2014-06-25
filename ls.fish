function ls --description "List contents of directory"
    set -l param -h
    if isatty 1
        if [ (uname) = "Darwin" ]
            set param $param -G -F
        else
            set param $param --color=auto --indicator-style=classify
        end
    end
    command ls $param $argv
end
