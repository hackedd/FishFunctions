function vagrant
    set -l cache $TMPDIR/vagrant-up-cache

    # Run 'vagrant up' by default, unless arguments are given
    set -l args up
    if test (count $argv) -ge 1
        set args $argv
    end

    # If the working directory contains a Vagrantfile, don't ask the user
    # to select one.
    if begin; test -f Vagrantfile; or contains init $args; end
        command vagrant $args
        return
    end

    # Create a list of all directories containing a Vagrantfile
    if not test -f $cache
        find $HOME \( -name ".vagrant.d" -prune \) -o \( -name Vagrantfile -exec dirname '{}' \; \) | \
            sed "s|$HOME/||g" > $cache
    end

    # Ask for a directory and run vagrant there
    if selecta < $cache | read dir
        echo "Running "(set_color --bold)"vagrant $args"(set_color normal)" in $HOME/$dir" >&2
        pushd "$HOME/$dir" >-
        vagrant $args
        popd >-
    end
end
