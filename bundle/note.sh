# command help create notes files
#
# @usage
#   #list all notes files
#   note
#
#   #create a note file
#   note note_file_name
#
#   #open note file
#   note ....autocomplete...
#
NOTES_BASE_DIR="$HOME/notes"
note(){
  NOTES_DIR="$NOTES_BASE_DIR"
  if [ $1 ]; then;
    NOTES_DIR=$(dirname "$NOTES_DIR/$1")
  fi;

  if [ ! -d $NOTES_DIR ]; then;
    mkdir -p $NOTES_DIR
  fi;

  if [ ! $1 ]; then;
    find $NOTES_DIR -print | sed -e 's;[^/]*/;|____;g;s;____|; |;g'
  fi;

  if [ $1 ]; then;
    CURRENT_DIR=$(pwd)
    cd $NOTES_BASE_DIR
    vim $1
    cd $CURRENT_DIR
  fi;
}

_note() {
  _arguments '1: :->note'
  case $state in
    note)
      _files -W $NOTES_BASE_DIR
    ;;
  esac
}
compdef _note note

