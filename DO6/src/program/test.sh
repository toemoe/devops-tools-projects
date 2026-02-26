#!/bin/bash

PROG="./DO"
FAIL=0

run_test() {
    expected_code=$1
    shift
    expected_output="$1"
    shift
    args=("$@")

    echo "Running test with arguments: ${args[*]}"
    output=$($PROG "${args[@]}" 2>&1)
    code=$?
    echo "Output: $output"
    echo "Exit code: $code"

    if [[ "$output" != "$expected_output" ]]; then
        echo "FAIL: Arguments: ${args[*]}"
        echo "  Expected output: '$expected_output'"
        echo "  Got: '$output'"
        FAIL=1
    fi

    if [[ $code -ne $expected_code ]]; then
        echo "FAIL: Arguments: ${args[*]}"
        echo "  Expected exit code: $expected_code"
        echo "  Got: $code"
        FAIL=1
    fi
}

run_test 0 "Learning to Linux" 1
run_test 0 "Learning to work with Network" 2
run_test 0 "Learning to Monitoring" 3
run_test 0 "Learning to extra Monitoring" 4
run_test 0 "Learning to Docker" 5
run_test 0 "Learning to CI/CD" 6

run_test 2 "Bad number!" 0
run_test 2 "Bad number!" 10
run_test 2 "Bad number!" abc

run_test 1 "Bad number of arguments!"
run_test 1 "Bad number of arguments!" 1 2

if [ $FAIL -eq 0 ]; then
    echo "All tests passed!"
else
    echo "Some tests failed."
    exit 1
fi
