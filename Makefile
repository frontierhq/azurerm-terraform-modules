.DEFAULT_GOAL := install

clean:
	find . -type d -name ".terraform" -exec rm -rf "{}" \+

delete_lockfiles:
	find . -name ".terraform.lock.hcl" -exec rm -rf "{}" \+

generate_readme:
	uv run python scripts/generate_readme.py $(branch)

install:
ifeq ($(CI),true)
	uv sync --frozen
else
	uv sync
	uv run pre-commit install
endif

lock_providers:
	uv run python scripts/lock_providers.py

test: test.lint test.script

test.lint: test.lint.python test.lint.yaml

test.lint.python:
	uv run ruff check scripts
	uv run ruff format --check --diff scripts

test.lint.yaml:
	uv run yamllint .

test.script:
	uv run python scripts/test.py
