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
        kubernetes-helm
        fluxcd

        zed-editor
        insomnia

        gnumake
        gcc
        nodejs_22
        yarn
        rustup

        gnupg
        mpv
        ffmpeg
        bitwarden-cli
        bws

        nerdfonts
        font-awesome
    ];
}
