# combine timew and taskw
alias tt="task ghistory.daily; timew week sow - eoww :id;  task"
# timew summary sow - eoww :id;

# timewarrior only
alias tw="timew"

function tws(){
  if [[ "$1" = "-h" ]]; then
    echo "time warrior summary wrapper"
    echo "Usage:"
    echo -e "\ttws [DATE]"
    echo ""
    echo "When no date is given, defaults to today"
    echo ""
    echo -e "\tDATE\t\tyyyy-mm-dd (see timew dates help)"
    return 0
  fi

  timew day $1
  timew summary :id $1
}


alias twy="tws :yesterday"
alias tww="timew week :id"


function twd(){
  if [[ $# -le 3 ]]; then
    echo "time warrior date tracking wrapper"
    echo "Usage:"
    echo -e "\ttwd DATE STARTTIME STOPTIME TAG [TAG ...]"
    echo ""
    echo -e "\tDATE\t\tyyyy-mm-dd (see timew dates help)"
    echo -e "\tSTARTTIME\thh:mm[:ss]"
    echo -e "\tSTOPTIME\thh:mm[:ss]"
    echo -e "\tTAGS\t\tstrings"
    return 0
  fi

  # assumes we only ever track for one day
  DATE="$1"
  START="$2"
  STOP="$3"
  # https://stackoverflow.com/a/3816747/8069867
  TAGS="${@:4}"
  timew track ${DATE}T${START} - ${DATE}T${STOP} $TAGS
  tws $DATE
}

alias twyd="twd $(date --date='yesterday' +'%Y-%m-%d')"
alias twtd="twd $(date +'%Y-%m-%d')"

## Taskwarrior only
alias ttal='task add dep:"$(task +LATEST uuids)"'
function ttbp(){
  task project:$1 burndown.daily
}

function ttb(){
  task burndown.daily
}

function ttp(){
  task project:$1
}

