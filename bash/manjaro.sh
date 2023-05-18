export PKG_MANAGER="pamac install"

function pi(){
    pamac install $1 || pamac build $1
}
