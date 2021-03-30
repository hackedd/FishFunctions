function replace-all
    set -l pattern $argv[1]
    set -l replacement $argv[2]
    sed -i -e "s|$pattern|$replacement|g" (rg --files-with-matches $pattern)
end
