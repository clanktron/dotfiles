function pgp
    switch (uname)
      case Darwin
        set copy pbcopy
      case Linux
        set copy wl-copy
      case '*'
          echo "AAAAAAAAAAAAAHHHHHHHHHHHHHHH"
    end
    echo -n "$PGP_PASSWORD" | "$copy"
    echo "pgp key password copied to clipboard..."
end
