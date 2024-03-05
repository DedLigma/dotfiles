#!/bin/bash

import_function() {
  FILE=$1
  SAVE=$2
  echo "import $FILE to $SAVE"
  if [[ -f "$FILE" ]]; then
    if [[ ! -d "$SAVE" ]]; then
      mkdir -p $SAVE
    fi
    cp "$FILE" "$SAVE$(basename $FILE)"
  fi
}

GREEN='\033[0;32m'
NC='\033[0;m'
RED='\033[0;31m'
BLUE='\033[0;34m'

if [ "$(ls -A ./config/)" ]; then
  echo "Config folder is not empty."
  read -p "Delete them? [y/n]: " answer
  case "$answer" in 
    [Yy]* ) rm -rf ./config/*;;
    * ) echo "";;
  esac
fi

echo -e "${GREEN}Start${NC} import ${BLUE}.zshrc ${NC} files\n"
import_function ~/.zshrc ./
echo
echo -e "${GREEN}Start${NC} import ${BLUE}Kitty${NC} config files\n"
import_function ~/.config/kitty/kitty.conf ./config/kitty/
import_function ~/.config/kitty/open-actions.conf ./config/kitty/
import_function ~/.config/kitty/current-theme.conf ./config/kitty/
import_function ~/.config/kitty/Material Dark.conf ./config/kitty/
echo
echo -e "${GREEN}Start${NC} import ${BLUE}Yazi${NC} config files\n"
import_function ~/.config/yazi/yazi.toml ./config/yazi/
import_function ~/.config/yazi/keymap.toml ./config/yazi/
echo
echo -e "${GREEN}Start${NC} import ${BLUE}NeoVim${NC} config files\n"
import_function ~/.config/nvim/init.lua ./config/nvim/
import_function ~/.config/nvim/lazy-lock.json ./config/nvim/
import_function ~/.config/nvim/init.lua.bak ./config/nvim/

import_function ~/.config/nvim/lua/core/init.lua ./config/nvim/lua/core/
import_function ~/.config/nvim/lua/core/utils.lua ./config/nvim/lua/core/
import_function ~/.config/nvim/lua/core/mappings.lua ./config/nvim/lua/core/
import_function ~/.config/nvim/lua/core/bootstrap.lua ./config/nvim/lua/core/
import_function ~/.config/nvim/lua/core/default_config.lua ./config/nvim/lua/core/

import_function ~/.config/nvim/lua/plugins/init.lua ./config/nvim/lua/plugins/
import_function ~/.config/nvim/lua/plugins/configs/cmp.lua ./config/nvim/lua/plugins/configs/
import_function ~/.config/nvim/lua/plugins/configs/mason.lua ./config/nvim/lua/plugins/configs/
import_function ~/.config/nvim/lua/plugins/configs/others.lua ./config/nvim/lua/plugins/configs/
import_function ~/.config/nvim/lua/plugins/configs/nvimtree.lua ./config/nvim/lua/plugins/configs/
import_function ~/.config/nvim/lua/plugins/configs/lazy_nvim.lua ./config/nvim/lua/plugins/configs/
import_function ~/.config/nvim/lua/plugins/configs/lspconfig.lua ./config/nvim/lua/plugins/configs/
import_function ~/.config/nvim/lua/plugins/configs/telescope.lua ./config/nvim/lua/plugins/configs/
import_function ~/.config/nvim/lua/plugins/configs/treesitter.lua ./config/nvim/lua/plugins/configs/

import_function ~/.config/nvim/lua/custom/mappings.lua ./config/nvim/lua/custom/
import_function ~/.config/nvim/lua/custom/chadrc.lua ./config/nvim/lua/custom/
import_function ~/.config/nvim/lua/custom/plugins.lua ./config/nvim/lua/custom/
import_function ~/.config/nvim/lua/custom/configs/lspconfig.lua ./config/nvim/lua/custom/configs/
import_function ~/.config/nvim/lua/custom/configs/null-ls.lua ./config/nvim/lua/custom/configs/
echo
echo -e "${GREEN}Start${NC} import ${BLUE}LazyGit${NC} config files\n"
import_function ~/.config/lazygit/config.yml ./config/lazygit/
echo
