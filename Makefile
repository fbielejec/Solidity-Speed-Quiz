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

.PHONY: test-remove-element
test-remove-element: # Excercise 1
	forge test --match-test "test_removeElement" --match-contract RemoveElement

.PHONY: test-string-concat
test-string-concat: # Excercise 2
	forge test --match-test "test_StringConcat"

.PHONY: clean
clean: # Clean build artifacts
	@echo "Cleaning build artifacts..."
	forge clean

.PHONY: fmt
fmt: # Format Solidity files
	@echo "Formatting Solidity files..."
	forge fmt
