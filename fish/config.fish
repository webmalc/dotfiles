set XDG_CURRENT_DESKTOP GNOME
set EDITOR nvim; export EDITOR
set PYTHONBREAKPOINT 'ipdb.set_trace'; export PYTHONBREAKPOINT
set -x -U GOPATH $HOME/go
set -x -U BROWSER firefox
set -x -U CHROME_BIN chromium
set -gx PATH $GOPATH/bin $PATH
set -gx PATH $HOME/.local/bin $PATH
set -g simple_ass_prompt_greeting
set --erase fish_greeting
thefuck --alias | source
