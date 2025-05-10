if command -q bw
    set -q GITHUB_TOKEN; or echo "fetching GITHUB_TOKEN from bitwarden..." && set -Ux GITHUB_TOKEN (bw get item github | jq -j '.fields[] | select(.name == "gh-cli-bw") | .value')
    # set -q PGP_PASSWORD; or echo "fetching PGP_PASSWORD from bitwarden..." && set -gx PGP_PASSWORD (bw get item 'gpg key' | jq -j '.fields[] | select(.name == "key") | .value')
    # set -q RESTIC_PASSWORD; or echo "fetching RESTIC_PASSWORD from bitwarden..." && set -gx RESTIC_PASSWORD (bw get item restic | jq -j '.login.password')
end
