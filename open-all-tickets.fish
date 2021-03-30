function open-all-tickets --argument-names input
    if test -z "$input"
    	set dirname (mktemp -d)
    	set fifo $dirname/fifo
    	command mkfifo $fifo
    	command tee $fifo >/dev/null &
    	set input $fifo
    end

    rg --only-matching --ignore-case 'REC[ -]\d+' $input | while read ticket
        echo "https://digib-brenntag.atlassian.net/browse/"(echo $ticket | tr ' ' '-')
    end

    if test -n "$fifo"
    	command rm $fifo
        command rmdir $dirname
    end
end
