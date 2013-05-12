function activate --description "Activate virtualenv if it exists"
	if test -e "env/bin/activate.fish"
		. "env/bin/activate.fish"
	else
		echo "No virtualenv in ./env" >&2
		return 1
	end
end
