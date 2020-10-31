#!/bin/bash

source _utils.sh

# ------------------------------------------------------------------------------
e_pending "Checking tools"
# ------------------------------------------------------------------------------

if has_command "brew"; then
  if ! has_command "trash"; then
    e_pending "Installing trash"
    brew install trash
    test_command "trash"
  fi
fi

if has_command "brew"; then
  if ! has_command "git"; then
    get_consent "Install git"
    if has_consent; then
      e_pending "Installing git"
      brew install git
      test_command "git"
    fi
  fi
fi

if has_command "brew"; then
  if ! has_command "zsh"; then
    get_consent "Install zsh"
    if has_consent; then
      e_pending "Installing zsh"
      brew install zsh
      test_command "zsh"
    fi
  fi
fi

if has_command "zsh"; then
  if ! has_path ".oh-my-zsh"; then
    get_consent "Install oh-my-zsh"
    if has_consent; then
      e_pending "Installing oh-my-zsh"
      sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
      test_path ".oh-my-zsh"
    fi
  fi
fi

if has_command "brew" && has_command "zsh"; then
  if ! has_brew "powerlevel10k"; then
    get_consent "Install powerlevel10k (CLI theming)"
    if has_consent; then
      e_pending "Installing powerlevel10k"
      brew install romkatv/powerlevel10k/powerlevel10k
      echo 'source /usr/local/opt/powerlevel10k/powerlevel10k.zsh-theme' >>! ~/.zshrc
      test_brew "powerlevel10k"
      p10k configure
    fi
  fi
fi

if has_command "brew"; then
  if ! has_command "node"; then
    get_consent "Install node (Node via Homebrew)"
    if has_consent; then
      e_pending "Installing node"
      brew install node
      test_command "node"
    fi
  fi
fi

if has_command "brew"; then
  if ! has_command "tmux"; then
    get_consent "Install tmux"
    if has_consent; then
      e_pending "Installing tmux"
      brew install tmux
      cp ../tmux ~/.tmux.conf
      test_command "tmux"
    fi
  fi
  if ! has_command "pfetch"; then
    get_consent "Install pfetch"
    if has_consent; then
      e_pending "Installing pfetch"
      brew install pfetch
      test_command "pfetch"
    fi
  fi
  if ! has_command "fzf"; then
    get_consent "Install fzf"
    if has_consent; then
      e_pending "Installing fzf"
      brew install fzf
      test_command "fzf"
    fi
  fi
  if ! has_command "rg"; then
    get_consent "Install ripgrep"
    if has_consent; then
      e_pending "Installing ripgrep"
      brew install ripgrep
      test_command "rg"
    fi
  fi
  if ! has_command "nvim"; then
    get_consent "Install Neovim (via brew) & vim-plug"
    if has_consent; then
      e_pending "Installing Neovim & vim-plug"
      brew install neovim
      curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
        https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
 	mkdir -p ~/.config/nvim
      cp $DOTS_DIR/init.vim ~/.config/nvim/init.vim
      cp $DOTS_DIR/vimrc ~/.vimrc 
      test_command "nvim"
    fi
  fi
  if ! has_command "bat"; then
    get_consent "Install bat (via brew)"
    if has_consent; then
      e_pending "Installing bat"
      brew install bat
      test_command "bat"
    fi
  fi
  if ! has_command "exa"; then
    get_consent "Install exa (via brew)"
    if has_consent; then
      e_pending "Installing exa"
      brew install exa
      test_command "exa"
    fi
  fi
fi

if has_command "brew"; then
  if ! has_command "nvm"; then
    get_consent "Install nvm (Node via nvm)"
    if has_consent; then
      e_pending "Installing nvm"
      curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.36.0/install.sh | bash
      test_command "nvm"
    fi
  fi
fi

if has_command "brew"; then
  if ! has_command "yarn"; then
    get_consent "Install yarn"
    if has_consent; then
      if has_command "node"; then
        e_pending "Installing yarn (without Node)"
        brew install yarn --without-node
      else
        e_pending "Installing yarn (with Node)"
        brew install yarn
      fi
      test_command "yarn"
    fi
  fi
fi

if has_command 'npm'; then
  get_consent "Upgrade npm"
  if has_consent; then
    e_pending "Upgrading npm"
    npm i -g npm@latest
    test_command "npm"
  fi
fi

if has_command "npm"; then
  get_consent "Install/Upgrade serve (globally via npm)"
  if has_consent; then
    e_pending "Installing/Upgrading serve"
    npm i -g serve@latest
    test_command "serve"
  fi
fi

if has_command "npm"; then
  get_consent "Install/Upgrade eslint/prettier combo (globally via npm)"
  if has_consent; then
    e_pending "Installing/Upgrading eslint/prettier combo"
    npx install-peerdeps -g eslint-config-react-app
    npm i -g create-react-app@latest prettier@latest eslint-config-prettier@latest eslint-plugin-prettier@latest
    test_command "eslint"
    test_command "prettier"
  fi
fi

