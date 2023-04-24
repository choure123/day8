#!/bin/bash -x

declare -a months=("January" "February" "March" "April" "May" "June" "July" "August" "September" "October" "November" "December")

declare -A birthday

for ((i=0; i<50; i++))
do

  birth_month=${months[$((RANDOM%12))]}
  birth_year=$((RANDOM%2+92))

  if [[ -v birthdays[$birth_month] ]]
  then
    birthdays[$birth_month]+=" $birth_year"
  else
    birthdays[$birth_month]="$birth_year"
  fi
done

for month in "${!birthdays[@]}"
do
  years=(${birthdays[$month]})
  if [[ ${#years[@]} -gt 1 ]]
  then
    echo "Birthdays in $month:"
    for year in "${years[@]}"
    do
      echo "  - 19$year"
    done
  fi
done
