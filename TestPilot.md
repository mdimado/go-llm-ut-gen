# TestPilot

- Automated unit test generation tool for JS and TS npm packages.
- Research tool that uses LLMs to automatically write unit tests.
- Training data or example tests not required.
- Analyzes code (find exported functions that need testing).
- Generates test code (based on documentation, function signatures, usage examples).
- Validates the test by running them.
- Iteratively improves failed tests by refining the prompt.
- Designed to explore how LLMs can be used for automated test generation.

## Workflow

- TestGenerator instance is initialized with all functions, temperatures, LLM model, validator, result collector.
- For each function, `generateAndValidateTests()` is called.
- Iterates through different temperature settings to control LLM randomness for various responses.
- Maintains a worklist of prompts, starting with a base prompt and adding refined versions based on test outcomes.
- Prompt → completions.
- Generated tests (both unit and suites) are extracted using the `extractTestFromCompletion` function.
- Based on the test outcomes, prompt is restructured/refined:
  - `SnippetIncluder` - adding usage examples.
  - `RetryWithError` - adding error messages from failed test cases.
  - `DocCommentIncluder` - adding function documentation.
  - `FunctionBodyIncluder` - add actual function implementation.
- Once passing test case is generated, it stops for that temperature.
- Test results, prompt information, and performance metrics are recorded.
