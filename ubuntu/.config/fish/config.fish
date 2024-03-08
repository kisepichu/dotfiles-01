if not set -q BASHRC
    set -x BASHRC 1
    bass source ~/.bashrc
end


if status is-interactive
    # Commands to run in interactive sessions can go here
end



# functions
alias reb="exec fish -l"
alias clip="clip.exe"
alias paste="powershell.exe /bin/paste.ps1"
alias python=python3
alias pip=pip3


function del
    mv $argv[1] $TRASH/$argv[1]
end

function save
    mv $argv[1] $SAVE/$argv[1]
end

function browse
    "$BROWSER" (wslpath -w (realpath $argv[1]))
end


# git
eval "$(gh completion -s fish)"

# tmux
if test $SHLVL = 1
  alias tm="tmux -2 attach || tmux -2 new-session \; source-file ~/.tmux/new-session"
end


starship init fish | source
~/.local/bin/mise activate fish | source
zoxide init fish | source
# # vscode の integration が使えるようにする https://code.visualstudio.com/docs/terminal/shell-integration#_features
# starship と同時に使うと一行ずれることの解決策がわからないので今は無効にしている
# string match -q "$TERM_PROGRAM" "vscode"
# and . (code --locate-shell-integration-path fish)
