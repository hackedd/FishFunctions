function open-all-urls --argument-names input
    if test -z "$input"
    	set dirname (mktemp -d)
    	set fifo $dirname/fifo
    	command mkfifo $fifo
    	command tee $fifo >/dev/null &
    	set input $fifo
    end

    rg --only-matching 'https?://[\S]+' $input | while read url
        echo $url >&2
        xdg-open $url
    end

    if test -n "$fifo"
    	command rm $fifo
        command rmdir $dirname
    end
end
