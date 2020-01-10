function format_duration
    set -l seconds (math $argv[1] / 1000)
    set -l format
    if test $seconds -gt 3600
        set format "+%-Hh %-Mm %-Ss"
    else if test $seconds -gt 60
        set format "+%-Mm %-Ss"
    else
        set format "+%-Ss"
    end

    set -l date date
    if [ (uname) = "Darwin" ]
        set date gdate
    end

    eval "$date -u -d \"@$seconds\" \"$format\""
end
