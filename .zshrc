parse_git_branch() {
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}
export EDITOR="/usr/bin/vim"

setopt PROMPT_SUBST
PS1="%F{cyan}|%F{green}.sh Config%F{cyan}| "
PS1+="%F{yellow}\$(parse_git_branch)"$'\n'
PS1+="%F{yellow}%n%F{white}@%F{green}%m:%F{cyan}%~%F{white}$ "
export CLICOLOR=1
export LSCOLORS="ExGxBxDxCxEgEdxbxgxcxd"
export PATH=$PATH:/usr/local/sbin
# zstyle ':completion:*' list-colors 'di=36:ln=1;31:so=37:pi=1;33:ex=35:bd=37:cd=37:su=37:sg=37:tw=32:ow=32'
zstyle ':completion:*:*:git:*' script ~/git-completion.zsh
# autoload -U compinit && compinit
alias ll="ls -la"
alias dc="docker compose"
alias tf="terraform"

alias dockerrmleaves="docker rmi \$(docker images -f 'dangling=true' -q)"
alias dockerrmstopped="docker rm \$(docker ps -a -q)"
#
# autoload -U +X bashcompinit && bashcompinit
