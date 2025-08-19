This repository maintains research notes, logs, and resources related to automated unit test generation using Large Language Models (LLMs).
#### The focus is on Go projects

## Research Goals

* Investigate LLM-based approaches for **unit test generation in Go**.
* Construct a **Go-specific dataset** of real-world, high-complexity functions.
* Explore **context-aware and state-aware test generation**.
* Benchmark LLM-generated tests against existing tools and metrics.

## Progress So Far
- Surveyed Existing Tools: 
  - [**TestPilot**](.TestPilot.md)
  - [**HITS**](.HITS.md)
  - [**LLMs for AUTG**](.LLMs-for-AUTG.md)
  - [**AgoneTest**](.AgoneTest.md)
  - [**TestGen-LLM**](.TestGen-LLM.md)
  - [**Less Is More**](.Less-Is-More.md)
  - [**RATester**](.RATester.md)
  - [**nxt_unit**](.nxt_unit.md)
  - [**LSPAI**](.LSPAI.md)


## Observations

* Java & Kotlin have well-established datasets and frameworks.
* Go is underexplored
* ULT (Unit-Level Test) approaches exist for Python, but we need **ULT-Go**:
  * Real-world Go functions.
  * High cyclomatic complexity.
  * No test leakage.


## Dataset Construction (Go)

* Focus on **real-world Go functions**.
* Include functions with **high cyclomatic complexity**.
* Ensure **no test leakage** between training/evaluation sets.



## References

* [TestPilot](https://github.com/neu-se/testpilot2)
* [ChatUniTest](https://github.com/ZJU-ACES-ISE/ChatUniTest)
* [LLM4UT](https://github.com/LeonYang95/LLM4UT)
* [nxt_unit](https://github.com/bytedance/nxt_unit)