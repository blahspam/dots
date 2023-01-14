set -g fish_color_user green
set -g fish_color_host yellow
set -g fish_color_cwd normal

set -g __fish_git_prompt_use_informative_chars true
set -g __fish_git_prompt_showdirtystate true
set -g __fish_git_prompt_showuntrackedfiles true
set -g __fish_git_prompt_showupstream verbose true
set -g __fish_git_prompt_showcolorhints true
set -g __fish_git_prompt_char_untrackedfiles '?'
set -g __fish_git_prompt_color_upstream green
set -g __fish_git_prompt_color_branch brcyan

function fish_prompt -d "Write out the prompt"
printf '%s:%s%s %s$%s ' \
    (prompt_login) \
    (prompt_pwd -d 3 -D 2) \
    (fish_vcs_prompt) \
    (set_color bryellow) \
    (set_color normal)
end
