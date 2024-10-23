#!/bin/bash

exe_path=$1
tests_path=$2

if [[ -z "$exe_path" || -z "$tests_path" ]]; then
    echo "Usage: test.sh <exe_path> <tests_path>"
    exit 1
fi

tests=0
passed=0

abort_testing() {
    echo -ne "\n🛑 Received SIGINT, testing aborted"
    finish_testing
}

finish_testing() {
    percentage=$(echo "($passed)*100/$tests" | bc)

    if [ $tests = $passed ]; then
        echo -ne "\n✅"
    else
        echo -ne "\n❌"
    fi
    echo -e " $passed of $tests ($percentage%) tests passed"
    
    if [ $tests = $passed ]; then
        exit 0
    else
        exit 1
    fi
}

trap abort_testing SIGINT

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

finish_testing
