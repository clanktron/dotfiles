function kn
    kubectl config set-context --current --namespace="$argv" && kubectl config view --minify | grep namespace:
end
