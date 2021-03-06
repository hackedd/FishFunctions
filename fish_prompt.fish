function fish_prompt --description 'Write out the prompt'
    # Save the last exit status before doing anything else
    set -l last_status $status

    # Just calculate this once, to save a few cycles when displaying the prompt
    if not set -q __fish_prompt_hostname
        set -g __fish_prompt_hostname (hostname|cut -d . -f 1)
    end

    # Show last execution time, if it took more than five seconds
    if test -n "$CMD_DURATION" -a "$CMD_DURATION" -gt 5000
        echo
        echo -n -s (set_color --bold) "$history[1]" (set_color normal)
        echo -n -s " took: " (set_color red) (format_duration $CMD_DURATION) (set_color normal)
        if test $last_status -ne 0
            echo -n -s " status: " (set_color --bold) "$last_status" (set_color normal)
        end
        echo
    else if test $last_status -ne 0
        echo
        echo -n -s (set_color --bold) "$history[1]" (set_color normal)
        echo -n -s " status: " (set_color --bold) "$last_status" (set_color normal)
        echo
    end

    # Show git branch
    set -l branch
    if set -l git_branch (git rev-parse --abbrev-ref HEAD 2>/dev/null)
        set branch " "(set_color cyan)"$git_branch"
    else
        set branch ""
    end

    set -l color_cwd
    set -l suffix
    switch $USER
    case root toor
        if set -q fish_color_cwd_root
            set color_cwd $fish_color_cwd_root
        else
            set color_cwd $fish_color_cwd
        end
        set suffix '#'
    case '*'
        set color_cwd $fish_color_cwd
        set suffix '>'
    end

    echo -n -s "$USER" @ "$__fish_prompt_hostname" ' ' \
        (set_color $color_cwd) (prompt_pwd) \
        (set_color brblue) (__kube_prompt) \
        "$branch" \
        (set_color normal) "$suffix "
end
