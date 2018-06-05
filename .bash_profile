#loginPath

# Initialization for FDK command line tools.Tue Jan 27 08:18:37 2015
FDK_EXE="/Users/yuki/bin/FDK/Tools/osx"
PATH=${PATH}:"/Users/yuki/bin/FDK/Tools/osx"
export PATH
export FDK_EXE

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

#export PS1='\h:\W \u\`__git_ps1`'
export PS1='\[\033[32m\]\u@\h\[\033[00m\]:\[\033[34m\]\w\[\033[31m\]$(__git_ps1)\[\033[00m\]\n$ '
cd ~/Projects
source ~/.git-prompt.sh
