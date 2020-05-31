export PATH="/usr/local/opt/openssl/bin:$PATH"

# Activate iris-python venv
source ~/iris-python/bin/activate

# Iris cue private key
export CUE_PRIVATE_KEY=`cat ~/key/private_key_pkcs8.pem`

# Android Studio SDK
export ANDROID_HOME=/Users/chansupark/Library/Android/sdk
export PATH=$PATH:$ANDROID_HOME/tools:$ANDROID_HOME/platform-tools
# Bazel bash completion
complete -o nospace -F _bazel__complete bazelisk
# added by Anaconda3 5.3.0 installer
# >>> conda init >>>
# !! Contents within this block are managed by 'conda init' !!
#__conda_setup="$(CONDA_REPORT_ERRORS=false '/Users/chansupark/anaconda3/bin/conda' shell.bash hook 2> /dev/null)"
#if [ $? -eq 0 ]; then
#    \eval "$__conda_setup"
#else
#    if [ -f "/Users/chansupark/anaconda3/etc/profile.d/conda.sh" ]; then
#        . "/Users/chansupark/anaconda3/etc/profile.d/conda.sh"
#        CONDA_CHANGEPS1=false conda activate base
#    else
#        \export PATH="/Users/chansupark/anaconda3/bin:$PATH"
#    fi
#fi
#unset __conda_setup
# <<< conda init <<<

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

export MACOSX_DEPLOYMENT_TARGET=10.14

# MongoDB setup
export PATH="/usr/local/opt/mongodb-community@4.0/bin:$PATH"

export PATH="$HOME/.cargo/bin:$PATH"
