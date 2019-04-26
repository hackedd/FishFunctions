function virtualenv3 --description "Create Python 3 virtualenv with colored prompt"
    if test (count $argv) -lt 1
        echo "Usage: virtualenv [OPTIONS] DEST_DIR [PROMPT]" >&2
        return 1
    end

    virtualenv --python (command which python3) $argv
    return $status
end
