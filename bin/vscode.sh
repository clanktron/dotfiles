#!/usr/bin/env bash

# Desired vscode extensions
 pkglist=(
    ms-vscode.cpptools
    ms-python.python
    vscodevim.vim
    # kelvin.vscode-sshfs
    letmaik.git-tree-compare
    donjayamanne.githistory
    vscode-icons-team.vscode-icons
    equinusocio.vsc-material-theme-icons
    yzane.markdown-pdf
    # ics.japanese-proofreading
    # platformio.platformio-ide
    github.github-vscode-theme
    # bbrakenhoff.solarized-light-custom
    oderwat.indent-rainbow
    # streetsidesoftware.code-spell-checker
    christian-kohler.path-intellisense
    mhutchie.git-graph
    Gruntfuggly.todo-tree
    hediet.vscode-drawio
    github.vscode-pull-request-github
    marp-team.marp-vscode
    shd101wyy.markdown-preview-enhanced
    shuworks.vscode-table-formatter
    esbenp.prettier-vscode
    davidanson.vscode-markdownlint
    njpwerner.autodocstring
    ms-python.vscode-pylance
    ms-vscode-remote.remote-ssh
)

echo "Installing Visual Studio code extensions and config."

code -v > /dev/null
if [[ $? -eq 0 ]];then

for i in ${pkglist[@]}; do
  code --install-extension $i
done
