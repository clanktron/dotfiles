{ pkgs ? import <nixpkgs> {} }:

pkgs.buildEnv {
    name = "personal";
    paths = with pkgs; [
        neovim
        tree
        tmux
        bat
        htop
        zoxide
        ripgrep
        yazi
        mpv
        bitwarden-cli
        bws
        lazygit

        gh
        devspace
        azure-cli
        cosign
        syft
        skopeo
        oras
        crane
        k9s
        jq
        yq
        kubectl
        kubectx
        krew

        zed-editor
        insomnia

        gnumake
        gcc
        nodejs_22

        gnupg
        mpv
        bitwarden-cli
        bws

        nerdfonts
        font-awesome
    ];
}
