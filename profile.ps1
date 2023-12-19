function fzf_f {
    vim $(fzf)
}
Set-Alias -Name v -Value fzf_f
function get_branch {
    $is_git_repo = git rev-parse --is-inside-work-tree
    if ($is_git_repo) {
        $branch_name = "$([char]27)[38;2;226;135;67m" + ' (' + $(git rev-parse --abbrev-ref HEAD) + ')'
        return $branch_name
    }
}
function prompt {
    $current_dir = [System.IO.Path]::GetFileName($PWD)
    $base = "$([char]27)[38;2;176;222;227m$current_dir"
    $branch = get_branch
    $full = $base + $branch + "$([char]27)[39;49m $ "
    return $full
}
