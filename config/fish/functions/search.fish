if type -q firefox
    function search
        open -a firefox https://google.com/search"?q=$argv"
    end
end
