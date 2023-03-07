function fish_title
    if set -q SSH_TTY
        echo -n -s '[' (prompt_hostname) '] '
    end
    echo -n -s $_ ' ' (prompt_pwd)
end
