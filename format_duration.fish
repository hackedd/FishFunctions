function format_duration
    set -l total_seconds (math $argv[1] / 1000)
    set -l hours (math -s0 "$total_seconds / 3600")
    set -l minutes (math -s0 "($total_seconds % 3600) / 60")
    set -l seconds (math -s0 "$total_seconds % 60")

    if test $total_seconds -gt 3600
        printf "%dh %dm %ds\n" $hours $minutes $seconds
    else if test $total_seconds -gt 60
        printf "%dm %ds\n" $minutes $seconds
    else
        printf "%ds\n" $seconds
    end
end
