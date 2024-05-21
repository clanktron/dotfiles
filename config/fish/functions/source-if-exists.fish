function source-if-exists $argv
    if [ -f "$argv" ]
        source "$argv"
    end
end
