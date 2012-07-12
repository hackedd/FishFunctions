function less --description "use vim in less mode"
	if count $argv >/dev/null
		set args $argv
	else
		set args "-"
	end

	vim -u /usr/share/vim/vimcurrent/macros/less.vim $args
end