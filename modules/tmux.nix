{ config, pkgs, ... }:

{
  programs.tmux = {
    enable = true;
    keyMode = "vi";
    prefix = "C-a";
    mouse = true;

    plugins = with pkgs;
    [
      tmuxPlugins.better-mouse-mode
      {
        plugin = tmuxPlugins.catppuccin;
        extraConfig = '' 
          # Catppuccin configuration
          set -g @catppuccin_window_left_separator ""
          set -g @catppuccin_window_right_separator " "
          set -g @catppuccin_window_middle_separator " █"
          set -g @catppuccin_window_number_position "right"
          set -g @catppuccin_window_default_fill "number"
          set -g @catppuccin_window_default_text "#W"
          set -g @catppuccin_window_current_fill "number"
          set -g @catppuccin_window_current_text "#W#{?window_zoomed_flag,(),}"
          set -g @catppuccin_status_modules_right "directory meetings date_time"
          set -g @catppuccin_status_modules_left "session"
          set -g @catppuccin_status_left_separator  " "
          set -g @catppuccin_status_right_separator " "
          set -g @catppuccin_status_right_separator_inverse "no"
          set -g @catppuccin_status_fill "icon"
          set -g @catppuccin_status_connect_separator "no"
          set -g @catppuccin_directory_text "#{b:pane_current_path}"
          set -g @catppuccin_date_time_text "%H:%M"
          '';
      }
    ];
    # Key bindings
    extraConfig = ''
      set -g @plugin 'tmux-plugins/tpm'
      
      set -g default-terminal "tmux-256color"
      set-option -sa terminal-overrides ",xterm*:Tc" # Keep colors the same

      #Key bindings
      set-option -g status-position top
      bind-key h select-pane -L
      bind-key j select-pane -D
      bind-key k select-pane -U
      bind-key l select-pane -R
      set -g mouse on
      bind ^C new-window -c "$HOME"
      bind ^D detach
      bind r command-prompt "rename-window %%"
      bind ^r command-prompt "rename-session %%"
      bind ^A last-window
      bind s split-window -v -c "#{pane_current_path}"
      bind v split-window -h -c "#{pane_current_path}"
      bind -r -T prefix , resize-pane -L 20
      bind -r -T prefix . resize-pane -R 20
      bind -r -T prefix - resize-pane -D 7
      bind -r -T prefix = resize-pane -U 7
      bind S choose-session
      set -g base-index 1              # start indexing windows at 1 instead of 0
      set -g renumber-windows on       # renumber all windows when any window is closed
      set -g set-clipboard on          # use system clipboard

      run '~/.tmux/plugins/tpm/tpm'
    '';
  };
}

