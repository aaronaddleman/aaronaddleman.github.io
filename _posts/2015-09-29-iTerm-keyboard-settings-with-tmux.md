---
layout: post
title: "iTerm keyboard shortcuts with tmux"
description: "My settings for using iTerm with shortcuts and sending hexcodes to make movements faster"
tags: [tmux, iterm]
image:
  feature: 8160206665_e2eb9a1382_o.jpg
  credit: Aaron Addleman
comments: true
share: true
---

## Key combinations and the Hex Codes to send

| Key Combination| Action|
| ------------- | -----|
| Option + Up Arrow | 0x1b 0x1b 0x5b 0x41 |
| Option + Shift + Up Arrow | 0x02 0x28 |
| Ctrl + Option + Up Arrow | 0x02 0x4b |
| Ctrl + Cmd + Up Arrow | 0x02 0x1b 0x5b 0x41 |
| Option + Down Arrow | 0x1b 0x1b 0x5b 0x42 |
| Option + Shift + Down Arrow | 0x02 0x29 |
| Ctrl + Option + Down Arrow | 0x02 0x4a |
| Ctrl + Cmd + Down Arrow | 0x02 0x4a |
| Ctrl + Cmd + Down Arrow | 0x02 0x1b 0x5b 0x42 |
| Option + Left Arrow | 0x1b 0x1b 0x5b 0x44 |
| Option + Shift + Left Arrow | 0x02 0x70 |
| Ctrl + Option + Left Arrow | 0x02 0x48 |
| Ctrl + Cmd + Left Arrow | 0x02 0x1b 0x5b 0x44 |
| Option + Right Arrow | 0x1b 0x1b 0x5b 0x43 |
| Option + Shift + Right Arrow | 0x02 0x6e |
| Ctrl + Option + Right Arrow | 0x02 0x4c |
| Ctrl + Cmd + Right Arrow | 0x02 0x1b 0x5b 0x43 |

## Tmux Configuration

    # # improve colors
    #set -g default-terminal "screen-256color"
    #
    # # active window title colors
    # set-window-option -g window-status-current-fg '#000000'
    # set-window-option -g window-status-current-bg '#ffffff'
    #
    # # set window number to start from number
    set -g base-index 1
    #
    # # Toggle sending keystrokes to all panes in a window
    bind-key a set-window-option synchronize-panes
    #

    # Status Bar
    #set -g status-bg black
    #set -g status-bg white
    #set -g status-fg black
    #set -g status-interval 1
    #set -g status-left '#[fg=cyan,bold,bg=black]#H#[white]'
    #set -g status-right '#[fg=white]#(cut -d " " -f 1-4 /proc/loadavg)#[default] #[bold]%m-%d %H:%M#[default]'

    # status line
    set -g status-utf8 on
    set -g status-justify left
    set -g status-bg default
    set -g status-fg colour12
    set -g status-interval 2

    # messaging
    set -g message-fg black
    set -g message-bg yellow
    set -g message-command-fg blue
    set -g message-command-bg black


    #window mode
    setw -g mode-bg colour6
    setw -g mode-fg colour0

    # window renaming; turn off
    set -g allow-rename off

    # window status
    setw -g window-status-format "#F#I:#W#F"
    setw -g window-status-current-format "#F#I:#W#F"
    setw -g window-status-format "#[fg=white]#[bg=black] #I #[bg=cyan]#[fg=colour8]#W"
    setw -g window-status-current-format "#[bg=white]#[fg=colour8] #I #[fg=colour8]#[bg=colour14]  #W  "
    setw -g window-status-current-bg colour0
    setw -g window-status-current-fg colour11
    setw -g window-status-current-attr dim
    setw -g window-status-bg green
    setw -g window-status-fg black
    setw -g window-status-attr reverse
    setw -g window-status-content-bg colour0
    setw -g window-status-content-fg colour11
    setw -g window-status-content-attr bold,blink,reverse


    # Info on right (requires stlarch-terminusmod font)
    #set -g status-right-length 60
    #set -g status-right '#[fg=brightblue]ßÜ #[fg=brightyellow]#(tmux_upspeed)/#(tmux_downspeed) #[fg=colour7]| #[fg=brightblue]ª #[fg=brightyellow]#(sensors | grep temp1 | cut -d+ -f2 | cut -d. -f1) #[fg=colour7]| #[fg=brightblue]ï #[fg=brightyellow]#(acpi -b | cut -d" " -f4 | cut -d"%" -f1) #[fg=colour7]| #[fg=brightred]#(cut -d " " -f 1-3 /proc/loadavg) #[fg=colour7]| #[fg=brightgreen]%a %H:%M'
    #


    # Notifying if other windows has activities
    #setw -g monitor-activity on
    #set -g visual-activity on

    # Highlighting the active window in status bar
    #setw -g window-status-current-bg '#ffffff'
    #setw -g window-status-current-fg red
    #set-window-option -g window-status-current-attr bright

    # source config file
    bind r source-file ${HOME}/.tmux.conf \; display-message "source-file reloaded"

    # Clock
    setw -g clock-mode-colour cyan
    setw -g clock-mode-style 24

    # Terminal emulator window title
    #set -g set-titles on
    set -g set-titles-string '#S:#I.#P #W'

    # History
    set -g history-limit 1000

    # Make mouse useful in copy mode
    setw -g mode-mouse on

    # More straight forward key bindings for splitting
    #unbind % bind | split-window -h
    #bind h split-window -h
    #
    #unbind '"'
    #bind - split-window -v
    #bind v split-window -v

    # Pane resize in all four directions using vi bindings.
    # # Can use these raw but I map them to Cmd-Opt-<h,j,k,l> in iTerm2.
    # # http://tangledhelix.com/blog/2012/04/28/iterm2-keymaps-for-tmux/
    # # Note on a few prefix options: C-a = 0x01, C-b = 0x02, C-g = 0x06
    bind-key J resize-pane -D
    bind-key K resize-pane -U
    bind-key H resize-pane -L
    bind-key L resize-pane -R

    #### COLOUR (Solarized dark)
    #
    ## default statusbar colors
    set-option -g status-bg black #base02
    set-option -g status-fg yellow #yellow
    set-option -g status-attr default
    #
    ## default window title colors
    set-window-option -g window-status-fg brightblue #base0
    set-window-option -g window-status-bg default
    ##set-window-option -g window-status-attr dim
    #
    ## active window title colors
    set-window-option -g window-status-current-fg brightred #orange
    set-window-option -g window-status-current-bg default
    ##set-window-option -g window-status-current-attr bright
    #
    ## pane border
    set-option -g pane-border-fg black #base02
    set-option -g pane-active-border-fg brightgreen #base01
    #
    ## message text
    set-option -g message-bg black #base02
    set-option -g message-fg brightred #orange
    #
    ## pane number display
    set-option -g display-panes-active-colour blue #blue
    set-option -g display-panes-colour brightred #orange
    #
    ## clock
    set-window-option -g clock-mode-colour green #green
    set -g status-right "#[fg=yellow]%Y-%m-%d #[fg=green]#(TZ=America/Los_Angeles date +%%H:%%M)"
    #
    #
    # email buffer
    #bind-key p save-buffer ~/.tmux-buffer ; run 'mail -s "tmux buffer" aaron_addleman@gap.com < ~/.tmux_buffer && rm ~/.tmux-buffer'
    #
    set -g history-limit 40000

    # pane movement
    #bind-key J command-prompt -p "join pane from:"  "join-pane -s '%%'"
    #bind-key S command-prompt -p "send pane to:"  "join-pane -t '%%'"
