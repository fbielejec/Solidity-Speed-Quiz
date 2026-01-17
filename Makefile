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
