#!/bin/bash

PROJECT_PATH=${1:-.}
OUTPUT_FILE="high_complexity_no_tests.csv"

echo "Analyzing Go project at: $PROJECT_PATH"

# check if gocyclo is installed
if ! command -v gocyclo &> /dev/null; then
    echo "gocyclo not found. Installing..."
    go install github.com/fzipp/gocyclo/cmd/gocyclo@latest
fi

echo "Package,Function,File,Line,Complexity,HasTest" > "$OUTPUT_FILE"

# get high complexity functions >10
gocyclo -over 10 "$PROJECT_PATH" | while read -r complexity func_name file_line; do
    [[ -z "$complexity" ]] && continue
    
    # Extract file and line number
    file=$(echo "$file_line" | cut -d':' -f1)
    line_num=$(echo "$file_line" | cut -d':' -f2)
    
    # skip if not a .go file or if test file
    [[ "$file" != *.go ]] && continue
    [[ "$file" == *_test.go ]] && continue
    
    if [[ "$func_name" == *.* ]]; then
        package=$(echo "$func_name" | cut -d'.' -f1)
        function=$(echo "$func_name" | cut -d'.' -f2-)
    else
        package="main"
        function="$func_name"
    fi
    
    # check for corresponding test file
    test_file="${file%%.go}_test.go"
    has_test="false"
    
    if [[ -f "$test_file" ]]; then
        # remove receiver syntax
        clean_func=$(echo "$function" | sed 's/^(\*\?[^)]*)\.//' | sed 's/^[*]*//')
        
        # look for test function that references this function
        if grep -q "Test.*$clean_func\|func.*Test\|$clean_func" "$test_file" 2>/dev/null; then
            has_test="true"
        fi
    fi
    
    # only include functions without tests
    if [[ "$has_test" == "false" ]]; then
        echo "$package,$function,$file,$line_num,$complexity,false" >> "$OUTPUT_FILE"
    fi
done

result_count=$(( $(wc -l < "$OUTPUT_FILE") - 1 ))
echo "Found $result_count functions with complexity > 10 and no tests"
echo "Results saved to: $OUTPUT_FILE"
if [[ $result_count -gt 0 ]]; then
    echo -e "\nResults:"
    cat "$OUTPUT_FILE" | column -t -s',' | head -n 10
fi