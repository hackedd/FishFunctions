function fish_title
    if set -q SSH_CLIENT
        echo -n -s '[' "$__fish_prompt_hostname" '] '
    end
    echo -n -s $_ ' ' (prompt_pwd)
end
