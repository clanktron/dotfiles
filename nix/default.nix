{ pkgs ? import <nixpkgs> {} }:

pkgs.buildEnv {
    name = "personal";
    paths = with pkgs; [
        neovim
        tree
        tmux
        kubectl
        bat
        zoxide
        ripgrep
        yazi
        k9s
        nerdfonts
        font-awesome
        lazygit
        gnumake
        gcc
        gnupg
        alacritty
        mpv
        bitwarden-cli
        bws

        devspace
        azure-cli
        cosign
        syft
        gh
    ];
}
