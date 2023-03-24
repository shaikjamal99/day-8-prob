

declare -A birthdays_by_month

# Generate birth months for 50 individuals between 1992 and 1993
for (( i=1; i<=50; i++ ))
do
    month=$(( RANDOM % 12 + 1 ))  # Generate a random month between 1 and 12
    year=$(( RANDOM % 2 + 92 ))  # Generate a random year between 92 and 93
    birthday="$month/$year"
    if [[ ${birthdays_by_month[$birthday]+_} ]]; then
        birthdays_by_month[$birthday]+=" Person$i"
    else
        birthdays_by_month[$birthday]="Person$i"
    fi
done

# Print the list of individuals with birthdays in the same month
for month in "${!birthdays_by_month[@]}"
do
    echo "Birthdays in $month: ${birthdays_by_month[$month]}"
done
