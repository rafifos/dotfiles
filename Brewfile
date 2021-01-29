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
brew "zsh"

unless HOSTNAME == 'GUARDIAN'
  brew "aws-iam-authenticator"
  brew "awscli"
  brew "docker-compose"
  brew "helm"
  brew "kubectl"
  brew "terraform"
  brew "watchman"
end

# Common dependencies
brew "openssl"
brew "readline"
brew "zlib"
brew "libffi"

# asdf-nodejs dependencies
brew "coreutils"
brew "curl"
brew "gnupg"
brew "gawk"

# asdf-python/python-build dependencies
brew "bzip2"
brew "libxml2"
brew "libxmlsec1"
brew "sqlite"
brew "xz"

# asdf-ruby/ruby-build dependencies
brew "autoconf"
brew "bison"
brew "libyaml"
brew "ncurses"
brew "gdbm"
brew "berkeley-db"
