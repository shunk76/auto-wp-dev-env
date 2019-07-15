TYPE=$1

if [ $# -eq 1 ]; then
  while [ $TYPE != theme ] && [ $TYPE != plugin ]
  do
    echo '引数に theme か plugin を指定してください。'
    read -p 'theme or plugin ?:' TYPE
  done

  if [ $TYPE = theme ]; then
  echo "1theme"
  fi

  if [ $TYPE = plugin ]; then
  echo "2plugin"
  fi

else 
  echo '引数に theme か plugin を指定してください。'
fi

