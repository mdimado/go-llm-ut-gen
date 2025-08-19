# LSPAI - Test Results

**Testing with:** goipp

## Function Testing Scenarios

| Scenario | Function | Generated Test Case | Existing Test Case |
|----------|---------|-------------------|------------------|
| Simple function (1–2 args, no deps) | `Version.Major()` | - Verifies core functionality: `Version.Major()` correctly extracts the upper 8 bits using `uint8(v >> 8)`.<br>- Focuses solely on `Version.Major()` using `t.Run()` subtest.<br>- Covers edge cases with raw numeric values (0, 255, 512, 65535) testing bit manipulation logic directly. | - Tests `MakeVersion()`, `Major()`, `Minor()`, and `String()` methods together in a single comprehensive test.<br>- Uses realistic IPP version values (2.0, 2.1, 1.1). |
| Function with struct/class and methods | `NewRequest(version, op, id)` | - Focuses specifically on `NewRequest()` validation.<br>- Detailed table-driven pattern with a `fields` struct to organize inputs.<br>- Manually checks each field (Version, Code, RequestID).<br>- Includes edge cases with zero and minimal non-zero values. | - Tests both `NewRequest()` and `NewResponse()` together.<br>- Uses direct parameter passing and `reflect.DeepEqual()` for comprehensive validation.<br>- Uses realistic values (version 2.0, code 1, request ID 0x12345). |
| Function with dependencies (file/db/http) | `Message.Decode(io.Reader)` | - Basic approach focusing on error handling.<br>- Uses minimal byte arrays not representing valid IPP messages.<br>- Checks for generic `io.ErrUnexpectedEOF`. | - Extensive coverage with realistic IPP protocol data and error scenarios.<br>- Uses actual IPP protocol messages with headers, attribute groups, and binary encoding.<br>- Covers protocol violations like "Message truncated", "Invalid tag 0", and "Attribute without a group".<br>- Uses `testDecode()` helper function for decoding and round-trip encoding validation. |
| Edge case: unused args or overloading | `MakeVersion(major, minor uint8)` | - Focuses specifically on `MakeVersion()` validation.<br>- Table-driven pattern testing only `MakeVersion()`.<br>- Covers a broad range including boundary values (0, 255) and intermediate values (10, 20). | - Comprehensive integration approach testing multiple version functions together (`MakeVersion()`, `Major()`, `Minor()`, `String()`).<br>- Uses realistic IPP version values (2.0, 2.1, 1.1). |

---

## Observations / Questions

- Why version numbers need to be 2.0, 2.1, 1.1 and not 255, 512?  
- How can we generate context-aware / state-aware unit tests (example: `NewRequest()` and `NewResponse()`)?  
- Consult Alexander to understand how context-aware / real scenarios were written in existing unit tests.

---

## LSPAI Analysis

| Aspect | LSPAI Strength | LSPAI Weakness |
|--------|----------------|----------------|
| Unit-level testing | Fine-grained focus | Misses integration context |
| Edge case coverage | Strong | Doesn’t relate to real-world scenarios |
| Dependency-aware functions | — | Lacks depth |
| Protocol-specific behaviors | — | Missed |
| Realistic inputs | — | Often missing |

---

## Failures

- Frequently fails to generate tests.  
- Example: `Version.Major()` function  

```go
// Major returns the major part of version
func (v Version) Major() uint8 {
   return uint8(v >> 8)
}
