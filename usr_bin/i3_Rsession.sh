i3-msg 'workspace "1: Terminals  "; append_layout ~/.config/i3/workspace-1.json'
gnome-terminal -e "tmux new-session -s R_session 'R'" && gnome-terminal && gedit &
