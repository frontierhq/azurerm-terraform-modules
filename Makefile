generate_readme:
	pipenv run python scripts/generate_readme.py $(branch)

install:
	pipenv install --dev
	pipenv run pre-commit install

install_ci:
	pipenv sync

lock_providers:
	pipenv run python scripts/lock_providers.py

test: test.lint test.script

test.lint:
	pipenv run flake8 scripts
	pipenv run yamllint .

test.script:
	pipenv run python scripts/test.py
