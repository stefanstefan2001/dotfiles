source /usr/local/share/antigen/antigen.zsh


#antigen bundle zsh-users/zsh-autosuggestions
#antigen use oh-my-zsh # Add Oh-My-ZSH as an API for plugins and theme

antigen bundles <<EOBUNDLES
tmux
command-not-found
colored-man-pages
git
zsh-users/zsh-autosuggestions
zsh-users/zsh-completions
zsh-users/zsh-syntax-highlighting
zsh-users/zsh-history-substring-search
HeroCC/LS_COLORS
rupa/z
EOBUNDLES
antigen apply
