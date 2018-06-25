# zpulg
if [ `uname` = "Darwin" ]
then
   source /home/linuxbrew/.linuxbrew/Cellar/zplug/2.4.2/init.zsh
elif [ `uname` = "Linux" ]
then
   source /usr/local/Cellar/zplug/2.4.2/init.zsh
fi

# プラグイン
zplug "zsh-users/zsh-autosuggestions"
zplug "zsh-users/zsh-syntax-highlighting", defer:2
zplug "zsh-users/zsh-completions"
zplug "mafredri/zsh-async, from:github"
zplug "sindresorhus/pure", use:pure.zsh, from:github, as:theme

if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    fi
fi
zplug load

# 日本語を使用
export LANG=ja_JP.UTF-8

# 色を使用
autoload -Uz colors
colors

# 補完
autoload -Uz compinit
compinit

# 補完で大文字にもマッチ
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

# 補完後、メニュー選択モードになり左右キーで移動が出来る
zstyle ':completion:*:default' menu select=2

# 補完候補に色を付ける。
export LSCOLORS=gxfxxxxxcxxxxxxxxxgxgx
export LS_COLORS='di=01;36:ln=01;35:ex=01;32'
zstyle ':completion:*' list-colors 'di=36' 'ln=35' 'ex=32'

# ヒストリーに重複を表示しない
setopt histignorealldups

# cdコマンドを省略して、ディレクトリ名のみの入力で移動
setopt auto_cd

# beep を無効にする
setopt no_beep

# エイリアス
if [ `uname` = "Darwin" ]
then
    alias ls='ls -G'
    # cdの後にlsを実行
    chpwd() { ls -G }
elif [ `uname` = "Linux" ]
then
    alias ls='ls --color'
    # cdの後にlsを実行
    chpwd() { ls --color }
fi

alias la='ls -a'
alias ll='ls -al'
alias e='emacs'
alias sudo='sudo '

# パス
# linuxbrew(Macならコメントアウト)
export PATH='/home/linuxbrew/.linuxbrew/bin:/home/linuxbrew/.linuxbrew/sbin':"$PATH"

# pyenv
export PATH="$HOME/.pyenv/bin:$PATH"
eval "$(pyenv init -)"

