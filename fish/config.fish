#eval (python -m virtualfish)
thefuck --alias | source
set XDG_CURRENT_DESKTOP GNOME
set EDITOR vim; export EDITOR
set PYTHONBREAKPOINT 'ipdb.set_trace'; export PYTHONBREAKPOINT
set -x -U GOPATH $HOME/go
set -x -U BROWSER firefox
set -x -U CHROME_BIN chromium-browser
set -gx PATH $GOPATH/bin $PATH
python -m virtualfish | source

