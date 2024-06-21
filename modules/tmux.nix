{ config, pkgs, ... }:

let
  t-smart-manager = pkgs.tmuxPlugins.mkTmuxPlugin
    {
      pluginName = "t-smart-tmux-session-manager";
      version = "unstable-2023-01-06";
      rtpFilePath = "t-smart-tmux-session-manager.tmux";
      src = pkgs.fetchFromGitHub {
        owner = "joshmedeski";
        repo = "t-smart-tmux-session-manager";
        rev = "a1e91b427047d0224d2c9c8148fb84b47f651866";
        sha256 = "sha256-HN0hJeB31MvkD12dbnF2SjefkAVgtUmhah598zAlhQs=";
      };
    };
  tmux-browser = pkgs.tmuxPlugins.mkTmuxPlugin
    {
      pluginName = "tmux-browser";
      version = "unstable-2023-01-06";
      src = pkgs.fetchFromGitHub {
        owner = "ofirgall";
        repo = "tmux-browser";
        rev = "c3e115f9ebc5ec6646d563abccc6cf89a0feadb8";
        sha256 = "sha256-ngYZDzXjm4Ne0yO6pI+C2uGO/zFDptdcpkL847P+HCI=";
      };
    };

  tmux-super-fingers = pkgs.tmuxPlugins.mkTmuxPlugin
    {
      pluginName = "tmux-super-fingers";
      version = "unstable-2023-01-06";
      src = pkgs.fetchFromGitHub {
        owner = "artemave";
        repo = "tmux_super_fingers";
        rev = "2c12044984124e74e21a5a87d00f844083e4bdf7";
        sha256 = "sha256-cPZCV8xk9QpU49/7H8iGhQYK6JwWjviL29eWabuqruc=";
      };
    };
in
{
  programs.tmux = {
    enable = true;
    shell = "/run/current-system/sw/bin/zsh";
    terminal = "tmux-256color";
    plugins = with pkgs;
      [
        tmuxPlugins.sensible
        # must be before continuum edits right status bar
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
        tmuxPlugins.better-mouse-mode
        tmuxPlugins.yank
        #tmuxPlugins.tpm
      ];

    extraConfig = ''
      # List of plugins
      #set -g @plugin 'catppuccin/tmux'
      set -g @plugin 'tmux-plugins/tpm'
      #set -g @plugin 'tmux-plugins/tmux-sensible'
      #set -g @plugin 'tmux-plugins/tmux-yank'

      set -g default-terminal "tmux-256color"
      set-option -sa terminal-overrides ",xterm*:Tc" # Keep colors the same
      set -g mouse on
      bind k kill-session
      bind ^X lock-server
      bind ^C new-window -c "$HOME"
      bind ^D detach

      bind H previous-window
      bind L next-window

      bind r command-prompt "rename-window %%"
      bind ^r command-prompt "rename-session %%"
      bind R source-file ~/.tmux.conf
      bind ^A last-window
      bind w list-windows
      bind z resize-pane -Z
      bind | split-window
      bind s split-window -v -c "#{pane_current_path}"
      bind v split-window -h -c "#{pane_current_path}"
      bind '"' choose-window
      bind h select-pane -L
      bind j select-pane -D
      bind k select-pane -U
    bind l select-pane -R
      bind -r -T prefix , resize-pane -L 20
      bind -r -T prefix . resize-pane -R 20
      bind -r -T prefix - resize-pane -D 7
      bind -r -T prefix = resize-pane -U 7
      bind : command-prompt
      bind * setw synchronize-panes
      bind P set pane-border-status
      #bind c kill-pane
      bind x swap-pane -D
      bind S choose-session
      bind-key -T copy-mode-vi v send-keys -X begin-selection # vim-like selection

      set-option -g status-position top
      set -g prefix ^A
      set -g base-index 1              # start indexing windows at 1 instead of 0
      set -g detach-on-destroy off     # don't exit from tmux when closing a session
      set -g escape-time 0             # zero-out escape time delay
      set -g renumber-windows on       # renumber all windows when any window is closed
      set -g set-clipboard on          # use system clipboard
      setw -g mode-keys vi
      # Initialize TMUX plugin manager (keep this line at the very bottom of tmux.conf)
      run '~/.tmux/plugins/tpm/tpm'
    '';
  };
}

