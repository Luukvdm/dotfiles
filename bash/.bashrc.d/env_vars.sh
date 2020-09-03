export EDITOR=nvim

export DOTNET_CLI_TELEMETRY_OPTOUT=1
export PATH="$PATH:$(ruby -e 'puts Gem.user_dir')/bin"

export XDG_CONFIG_HOME=~/.config
export XDG_CACHE_HOME=~/.cache
export XDG_DATA_HOME=~/.local/share

export XDG_DATA_DIRS=/usr/local/share:/usr/share
export XDG_CONFIG_DIRS=/etc/xdg

# Home cleanup
export BASH_COMPLETION_USER_FILE="$XDG_CONFIG_HOME"/bash-completion/bash_completion

export IDEA_PROPERTIES="$XDG_CONFIG_HOME"/intellij-idea/idea.properties
export IDEA_VM_OPTIONS="$XDG_CONFIG_HOME"/intellij-idea/idea.vmoptions
export STUDIO_PROPERTIES="$XDG_CONFIG_HOME"/android-studio/idea.properties
export GOLAND_PROPERTIES="$XDG_CONFIG_HOME"/goland/idea.properties
export RIDER_PROPERTIES="$XDG_CONFIG_HOME"/rider/idea.properties

export ANDROID_SDK_HOME="$XDG_CONFIG_HOME"/android
export GNUPGHOME="$XDG_DATA_HOME"/gnupg
export GTK2_RC_FILES="$XDG_CONFIG_HOME"/gtk-2.0/gtkrc
export GTK_RC_FILES="$XDG_CONFIG_HOME"/gtk-1.0/gtkrc

export NUGET_PACKAGES="$XDG_CACHE_HOME"/NuGetPackages
export GRADLE_USER_HOME="$XDG_DATA_HOME"/gradle
export _JAVA_OPTIONS=-Djava.util.prefs.userRoot="$XDG_CONFIG_HOME"/java
export CARGO_HOME="$XDG_DATA_HOME"/cargo
export BUNDLE_USER_CONFIG="$XDG_CONFIG_HOME"/bundle BUNDLE_USER_CACHE="$XDG_CACHE_HOME"/bundle BUNDLE_USER_PLUGIN="$XDG_DATA_HOME"/bundle

export NPM_CONFIG_USERCONFIG=$XDG_CONFIG_HOME/npm/npmrc
export NPM_CONFIG_CACHE=$XDG_CACHE_HOME/npm
export NPM_CONFIG_TMP=$XDG_RUNTIME_DIR/npm
export NODE_REPL_HISTORY="$XDG_DATA_HOME"/node_repl_history

export DOCKER_CONFIG="$XDG_CONFIG_HOME"/docker
export MACHINE_STORAGE_PATH="$XDG_DATA_HOME"/docker-machine

export MYSQL_HISTFILE="$XDG_DATA_HOME"/mysql_history
