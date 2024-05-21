set -q GITHUB_TOKEN; or echo "fetching GITHUB_TOKEN from bitwarden..." && set -gx GITHUB_TOKEN (bw get item github | jq -j '.fields[] | select(.name == "mbp-token") | .value')
set -q PGP_PASSWORD; or echo "fetching PGP_PASSWORD from bitwarden..." && set -gx PGP_PASSWORD (bw get item 'gpg key' | jq -j '.fields[] | select(.name == "key") | .value')
set -q RESTIC_PASSWORD; or echo "fetching RESTIC_PASSWORD from bitwarden..." && set -gx RESTIC_PASSWORD (bw get item restic | jq -j '.login.password')
