{ pkgs ? import <nixpkgs> {} }:

pkgs.buildEnv {
    name = "personal";
    paths = with pkgs; [
        neovim
        tree
        tmux
        bat
        zoxide
        ripgrep
        yazi
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

        skopeo
        oras
        crane
        k9s
        jq
        yq
        kubectl
        kubectx
        krew
        devspace
        azure-cli
        cosign
        syft
        gh
    ];
}
