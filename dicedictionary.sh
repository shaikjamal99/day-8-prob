

declare -A roll_results

# Roll the die and store the result in the dictionary
while true; do
    roll=$(( RANDOM % 6 + 1 ))  # Generate a random number between 1 and 6
    if [[ ${roll_results[$roll]+_} ]]; then
        roll_results[$roll]=$(( roll_results[$roll] + 1 ))  # Increment the count for this number
    else
        roll_results[$roll]=1  # Initialize the count for this number to 1
    fi
    if (( roll_results[$roll] == 10 )); then
        break  # Exit the loop once any number has been rolled 10 times
    fi
done

# Find the number that was rolled the maximum and minimum times
max_rolls=0
min_rolls=10
for roll in "${!roll_results[@]}"
do
    if (( roll_results[$roll] > max_rolls )); then
        max_rolls=${roll_results[$roll]}
        max_roll=$roll
    fi
    if (( roll_results[$roll] < min_rolls )); then
        min_rolls=${roll_results[$roll]}
        min_roll=$roll
    fi
done

# Print the results
echo "Results:"
for roll in "${!roll_results[@]}"
do
    echo "$roll: ${roll_results[$roll]}"
done
echo "The number that was rolled the maximum times is $max_roll ($max_rolls rolls)"
echo "The number that was rolled the minimum times is $min_roll ($min_rolls rolls)"
