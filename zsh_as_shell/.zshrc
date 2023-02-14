HISTFILE=~/.histfile
HISTSIZE=10000
SAVEHIST=10000


# 别名
alias ls='ls --color=auto'
alias ll='ls -Alh'
alias l.='ls -dlh'
alias grep='grep --color=auto -i'


# 按键映射
bindkey -e
# cat -v，然后按下组合键可得到按键序列
bindkey '^K' kill-whole-line      # Ctrl+K
bindkey '^A' beginning-of-line    # Ctrl+A
bindkey '^E' end-of-line          # Ctrl+E


# 目录堆栈
# https://zsh.sourceforge.io/Doc/Release/Options.html
setopt AUTO_CD              # 直接输入路径进入目录，不需要输入cd
setopt AUTO_PUSHD           # 执行cd后自动将旧目录推入目录堆栈
setopt PUSHD_IGNORE_DUPS    # 不在目录堆栈中存储重复项
setopt PUSHD_SILENT         # 在pushd或popd之后不打印目录堆栈
setopt PUSHD_TO_HOME        # pushd没有给出参数时等同于pushd ~
alias d='dirs -v'
for index in {0..9}; do
  alias $index="cd +${index}"
done
unset index
DIRSTACKSIZE=40
DIRSTACKFILE=$HOME/.cache/zsh/dirstack
if [[ ! -f $DIRSTACKFILE ]]; then
	mkdir -p $(dirname $DIRSTACKFILE)
	touch $DIRSTACKFILE
fi
if [[ $#dirstack -eq 0 ]]; then
  dirstack=( ${(f)"$(< $DIRSTACKFILE)"} )
fi
# chpwd钩子函数，工作目录改变时会自动执行 https://zsh.sourceforge.io/Doc/Release/Functions.html
chpwd() {
  print -l $PWD ${(u)dirstack} > $DIRSTACKFILE
}


# 命令补全系统
# zsh-completions 添加更多命令补全
source ~/.local/share/zsh/plugins/zsh-completions/zsh-completions.plugin.zsh
# fpath=($fpath ~/.local/share/zsh/plugins/zsh-completions/src)
# 打开命令补全系统
autoload -Uz compinit    # autoload将compinit标记成$fpath中的函数而不是$PATH中的可执行文件，函数名和文件名相同，即compinit函数定义在compinit文件中；U选项表示在加载函数过程中抑制alias，z选项表示函数使用zsh风格加载；autoload只会在需要时加载函数
compinit    # 生成.zcompdump文件
zstyle ':completion:*' rehash true    # $PATH中有新可执行文件时，命令补全系统同步更新
# docker命令补全开启选项堆叠 https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/docker
zstyle ':completion:*:*:docker:*' option-stacking yes
zstyle ':completion:*:*:docker-*:*' option-stacking yes


# zsh-autosuggestions
source ~/.local/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.plugin.zsh


# zsh-syntax-highlighting
source ~/.local/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.plugin.zsh


# zsh-history-substring-search 需要在zsh-syntax-highlighting后加载
source ~/.local/share/zsh/plugins/zsh-history-substring-search/zsh-history-substring-search.plugin.zsh
bindkey '^[[1;5A' history-substring-search-up      # Ctrl+上箭头
bindkey '^[[1;5B' history-substring-search-down    # Ctrl+下箭头


# sudo
source ~/.local/share/zsh/plugins/sudo/sudo.plugin.zsh


# thefuck
eval $(thefuck --alias fuck)


# cursor_mode https://thevaluable.dev/zsh-install-configure-mouseless/
source ~/.local/share/zsh/plugins/cursor_mode/cursor_mode.plugin.zsh


# prue
fpath=($fpath ~/.local/share/zsh/plugins/pure)
autoload -U promptinit
promptinit
prompt pure
PURE_PROMPT_SYMBOL='>'
PURE_PROMPT_VICMD_SYMBOL='<'
