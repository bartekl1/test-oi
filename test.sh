#!/bin/bash

exe_path=$1
tests_path=$2

if [[ -z "$exe_path" || -z "$tests_path" ]]; then
    echo "Usage: test.sh <exe_path> <tests_path>"
    exit 1
fi

tests=0
passed=0

for test_in in "$tests_path"/*.in; do
    output=$($exe_path < $test_in)
    test_out=$(basename -- "$test_in")
    testname="${test_out%.*}"
    test_out="$(dirname "$test_in")/$testname.out"

    echo -n "$testname: "

    ((tests++))
    if [ "$(cat $test_out)" = "$output" ]; then
        echo "✅ PASSED"
        ((passed++))
    else
        echo "❌ FAILED"
    fi
done

percentage=$(echo "($passed)*100/$tests" | bc)

echo -e "\n$percentage% tests passed"
