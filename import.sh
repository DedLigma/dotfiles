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

echo -e "${GREEN}Start${NC} import ${BLUE}.zshrc ${NC} files\n"
import_function ~/.zshrc ./
echo
echo -e "${GREEN}Start${NC} import ${BLUE}Kitty${NC} config files\n"
import_function ~/.config/kitty/kitty.conf ./config/kitty/
import_function ~/.config/kitty/open-actions.conf ./config/kitty/
import_function ~/.config/kitty/current-theme.conf ./config/kitty/
import_function ~/.config/kitty/Material Dark.conf ./config/kitty/
echo
echo -e "${GREEN}Start${NC} import ${BLUE}LunarVim${NC} config files\n"
import_function ~/.config/lvim/config.lua ./config/lvim/
import_function ~/.config/lvim/lua/my_plugins.lua ./config/lvim/lua/
import_function ~/.config/lvim/lua/config_c_cpp.lua ./config/lvim/lua/
import_function ~/.config/lvim/lua/config_python.lua ./config/lvim/lua/
echo
echo -e "${GREEN}Start${NC} import ${BLUE}Yazi${NC} config files\n"
import_function ~/.config/yazi/yazi.toml ./config/yazi/
import_function ~/.config/yazi/keymap.toml ./config/yazi/
echo
echo -e "${GREEN}Start${NC} import ${BLUE}NeoVim${NC} config files\n"
import_function ~/.config/nvim/init.lua ./config/nvim/
echo
echo -e "${GREEN}Start${NC} import ${BLUE}LF${NC} config files\n"
import_function ~/.config/lf/lfrc ./config/lf/
import_function ~/.config/lf/icons ./config/lf/
import_function ~/.config/lf/colors ./config/lf/
import_function ~/.config/lf/cleaner ./config/lf/
import_function ~/.config/lf/preview ./config/lf/
echo
echo -e "${GREEN}Start${NC} import ${BLUE}LazyGit${NC} config files\n"
import_function ~/.config/lazygit/config.yml ./config/lazygit/
echo
