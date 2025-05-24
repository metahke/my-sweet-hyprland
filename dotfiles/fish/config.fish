if status is-interactive
    # Commands to run in interactive sessions can go here

    # fzf configuration
    set -gx FZF_DEFAULT_COMMAND "fd . $HOME"
    set -gx FZF_DEFAULT_OPTS "--exact"
end
