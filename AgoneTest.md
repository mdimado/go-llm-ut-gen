# AgoneTest

- Framework designed to automatically generate and assess unit test suites for Java projects using LLMs.
- Focuses on class-level test generation (vs method-level).
- Fully automates the test generation-evaluation pipeline.
- Uses CLASSES2TEST dataset (annotated 9,410 Java repos).
- Supports multiple LLMs and prompting techniques (zero-shot, few-shot).
- Auto-extracts context (Java version, test framework) from build files (Maven/Gradle).
- Test generation via prompts instantiated with repo-specific context.

## Test Evaluation

- JaCoCo (coverage metrics: instruction, line, branch, method)
- PiTest (mutation coverage)
- TSDetect (20+ test smells like Assertion Roulette, Lazy Test, etc.)

- Supports 100+ LLMs via LiteLLM.
- Automates library integration and config edits (e.g., adding PiTest plugin for JUnit5).
- Generates detailed CSV reports for each LLM + prompt combo.
- Experiments show ~75% generated tests compile; ~34% pass all tests.
- Human-written tests still outperform LLMs in mutation coverage.
- Zero-shot with GPT-4 gave best coverage metrics in experiment.
- Aims to help test engineers find optimal LLM + prompt setup.
- Limitations: Java-only, compilation failures, limited model/prompt variety in study.