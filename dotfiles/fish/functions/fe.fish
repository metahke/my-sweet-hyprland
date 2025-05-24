function fe
    set file (fzf)
    if test -n "$file"
        nvim "$file"
    end
end
