function pip
    # When you run "pip install" in your regular shell outside a
    # virtualenv, it should just work, meaning, install stuff into your
    # home directory.  But, let’s not affect the operation of pip within
    # virtualenvs or as executed by any tools (such as tox or virtualenv
    # itself) which need to run it via automation and not via a shell.

    if not test -n "$PYTHON_USER_BIN"
        set -xg PYTHON_USER_BIN (python -m site --user-base)/bin
        set -xg PYTHON_USER_LIB (python -m site --user-site)
        add_to_path $PYTHON_USER_BIN
    end

    if test -n "$VIRTUAL_ENV"
        command pip $argv
    else
        env PIP_USER=yes pip $argv
    end
end
