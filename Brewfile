require 'socket'

HOSTNAME = Socket.gethostname.strip

tap "beeftornado/rmtree"
tap "github/gh"
tap "rs/tap"

brew "asdf"
brew "curl"
brew "gh"
brew "git-delta"
brew "git"
brew "httpie"
brew "neofetch"
brew "neovim"
brew "pbzip2"
brew "pigz"
brew "shellcheck"
brew "unzip"
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
brew "autoconf"
brew "libffi"
brew "ncurses"
brew "openssl"
brew "readline"
brew "zlib"

# asdf-erlang/kerl build dependencies
brew "libssh"
brew "unixodbc"
brew "wxmac"

# asdf-ruby/ruby-build dependencies
brew "berkeley-db"
brew "bison"
brew "gdbm"
brew "libyaml"

# asdf-nodejs dependencies
brew "coreutils"
brew "curl"
brew "gawk"
brew "gnupg"

# asdf-python/python-build dependencies
brew "bzip2"
brew "libxml2"
brew "libxmlsec1"
brew "sqlite"
brew "xz"
