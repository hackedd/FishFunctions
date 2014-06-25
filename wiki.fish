function wiki --description "Opens an sshuttle to kantoor.eljakim.com to enable access to wiki.pareci.com"
  if not test -d "$HOME/Projects/sshuttle"
    echo "$HOME/Projects/sshuttle not found" >&2
    return 1
  end

  if not pgrep -f "192.168.9.0/24" >/dev/null
    screen -S sshuttle /bin/sh -c "echo \"Detach this screen after sshuttle connection is established\"; echo; \"$HOME/Projects/sshuttle/sshuttle\" -r kantoor 192.168.9.0/24 || read -p \"Press enter to terminate screen\" x"
  end

  if pgrep -f "192.168.9.0/24" >/dev/null
    xdg-open "http://wiki.pareci.com/"
  end
end
