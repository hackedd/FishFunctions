function activate --description "Activate virtualenv if it exists"
    set -l prefixes env venv .venv
    for prefix in $prefixes
        if test -e "$prefix/bin/activate.fish"
            . "$prefix/bin/activate.fish"
            return 0
        end
    end

    echo "No virtualenv in $prefixes" >&2
    return 1
end
