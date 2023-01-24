function load-dotenv --argument-name filename --description "Load and export variables from a .env file"
    if test -z "$filename"
        echo "Usage: $argv[0] FILE" >&2
        return 1
    end

    while read --delimiter = key value
        test -n $key; and set -gx $key (string trim --chars \' $value)
    end < $filename

    # `while read` evaluates to 1, which would otherwise be reported to the user
    true
end
