let vimplug_exists=expand(stdpath('config') . '/autoload/plug.vim')
let autoload_plug_path = stdpath('data') . '/plugged'

" Installs vim-plug if it isn't installed
if !filereadable(vimplug_exists)
  if !executable("curl")
    echoerr "You have to install curl or first install vim-plug yourself!"
    execute "q!"
  endif

  echo "Installing vim-plug..."
  echo ""

  exec "!\curl -fLo " . vimplug_exists . " --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim"
  autocmd VimEnter * PlugInstall --sync
endif

" Specify a directory for plugins
" - For Neovim: stdpath('data') . '/plugged'
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin(autoload_plug_path)

Plug 'arcticicestudio/nord-vim'
Plug 'airblade/vim-gitgutter'

" Initialize plugin system
call plug#end()

" Custom colorscheme
colorscheme nord
