#smooth scrolling
#bind -n WheelUpPane if-shell -F -t = "#{mouse_any_flag}" "send-keys -M" "if -Ft= '#{pane_in_mode}' 'send-keys -M' 'select-pane -t=; copy-mode -e; send-keys -M'"  
#bind -n WheelDownPane select-pane -t= \; send-keys -M 
#set-option -g mouse on

#FIXME: Reattach to user namespace is only available on OS X

    set -g default-command "reattach-to-user-namespace -l zsh"

# tmux display things in 256 colors
set -g default-terminal "screen-256color"
#set -g status-utf8 on

#set -g history-limit 20000

# automatically renumber tmux windows
set -g renumber-windows on

# unbind default prefix and set it to Ctrl+a
unbind C-b
set -g prefix C-a
bind C-a send-prefix

# for nested tmux sessions
bind-key a send-prefix

# Activity Monitoring
setw -g monitor-activity off
set -g visual-activity off

# Rather than constraining window size to the maximum size of any client
# connected to the *session*, constrain window size to the maximum size of any
# client connected to *that window*. Much more reasonable.
setw -g aggressive-resize on

# make delay shorter
set -sg escape-time 0

# tile all windows
unbind =
bind = select-layout tiled

# cycle through panes
# unbind C-a
# unbind o # this is the default key for cycling panes
# bind ^A select-pane -t:.+

# make window/pane index start with 1
set -g base-index 1
setw -g pane-base-index 1

set-option -g set-titles on
set-option -g set-titles-string "#T - #W"
# set-window-option -g automatic-rename on

set-option -g allow-rename off

######################
#### Key Bindings ####
######################

# reload config file
bind r source-file ~/.tmux.conf \; 
#display "Config Reloaded!"

# quickly open a new window
bind N new-window

# synchronize all panes in a window
bind y setw synchronize-panes

#set vi mode for copy mode
setw -g mode-keys vi

# more settings to make copy-mode more vim-like
unbind [
bind Escape copy-mode
unbind p
bind p paste-buffer
# bind -t vi-copy 'v' begin-selection
# bind -t vi-copy 'y' copy-selection

# Buffers to/from Mac clipboard, yay tmux book from pragprog
bind C-c run "tmux save-buffer - | reattach-to-user-namespace pbcopy"
bind C-v run "tmux set-buffer $(reattach-to-user-namespace pbpaste); tmux paste-buffer"

##############################
### Color & Style Settings (Powerline) ###
##############################
#source ~/.dotfiles/tmux/theme.sh

set-option -g status on
set-option -g status-interval 50
#set-option -g status-utf8 on
#set-option -g status-justify "right"
set-option -g status-left-length 100
set-option -g status-right-length 90

set-option -g status-left "#(~/.dotfiles/tmux/tmux-powerline/powerline.sh left)"
set-option -g status-right "#(~/.dotfiles/tmux/tmux-powerline/powerline.sh right)"
#set-window-option -g window-status-current-format "#[fg=colour235, bg=colour27]⮀#[fg=colour255, bg=colour27] #I ⮁ #W #[fg=colour27, bg=colour235]⮀"

bind C-[ run '~/.dotfiles/tmux/tmux-powerline/mute_powerline.sh left'      # Mute left statusbar.
bind C-] run '~/.dotfiles/tmux/tmux-powerline/mute_powerline.sh right'     # Mute right statusbar.

#source /usr/local/lib/python2.7/site-packages/powerline/bindings/tmux/powerline.conf
source ~/.dotfiles/tmux/aux.sh
################## Tmux Plugin Manager
set -g @plugin 'tmux-plugins/tpm'
set -g @plugin 'tmux-plugins/tmux-sensible'
set -g @plugin 'tmux-plugins/tmux-battery'
set -g @plugin 'tmux-plugins/tmux-resurrect'
set -g @plugin 'tmux-plugins/tmux-continuum'
set -g @plugin 'tmux-plugins/tmux-yank'
set -g @plugin 'tmux-plugins/tmux-sidebar'
set -g @plugin 'tmux-plugins/tmux-open'
set -g @plugin 'jbnicolai/tmux-fpp'


##### Configure 
#set -g @continuum-restore 'on'
set -g @resurrect-capture-pane-contents 'on'
set -g @resurrect-strategy-vim 'session'


run '~/.tmux/plugins/tpm/tpm'

