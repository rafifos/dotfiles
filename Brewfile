require 'socket'

HOSTNAME = Socket.gethostname.strip

tap "beeftornado/rmtree"
tap "github/gh"
tap "rs/tap"

brew "asdf"
brew "curl"
brew "git"
brew "git-delta"
brew "gh"
brew "httpie"
brew "neofetch"
brew "neovim"
brew "pbzip2"
brew "pigz"
brew "shellcheck"

unless HOSTNAME == 'GUARDIAN'
  brew "aws-iam-authenticator"
  brew "awscli"
  brew "docker-compose"
  brew "helm"
  brew "kubectl"
  brew "terraform"
  brew "watchman"
end
