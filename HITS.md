# HITS

- Method for generating Java unit tests using large language models.
- Targeting complex methods.
- Existing methods (ChatUniTest, ChatTester) feed the entire method to the LLM and so LLMs struggle to infer the diverse input combinations needed to cover all paths.

## Core Idea

- Decompose the method into logical slices using the LLM.
- A structured JSON is retrieved as output from the LLM containing all the slices and their description.
- Test case per slice is generated.
- Merge the generated test cases.
- Validate and fix broken test cases using LLM.
- Format outputs, fix common issues.
- Combine valid slice-based tests into a suite.

- Benchmarked on 10 real-world Java projects.
- Achieves significantly better coverage (10–20% gains) on complex methods.
- Demonstrates superior performance over both LLM and non-LLM baselines.