if [[ "$(uname)" == "Darwin" ]]; then
  # android sdk
  export ANDROID_SDK=$HOME/Library/Android/sdk
  export PATH=$ANDROID_SDK/emulator:$ANDROID_SDK/tools:$PATH
  # brave browser (standing in for chrome)
  export CHROME_EXECUTABLE="/Applications/Brave Browser.app/Contents/MacOS/Brave Browser"
  export CHROME_PATH="/Applications/Brave Browser.app/Contents/MacOS/Brave Browser"
  # dart executables
  export PATH="$PATH":"$HOME/.pub-cache/bin"
  # deno executables
  export PATH="/Users/matt/.deno/bin:$PATH"
  # flutter
  export PATH="$PATH:/usr/local/flutter/bin"
  # homebrew
  export PATH="/usr/local/sbin:$PATH"
  # nvm
  export NVM_DIR="$HOME/.nvm"
  [ -s "$(brew --prefix)/opt/nvm/nvm.sh" ] && . "$(brew --prefix)/opt/nvm/nvm.sh"
fi
