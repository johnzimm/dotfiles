## tmux

    tmux new-session   -d -s <session_name> "<command> <arguments>"
    tmux list-sessions
    tmux has-session   -t <session_name>
    tmux attach        -t <session_name>
    tmux kill-session  -t <session_name>
    tmux list-clients  -t <session_name>
    tmux kill-server
    tmux list-commands

    C-b ?        List of keyboard shortcuts.

    C-b d        Detach from session.
    C-b s        Choose a session from a list.

    C-b, %       Split screen in half from left to right
    C-b, ""      Split screen in half from top to bottom (one double quote)

    C-b, x       Kill the current pane
    C-b, arrow   Switch to the pane in direction of arrow key
