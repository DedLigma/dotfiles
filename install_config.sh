#!/bin/bash

move_function() {
  name=$3
  SRC=$1
  DEST=$2
  echo 
  echo "Starting copy $name configs from $SRC to $DEST"
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
        echo "File $DEST/$(basename $FILE) already exist. Overwrite? [y/n/all]: "
        read ANSWER
        case $ANSWER in
          [yY]) cp "$FILE" "$DEST"; files_count=$(( $files_count + 1 )); echo "File $FILE from $SRC to $DEST copy success!";;
          [nN]) echo "File $FILE not moved";;
          all) cp "$FILE" "$DEST"; files_count=$(( $files_count + 1 ));
            echo "File $FILE from $SRC to $DEST copy success!";
            overwrite_all=1;; 
          *) echo "Invalid answer. File $FILE not moved.";;
        esac
      else
        echo "test all"
        cp "$FILE" "$DEST"
        files_count=$(( $files_count + 1 ))
        echo "File $FILE from $SRC to $DEST copy success!"
      fi
    else 
      cp "$FILE" "$DEST"
      files_count=$(( $files_count + 1 ))
      echo "File $FILE from $SRC to $DEST copy success!"
    fi
  done
  echo
  echo "Copied $files_count $name configs from $SRC to $DEST"
}

move_function ./.config/nvim/ ~/Documents/test/nvim/ NeoVim
move_function ./.config/lf/ ~/Documents/test/lf/ LF
