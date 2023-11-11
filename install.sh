#!/bin/bash

GREEN='\033[0;32m'
NC='\033[0;m'
RED='\033[0;31m'
BLUE='\033[0;34m'
L_RED='\033[1;31m'

move_files_from_dir() {
  name=$3
  SRC=$1
  DEST=$2
  echo 
  echo -e "${GREEN}Starting${NC} copy ${BLUE}$name${NC} from $SRC to $DEST"
  echo
  if [[ ! -d "$DEST" ]]; then
    mkdir -p $DEST
  fi
  overwrite_all=0
  files_count=0
  for FILE in "$SRC"* 
  do
    if [[ -f "$DEST"/"$(basename $FILE)" ]]; then
      if [[ $overwrite_all -eq 0 ]]; then
        echo -e "${RED}Warning!${NC} File $DEST$(basename $FILE) already exist. ${RED}Overwrite?${NC} [y/n/all/abort]: "
        read ANSWER
        case $ANSWER in
          [yY]) cp -r "$FILE" "$DEST"; files_count=$(( $files_count + 1 )); echo -e "File $FILE from $SRC to $DEST copy ${GREEN}success!${NC}";;
          [nN]) echo -e "File $FILE ${L_RED}not copied${NC}";;
          all) cp -r "$FILE" "$DEST"; files_count=$(( $files_count + 1 ));
            echo -e "File $FILE from $SRC to $DEST copy ${GREEN}success!${NC}";
            overwrite_all=1;; 
          abort) echo -e "You ${RED}abort${NC} copy ${BLUE}$name${NC} configs."; break;;
          *) echo -e "${RED}Invalid answer.${NC} File $FILE not copied.";;
        esac
      else
        cp -r "$FILE" "$DEST"
        files_count=$(( $files_count + 1 ))
        echo -e "File $FILE from $SRC to $DEST copy ${GREEN}success!${NC}"
      fi
    else 
      cp -r "$FILE" "$DEST"
      files_count=$(( $files_count + 1 ))
      echo -e "File $FILE from $SRC to $DEST copy ${GREEN}success!${NC}"
    fi
  done
  echo
  echo -e "Copied ${GREEN}$files_count ${BLUE}$name${NC} files/directories from $SRC to $DEST"
}

move_one_file_function() {
  FILE=$1
  DEST=$2
  echo
  echo "Copy $FILE to $DEST"
  if [[ -f "$FILE" ]]; then
    if [[ ! -d "$DEST" ]]; then
      mkdir -p $DEST
    fi
    cp "$FILE" "$DEST$(basename $FILE)"
  fi
  echo
}

move_one_file_function ./.zshrc ~/

move_files_from_dir ./config/nvim/ ~/.config/nvim/ NeoVim
move_files_from_dir ./config/lf/ ~/.config/lf/ LF
move_files_from_dir ./config/lvim/ ~/.config/lvim/ lvim
move_files_from_dir ./config/yazi/ ~/.config/yazi/ yazi
move_files_from_dir ./config/kitty/ ~/.config/kitty/ kitty

