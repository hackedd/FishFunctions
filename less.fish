function less --description "use vim in less mode"
  if not functions -q __less
    for ver in current 74 73
      set -l lesssh "/usr/share/vim/vim$ver/macros/less.sh"
      if test -f $lesssh
        echo "function __less; $lesssh \$argv; end" | .
        break
      end
    end
  end

  if not functions -q __less
    function __less
      command less $argv
    end
  end

  __less $argv
end
