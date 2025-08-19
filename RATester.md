# RATester

- Improves LLM-generated unit tests by reducing hallucinations through injection of precise repository-level context.
- Injects necessary and relevant information from a code repository to help the model correctly understand and generate code.
- Aims to reduce hallucinations, such as:
  - Calling non-existent methods.
  - Passing wrong parameters or types.
  - Missing necessary context beyond the focal method.
- Injects precise global context into prompts using gopls (Go language server).

## Architecture

- **Fetcher**: Uses gopls to fetch definitions and documentation.
- **Formulator**: Builds a prompt template.
- **Generator**: Uses an LLM to generate tests incrementally.

- gopls is queried live, increasing latency.
- Pre-index the repository context for efficiency.
