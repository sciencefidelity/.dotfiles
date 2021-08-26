if [[ "$(uname)" == "Darwin" ]]; then
  # android sdk
  export ANDROID_SDK=$HOME/Library/Android/sdk
  export PATH=$ANDROID_SDK/emulator:$ANDROID_SDK/tools:$PATH
  # brave browser (standing in for chrome)
  export CHROME_EXECUTABLE="/Applications/Brave Browser.app/Contents/MacOS/Brave Browser"
  # dart executables
  export PATH="$PATH":"$HOME/.pub-cache/bin"
  # deno executables
  export PATH="/Users/matt/.deno/bin:$PATH"
  # flutter
  export PATH="$PATH:/usr/local/flutter/bin"
  # php8.0
  export PATH="/usr/local/opt/php@8.0/bin:$PATH"
  # nvm
  export NVM_DIR="$HOME/.nvm"
  [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
else
  # path to Go
  export PATH=$PATH:/usr/local/src/go/bin
  # path to Dart
  export PATH=$PATH:/usr/local/src/dart-sdk/bin
  # path to Hugo
  export PATH="~/go/bin:$PATH"
  # path to LF
  export PATH=$PATH:/usr/local/src/bin
fi
