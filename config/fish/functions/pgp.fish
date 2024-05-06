function pgp
    echo -n "$PGP_PASSWORD" | pbcopy
    echo "pgp key password copied to clipboard..."
end
