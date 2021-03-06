function virtualenv --description "Create virtualenv with colored prompt"
    if test (count $argv) -lt 1
        echo "Usage: virtualenv [OPTIONS] DEST_DIR" >&2
        return 1
    end

    if begin; contains -- "--prompt" $argv; or contains -- "-h" $argv; or contains -- "--help" $argv; or contains -- "--version" $argv; end
        command virtualenv $argv
    else
        set -l prompt (basename (pwd))
        if command virtualenv $argv --prompt (set_color -b blue white)"($prompt)"(set_color normal)" "
            if activate
                pip install --upgrade pip setuptools
                if test -f requirements.txt
                    pip install -r requirements.txt
                end
            end
        end
    end
end
