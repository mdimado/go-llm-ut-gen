# LSPAI

- Real-time multi-language unit test generation tool via LSP.
- Problem with existing LLM-based tools:
  - Don’t support multi-language test generation.
  - Don’t support real-time test generation (require full compilation).

## Working

- Extracts key tokens like arguments and return values from the target method.
- Uses LSP to retrieve definitions and summarize relevant code elements.
- Collects real usage examples of the method for better context.
- Constructs an LLM prompt combining method, dependencies, and references.
- Runs LSP checks on generated test code to detect errors without execution.
- If errors exist, retrieves more info and regenerates or fixes the test code.
- Available as an IDE plugin (try the VS Code extension).