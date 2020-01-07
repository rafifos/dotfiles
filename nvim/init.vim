let vimplug_exists = stdpath('config') . 'autoload/plug.vim'
let autoload_plug_path = stdpath('data') . '/plugged'

" Installs Vim-Plug if it isn't installed
if !filereadable(vimplug_exists)
  if !executable("curl")
    echoerr "You have to install curl or first install vim-plug yourself!"
    execute "q!"
  endif
  
  echo "Installing Vim-Plug..."
  echo ""
  
  silent exec "!\curl -fLo " . vimplug_exists . " --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim"
  
  autocmd VimEnter * PlugInstall
endif

" Specify a directory for plugins
" - For Neovim: stdpath('data') . '/plugged'
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin(autoload_plug_path)

Plug 'arcticicestudio/nord-vim'
Plug 'tpope/vim-sensible'

" Initialize plugin system
call plug#end()

" Custom colorscheme
colorscheme nord