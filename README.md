# Mac Dotfiles

## Installation

1. `git clone [THIS REPO]` in ~
2. Install Homebrew https://brew.sh
3. Run `[THIS REPO]/install_minimum_tools`
4. Install https://github.com/robbyrussell/oh-my-zsh
5. replace `plugins=()` in zshrc with source ~/dotfiles-mac/ohmyzsh/config`
6. `echo "source ~/dotfiles-mac/zshrc" >> .zshrc`

## Used Tools

### fasd

https://github.com/clvv/fasd

Comes with aliases
```
alias a='fasd -a'        # any
alias s='fasd -si'       # show / search / select
alias d='fasd -d'        # directory
alias f='fasd -f'        # file
alias sd='fasd -sid'     # interactive directory selection
alias sf='fasd -sif'     # interactive file selection
alias z='fasd_cd -d'     # cd, same functionality as j in autojump
alias zz='fasd_cd -d -i' # cd with interactive selection
```

### Legit

Used for smooth branch switching. Hidden by aliases in aliases/git


### fzf

* CTRL-T - Paste the selected files and directories onto the command-line
* CTRL-R - Paste the selected command from history onto the command-line
* ALT-C - cd into the selected directory
