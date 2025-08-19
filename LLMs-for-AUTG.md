# LLMs for AUTG

- Evaluating the effectiveness of open-source LLMs in automatically generating unit tests for Java methods.
- Compares generated unit tests against baseline approaches (EvoSuite).

## Workflow

- Prompt generation component creates structured prompts for LLMs based on Java code analysis (comment, natural).
- Evaluation system compiles and executes generated tests.
- Compilation success, execution validity, and coverage metrics are measured.
- Engine performs iterative compilation until success.
- A parallel baseline system generates and evaluates EvoSuite tests for comparison.
- Parallel test generation across multiple Defects4J projects.
- Processes coverage reports for fair comparison with LLM-generated tests.
- It processes approximately 1,600 Defects4J project checkouts through a parallel evaluation pipeline.