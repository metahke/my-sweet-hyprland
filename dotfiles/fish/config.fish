if status is-interactive
    # Commands to run in interactive sessions can go here

    # Add Cargo binaries to PATH
    set PATH $PATH $HOME/.cargo/bin

    # Change default Fish greeing prompt
    set -U fish_greeting ""

    # Set default fzf options
    set -gx FZF_DEFAULT_COMMAND "fd . $HOME"
    set -gx FZF_DEFAULT_OPTS "--exact"

    # Set aliases
    alias zola="flatpak run org.getzola.zola"
end
