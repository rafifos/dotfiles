require 'socket'

tap "beeftornado/rmtree"
tap "github/gh"
tap "jesseduffield/lazydocker"
tap "nektos/tap"
tap "rafifos/homebrew-tap"

if Socket.gethostname === 'drifter'
  brew "android-sdk-platform-tools"
  brew "hostess"
end

brew "act"
brew "bat"
brew "bottom"
brew "docker-compose"
brew "exa"
brew "fd"
brew "fish"
brew "fzf"
brew "gh"
brew "git"
brew "git-crypt"
brew "git-delta"
brew "grc"
brew "httpie"
brew "httpstat"
brew "lazydocker"
brew "neovim"
brew "openssh"
brew "rafifos/tap/keychain"
brew "rm-improved"
brew "topgrade"
brew "uutils-coreutils"

# Make docker-compose available to docker-cli as a plugin.
# docker_plugins_dir = Pathname.new(ENV["HOME"]).dirname.join(".docker/cli-plugins")
# docker_compose_bin = Pathname.new(ENV["HOMEBREW_PREFIX"]).dirname.join("/opt/docker-compose/bin/docker-compose")

# system( "mkdir -p #{docker_plugins_dir}" )
# system( "ln -sfn #{docker_compose_bin} #{docker_plugins_dir}/docker-compose" )
