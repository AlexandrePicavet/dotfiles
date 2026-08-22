# Dark / Light theme switcher
source-file -q ~/.local/share/tmux/theme.conf

# Configure Catppuccin theme options
set -g @catppuccin_status_background "none"
set -g @catppuccin_window_number_position "right"

set -g @catppuccin_window_status_style "custom"
set -g @catppuccin_window_left_separator "#[bg=default,fg=#{@thm_surface_0}]"
set -g @catppuccin_window_text "#W"
set -g @catppuccin_window_text_color "#{@thm_surface_0}"
set -g @catppuccin_window_middle_separator ""
set -g @catppuccin_window_number_color "#{@thm_blue}"
set -g @catppuccin_window_right_separator "#[bg=default,fg=#{@thm_blue}]"

set -g @catppuccin_window_current_left_separator "#[bg=default,fg=#{@thm_surface_1}]"
set -g @catppuccin_window_current_text "#W"
set -g @catppuccin_window_current_text_color "#{@thm_surface_1}"
set -g @catppuccin_window_current_middle_separator ""
set -g @catppuccin_window_current_number_color "#{@thm_peach}"
set -g @catppuccin_window_current_right_separator "#[bg=default,fg=#{@thm_peach}]"

set -g @catppuccin_window_flags "icon" # none, icon, or text
set -g @catppuccin_window_flags_icon_last ""
set -g @catppuccin_window_flags_icon_current ""
set -g @catppuccin_window_flags_icon_zoom ""
set -g @catppuccin_window_flags_icon_mark " " # M
set -g @catppuccin_window_flags_icon_silent ""
set -g @catppuccin_window_flags_icon_activity " "
set -g @catppuccin_window_flags_icon_bell " "

set -g @catppuccin_pane_left_separator ""
set -g @catppuccin_pane_middle_separator "█"
set -g @catppuccin_pane_right_separator ""

set -g @catppuccin_status_left_separator ""
set -g @catppuccin_status_middle_separator ""
set -g @catppuccin_status_right_separator " "
set -g @catppuccin_status_connect_separator "no"

set -g @catppuccin_session_icon " "
set -g @catppuccin_directory_icon " "
set -g @catppuccin_directory_text " #{=|-30|…:pane_current_path}"
set -g @catppuccin_directory_color "#{E:@thm_pink}"
set -g @catppuccin_date_time_text " %Y-%m-%d %H:%M:%S"

run '#{TMUX_PLUGIN_MANAGER_PATH}/tmux/catppuccin.tmux'

# Configure status line layout

set -g @large-threshold 120

set -g status-right-length 100
set -g status-left-length 100
set -g status-left " #{E:@catppuccin_status_session}"
set -ag status-left "#{?#{e|>=:#{client_width},#{@large-threshold}},#{E:@catppuccin_status_directory},}"

set -g status-right "#{?#{e|>=:#{client_width},#{@large-threshold}},#{E:@catppuccin_status_date_time},}"
set -agF status-right "#{E:@catppuccin_status_cpu}"
set -agF status-right "#{E:@catppuccin_status_ram}"
set -agF status-right "#{E:@catppuccin_status_battery}"

# Install catppuccin theme & related plugins
set -g @plugin 'catppuccin/tmux#v2.3.0'
set -g @plugin 'tmux-plugins/tmux-cpu'
set -g @plugin 'tmux-plugins/tmux-battery'
