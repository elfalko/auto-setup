yn(){
while :
do
    echo "Please answer y/n."
    local answer
    read answer 
    case "$answer" in
        [yY]*|[jJ]*)
	        echo "You selected yes."
		    return 0
			;;
	    [zZ]*)
		    echo "Going ahead. Note that your keyboard language does not match your expectation."
		    return 0;
		    ;;
	    [nN]*)
		    echo "You selected No."
		    return 1;
		    ;;
	    *)
		    echo "Please answer y/n."
    esac
done
}
