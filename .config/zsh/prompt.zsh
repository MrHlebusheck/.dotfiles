parse_git_branch() {
  if git rev-parse --is-inside-work-tree &>/dev/null; then
      git branch 2>/dev/null | sed -n 's/^\* \(.*\)/ [\1]/p'
    else
      echo ""
    fi
}

custom_prompt(){
  local git_branch=$(parse_git_branch)
  PROMPT="%F{yellow}[%D{%H:%M}]%f%F{magenta}$git_branch%f %F{green}[%~]%f
%(?:%F{blue}» :%F{red}»%f "
}

autoload -Uz add-zsh-hook
add-zsh-hook precmd custom_prompt

