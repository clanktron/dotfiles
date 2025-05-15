return {
    filetypes = { 'helm' },
    settings = {
        ['helm-ls'] = {
            yamlls = {
                enabled = false,
            }
        }
    },
    root_markers = { 'Chart.yaml', 'values.yaml' }
}
