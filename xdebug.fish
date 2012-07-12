function xdebug --description "Run a PHP Script with xdebug.remote_autostart on"
	set file $argv[1]
	set -e argv[1]
	php -d xdebug.remote_autostart=On -d xdebug.remote_mode=req -d xdebug.remote_enable=1 -f "$file" -- $argv
end
