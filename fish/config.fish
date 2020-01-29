#eval (python -m virtualfish)
thefuck --alias | source
set EDITOR vim; export EDITOR
set PYTHONBREAKPOINT 'ipdb.set_trace'; export PYTHONBREAKPOINT
set -x -U GOPATH $HOME/go
set -gx PATH $GOPATH/bin $PATH
python -m virtualfish | source

