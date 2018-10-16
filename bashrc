export CLICOLOR=1

# Assumes this file is sourced.
export DOTFILES=$(cd `dirname "$BASH_SOURCE"` && pwd)

export PATH="$DOTFILES/bin":$PATH

if [[ -d $HOME/bin ]]; then
  export PATH=$HOME/bin:$PATH
fi

# Uncompresses the given tarball, and cds into the uncompressed directory:
#
#    fxn@halmos:~/tmp$ xcd ruby-1.9.2-p0.tar.gz
#    fxn@halmos:~/tmp/ruby-1.9.2-p0$
#
# Accepts tar.gz, tar.bz2, and zip.
function xcd {
    local tarball=$1
    if [[ "$tarball" == *.tar.gz ]]; then
        tar xzf "$tarball" && cd "${tarball%.tar.gz}"
    elif [[ "$tarball" == *.tar.bz2 ]]; then
        tar xjf "$tarball" && cd "${tarball%.tar.bz2}"
    elif [[ "$tarball" == *.zip ]]; then
        unzip "$tarball" && cd "${tarball%.zip}"
    else
        echo "unknown tarball"
    fi
}

#
# --- Rails commands ----------------------------------------------------------
#
function rails_command {
    local cmd=$1
    shift

    if [ -e bin/rails ]; then
        bin/rails $cmd "$@"
    elif [ -e script/rails ]; then
        script/rails $cmd "$@"
    else
        script/$cmd "$@"
    fi
}

function rs {
    rails_command server "$@"
}

function rc {
    rails_command console "$@"
}

function rg {
    rails_command generate "$@"
}

function rr {
    rails_command runner "$@"
}

function rdb {
    rails_command db "$@"
}

# tail -f shortcut for Rails log files.
#
# It selects the log file to tail depending on the environment, priority is:
#
#   1. argument, eg rl test
#   2. RAILS_ENV environment variable
#   3. Defaults to 'development'
#
# Thanks to pgas in #bash for the idiom to chain the defaults.
function rl {
    tail -f log/${1-${RAILS_ENV-development}}.log
}

function rn {
    local app_name=$1
    shift

    rails new $app_name --skip-bundle "$@" && cd $app_name && bundle install --local
}

function mcd {
    mkdir -p $1 && cd $1
}

# Reboots Passenger.
alias rb='touch tmp/restart.txt'

# Run the executable in the bundle.
alias bx='bundle exec'
alias bk='bundle exec rake'
alias br='bundle exec rspec'

# Git branch in shell prompt.
function current_git_branch {
    if git rev-parse --git-dir >/dev/null 2>&1;
    then
      echo -n "($(git symbolic-ref --short HEAD))"
    fi
}
PS1="\u@\h:\w \$(current_git_branch)\$ "

# Amend reusing commit message.
alias amend='git commit --amend --no-edit'

export EDITOR=vim
export GIT_EDITOR="vim --clean -c 'set fo+=a | syntax off'"

function rebase {
    local remote=${1-origin}
    git pull --rebase $remote master
}

# jump is a directory switcher implemented as a Ruby gem:
#
#   gem install jump -N
#
if type jump-bin >/dev/null; then
    source `jump-bin --bash-integration`/shell_driver
    alias j=jump
fi
