function svnexport --description "Creates a SVN Export"
  if test (count $argv) -lt 2
    echo "Usage: svnexport WC DEST" >&2
    return 1
  end

  set wc     $argv[1]
  set dest   $argv[2]

  for line in (svn info "$wc")
    set value (echo $line | sed 's/^.*: //g')
    switch $line
      case "URL:*"
        set url $value
      case "Revision:*"
        set rev $value
      case "Last Changed Author:*"
        set author $value
      case "Last Changed Date:*"
        set -l LC_TIME C
        set date (date --date=(echo $value | cut -d'(' -f1))
    end
  end

  if not svn export "$wc" "$dest"; return 1; end

  printf "This is an SVN export of\n  %s --revision %s\nLast changed on %s by %s\n" $url $rev $date $author > "$dest/svn-export.txt"
end
