#!/bin/bash

storage_file=~/rt-data.txt

# handling flags and input
while test $# -gt 0; do
  case "$1" in
    -h|--help)
      echo "Image how usefull it can be to set a directory you are the most focused right now. Set an anchor to that directory and return whenever you need it with an short 2-char command."
      echo " "
      echo "application [options] [argument]"
      echo " "
      echo "options:"
      echo "-s, --set                 set current directory as base for return"
      echo "-h, --help                show brief help"
      exit 0
      ;;
  -s|--set)
      if [[ -z $2 ]];
      then
        echo "Setting achor to current directory."
        echo "$(pwd)" > $storage_file
        echo "You can also provide a target directory through argument."
      elif [[ -d $2 ]];
      then
        echo "Placing anchor..."
        echo "$2" > $storage_file
        echo "...base ready."
        echo "Return to here with simple 'rt' command."
      else
        echo "Invalid command. Check if your argument is a directory."
      fi
      exit 0
      ;;
    *)
      echo "invalid command.";
      echo "'rt -h' for help.";
      break
      ;;
  esac
done

# returning to anchor
anchor=$(cat $storage_file)

if [[ -z $1 ]];then
  echo "teleporting to base."
  cd $anchor
fi

