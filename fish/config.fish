set XDG_CURRENT_DESKTOP GNOME
set EDITOR vim; export EDITOR
set PYTHONBREAKPOINT 'ipdb.set_trace'; export PYTHONBREAKPOINT
set -x -U GOPATH $HOME/go
set -x -U BROWSER firefox
set -x -U CHROME_BIN google-chrome
set -gx PATH $GOPATH/bin $PATH
set -g simple_ass_prompt_greeting
set --erase fish_greeting
thefuck --alias | source
