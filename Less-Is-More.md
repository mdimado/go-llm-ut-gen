# Less Is More

- Cleans two datasets to achieve better results for testcase generation.
- Uses a three-filter approach:
  - **Syntax Filter**: Removes noisy code using AST and heuristic rules.
  - **Relevance Filter**: Ensures test cases match the target focal method.
  - **Coverage Filter**: Uses a model (CodeGPT) to predict and retain high-branch coverage pairs.
- Only Java datasets (Methods2Test and Atlas) are used.

- Couldn’t find a dataset consisting of test cases for Go.
- Suggestion: Extend the study to Go (create dataset and apply filters).
