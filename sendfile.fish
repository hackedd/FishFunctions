function sendfile --description "Send one or more files using Thunderbird"
  set subject $argv
  set attachments ""

  for file in $argv
    if not test -f "$file"
      echo "$file does not exist or is not a file"
      return 1
    end

    set abspath (readlink -f "$file")
    if test -z $attachments
      set attachments "file://$abspath"
    else
      set attachments "$attachments,file://$abspath"
    end
  end

  thunderbird -compose "subject='$subject',attachment='$attachments'"
end
