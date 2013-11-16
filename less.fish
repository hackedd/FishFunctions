function less --description "use vim in less mode"
    if test -f /usr/share/vim/vim74/macros/less.sh
        /usr/share/vim/vim74/macros/less.sh $argv
        return
    end

  if count $argv >/dev/null
    set args $argv
  else
    set args "-"
  end

  vim -u /usr/share/vim/vimcurrent/macros/less.vim $args
end
