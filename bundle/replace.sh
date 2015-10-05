  function replace(){
    ack $1
    confirm && ack -l --print0 "$1" | zargs -0 -n 1 sed -i -e "s/$1/$2/g"
  }
  
  function confirm(){
    echo "${1:-Are you sure? [y/N]}"
    read response
    case $response in
      [yY][eE][sS]|[yY])
        true
        ;;
      *)
        false
        ;;
    esac
  }
