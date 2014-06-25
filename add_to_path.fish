function add_to_path --description "Add directories to path if it exists"
  for dir in $argv
    if test -d $dir
      if not contains $dir $PATH
        set PATH $PATH $dir
      end
    end
  end
end
