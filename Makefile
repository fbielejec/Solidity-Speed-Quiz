.PHONY: help
help: # Show help for each of the Makefile recipes
	@grep -E '^[a-zA-Z0-9 -]+:.*#'  Makefile | sort | while read -r l; do printf "\033[1;32m$$(echo $$l | cut -f 1 -d':')\033[00m:$$(echo $$l | cut -f 2- -d'#')\n"; done

.PHONY: anvil
anvil: # Start Anvil local node
	@echo "Starting Anvil local Ethereum node..."
	anvil

.PHONY: compile
compile: # Compile smart contracts
	@echo "Compiling contracts..."
	forge build

.PHONY: watch
watch: # Auto-compile contracts on file changes
	@echo "Watching for file changes..."
	forge build --watch

.PHONY: clean
clean: # Clean build artifacts
	@echo "Cleaning build artifacts..."
	forge clean

.PHONY: fmt
fmt: # Format Solidity files
	@echo "Formatting Solidity files..."
	forge fmt

.PHONY: test-remove-element
test-remove-element: # Excercise 1
	forge test --match-test "test_removeElement" --match-contract RemoveElement

.PHONY: test-string-concat
test-string-concat: # Excercise 2
	forge test --match-test "test_StringConcat"

.PHONY: test-string-compare
test-string-compare: # Excercise 3
	forge test --match-test "test_StringCompare"

.PHONY: test-memory-array
test-memory-array: # Excercise 4
	forge test --match-test "test_MemoryArray"

.PHONY: test-bytes
test-bytes: # Excercise 5
	forge test --match-test "test_Bytes"

.PHONY: test-string-index
test-string-index: # Excercise 6
	forge test --match-test "test_StringIndex"

.PHONY: test-is-first-bit-set
test-is-first-bit-set: # Excercise 7
	forge test --match-test "test_IsFirstBitSet"

.PHONY: test-convert-to-negative
test-convert-to-negative: # Excercise 8
	forge test --match-test "test_convertToNegative"

.PHONY: test-multiplication
test-multiplication: # Excercise 9
	forge test -vv --match-test "test_multiply_case"

.PHONY: test-multiply-constant
test-multiply-constant: # Excercise 10
	forge test -vv --match-test "test_multiply_constant"

.PHONY: test-div-up
test-div-up: # Excercise 11
	forge test -vv --match-test "test_divUp"

.PHONY: test-is-99-percent
test-is-99-percent: # Excercise 12
	forge test -vv --match-test "test_is99Percent"

.PHONY: test-rational-function
test-rational-function: # Excercise 13
	forge test -vv --match-test "test_rationalFunction"

.PHONY: test-try-catch-simple
test-try-catch-simple: # Excercise 14
	forge test -vv --match-test "test_TryCatchSimple"

.PHONY: test-try-catch-reason
test-try-catch-reason: # Excercise 15
	forge test -vv --match-test "test_TryCatchReason"

.PHONY: test-read-struct
test-read-struct: # Excercise 16
	forge test -vv --match-test "test_ReadStruct"

.PHONY: test-bad-bank
test-bad-bank: # Excercise 17
	forge test -vv --match-test "test_RobTheBank"

.PHONY: test-is-contract
test-is-contract: # Excercise 18
	forge test -vv --match-test "test_isContract"

.PHONY: test-account-maker
test-account-maker: # Excercise 19
	forge test -vv --match-test "test_accountMaker"

.PHONY: test-low-level
test-low-level: # Excercise 20
	forge test -vv --match-test "test_LowLevel(Success|Revert)"

.PHONY: test-low-level-args1
test-low-level-args1: # Excercise 22
	forge test -vv --match-test "test_LowLevelArgs1"
