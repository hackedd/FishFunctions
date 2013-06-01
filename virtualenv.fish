function virtualenv --description "Create virtualenv with colored prompt"
	if test (count $argv) -lt 1
		echo "Usage: virtualenv [OPTIONS] DEST_DIR [PROMPT]" >&2
		return 1
	end

	if begin; contains -- "--prompt" $argv; or contains -- "-h" $argv; or contains -- "--help" $argv; end
		command virtualenv $argv
	else
		set -l prompt
		if test (count $argv) -lt 2
			set prompt (basename (pwd))
		else
			set prompt $argv[-1]
			set -e argv[-1]
		end
		virtualenv $argv --prompt (set_color -b blue white)"($prompt)"(set_color normal)" "
	end
end
