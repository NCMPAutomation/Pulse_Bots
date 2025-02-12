/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
echo >> /Users/netcon/.zprofile
echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >>/Users/netcon/.zprofile
eval "$(/opt/homebrew/bin/brew shellenv)"
#Define the path as per the requirement, set up enviroment variable
brew install htop
htop
brew uninstall htop