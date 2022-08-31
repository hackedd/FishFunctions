function start-challenge --argument-name directory --description "Create a new directory with a notes.md containing the contents of the clipboard"
    if test -z "$directory"
        echo "Usage: $argv[0] directory" >&2
        return 1
    end

    mkdir -p $directory
    begin;
        echo "# " (string replace --all '/' ' - ' $directory)
        echo
        pbpaste | string replace --all --regex '^' '> '
        echo
    end | tee $directory/notes.md >/dev/null

    set -l name (string replace --all --regex '\s' '?' (basename "$directory"))
    set -l archives (find $HOME/Downloads/ -iname "*$name*")
    if count "$archives" >/dev/null
        for archive in $archives
            set -l reply (read -P "Found $archive, unpack? [Y/n] ")
            if ! string match -i -q "n*" $reply
                7z x -o$directory $archive
            end
        end
    end

    subl $directory/notes.md

    if command which guake >/dev/null
        guake --new-tab=$PWD/$directory
    end
end
