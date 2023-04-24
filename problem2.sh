#!/bin/bash

declare -A results

numbers=(1 2 3 4 5 6)

while true
do
  
  roll=$((RANDOM%6+1))

  if [[ -v results[$roll] ]]
  then
    results[$roll]=$((results[$roll]+1))
  else
    results[$roll]=1
  fi

  for number in "${numbers[@]}"
  do
    if [[ ${results[$number]} -ge 10 ]]
    then
      echo "Number $number has been rolled ${results[$number]} times."
      break 2
    fi
  done
done


