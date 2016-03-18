if grep -q "$1" "$2"; 
then
  echo "file has the args"
else
  echo "$1" >> "$2"
fi
