require 'socket'

HOSTNAME = Socket.gethostname.strip

tap "beeftornado/rmtree"
tap "github/gh"
tap "rs/tap"

brew "asciinema"
brew "asdf"
brew "curlie"
brew "diff-so-fancy"
brew "gh"
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
end
