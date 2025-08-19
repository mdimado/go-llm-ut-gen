# TestGen-LLM

- Automated unit test improvement tool for Kotlin test classes at Meta.
- Focuses on extending existing human-written tests.
- Uses internal Meta LLMs (LLM1, LLM2).
- Measurable improvement and non-regression guarantees.

## Multi-stage Filtering Pipeline

- Builds filter: test must compile.
- Passes filter: must pass reliably.
- Flaky filter: must pass 5/5 times.
- Coverage filter: must improve over existing tests.

- Part of Assured LLMSE (Assured LLM-based Software Engineering).
- Outputs only verifiably useful test improvements.
- Supports ensemble approach (combining multiple LLMs/prompts).