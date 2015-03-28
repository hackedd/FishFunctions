function wdiff
    set -l param
    if contains -- --color $argv
        set -l index (contains --index -- --color $argv)
        set -e argv[$index]

        set param --start-delete=(set_color red) \
                  --end-delete=(set_color normal) \
                  --start-insert=(set_color green) \
                  --end-insert=(set_color normal)
    end

    command wdiff $param $argv
end
