function which --description "which, but with more info"
    set -l count (count $argv)
    for arg in $argv
        set -l path (command which $arg)
        if test $status -ne 0
            if test $count -gt 1
                echo -n "$arg: " >&2
            end
            echo "not found" >&2
            return 1
        end

        if test $count -gt 1
            echo -n "$arg: "
        end
        echo "$path"

        while test -L "$path"
            # Get the target of the link
            set -l target (readlink "$path")

            # Resolve the link target relative to the directory of the link
            pushd (dirname "$path") 2>/dev/null
            set path (realpath --no-symlinks "$target")
            popd 2>/dev/null

            echo " -> $path"
        end
    end
    return 0
end
