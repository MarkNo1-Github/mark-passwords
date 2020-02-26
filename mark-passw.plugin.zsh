: '
------------------------------------------------------------------------------
         FILE:  mark-passw
  DESCRIPTION:  oh-my-zsh plugin.
       AUTHOR:  marco treglia markno1.github@gmail.com
      VERSION:  1.0.0

Usage:
      mark-passw add name passwords
          *     list
          *     show
          *     remove
to-do
          *     modify
------------------------------------------------------------------------------
'

mark-pssw () {

  case $1 in

  show) mark-pssw-show ;;

  remove) echo Pass ;;

  add) mark-pssw-add $2 ;;

  *)
    echo -e "mark-passw +  "
    echo -e "              list"
    echo -e "              add @names"
    echo -e "              show @name"
    echo -e "              remove @name "
    ;;
esac

}


mark-pssw-show () {
  ROOT="$HOME/$MARK_FEC"
  FILE="$ROOT/.psw"
  PWD=`pwd`
  cd $ROOT
  if [ -d  $ROOT ]; then
      if [ -f  $FILE ]; then
          echo "Passw file found."
          dialog --backtitle "by MarkNo1" \
          --title "My Passw" \
          --yesno "\n$(cat $FILE)\n\nExit?" 10 30

      else
          echo "Passw file not found."
      fi
  fi
  cd $PWD


}

mark-pssw-remove () {}

mark-pssw-add () {
  echo -e "Add new passw."
  ROOT="$HOME/$MARK_FEC"
  FILE="$ROOT/.psw"
  PWD=`pwd`
  cd $ROOT
  if [ -d  $ROOT ]; then
      if [ -f  $FILE ]; then
          echo "Passw file found."

      else
          touch ${FILE}
          echo "Passw file init."
      fi
      echo "Password:"
      read -s pssw
      echo "$1 $pssw " >> ${FILE}.secret
      mv ${FILE} ${FILE/./}
      mark-encode-local ${FILE}.secret $FILE
      mark-cleanup-hidden
      echo "Cleaned."
      cd $PWD
  fi

}
