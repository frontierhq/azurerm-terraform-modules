# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Repository Overview

This is a collection of independently versioned Terraform modules for Azure (AzureRM provider). Each module is designed for composition and follows standardized naming/tagging conventions, with a secure-by-default approach.

## Architecture

### Module Structure

Each module in `modules/` follows a standardized layout:

```
modules/<module-name>/
├── CHANGELOG.md       # Module-specific changelog
├── README.md          # Module documentation
├── VERSION            # Major.minor version (e.g., "2.0")
├── src/               # Module source code
│   ├── main.tf        # Primary resource definitions
│   ├── variables.tf   # Input variables
│   ├── outputs.tf     # Output values
│   ├── locals.tf      # Local values
│   ├── terraform.tf   # Provider/version requirements
│   └── data.tf        # Data sources (when needed)
└── test/              # Test configuration
    ├── main.tf        # Test module instantiation
    └── terraform.tf   # Test requirements
```

### Naming and Tagging Conventions

All modules implement a standardized naming pattern:
- Resources use: `{type}-{zone}-{environment}-{location_short}-{identifier}`
- Example: `rg-shd-dev-uks-k8s` (resource group in shared/dev/uksouth)
- Common variables across all modules: `environment`, `zone`, `location`, `identifier`, `tags`
- Location abbreviations defined in `locals.tf` (e.g., "uksouth" → "uks", "ukwest" → "ukw")
- Auto-injected tags: `Environment`, `Location`, `Zone` (in addition to user-provided tags)
- The `identifier` is sanitized to remove non-alphanumeric characters (except hyphens/numbers)

### Module Versioning

- Each module has independent semantic versioning
- Version tracked in `modules/<name>/VERSION` file (major.minor format)
- Full versions tagged as `<module-name>/<version>` (e.g., `resource-group/2.0.1`)
- Automated tagging via `vertag` tool in CI pipeline
- Modules are released as tarballs accessible via GitHub releases

### Provider Requirements

- Terraform version: `~> 1.11` (as specified in `.tfswitchrc`)
- AzureRM provider: `~> 4.23`
- Updated from Terraform 1.5 and AzureRM 3.x in version 2.0 of most modules

## Development Commands

### Setup

```bash
make install          # Install dependencies (uv sync + pre-commit hooks)
```

### Testing

```bash
make test             # Run all tests (lint + script tests)
make test.lint        # Run all linting (Python + YAML)
make test.lint.python # Lint Python scripts with ruff
make test.lint.yaml   # Lint YAML files with yamllint
make test.script      # Run Terraform validation/format checks on all modules
```

The test script (`scripts/test.py`) validates both `src/` and `test/` directories for each module.

### Provider Management

```bash
make lock_providers   # Update .terraform.lock.hcl files for all module tests
```

Runs `scripts/lock_providers.py` which locks providers for each module's test configuration.

### README Generation

```bash
make generate_readme branch=<branch-name>  # Regenerate README.rst from template
```

Generates README.rst from README.rst.j2 template using module versions from git tags on the specified branch.

### Cleanup

```bash
make clean            # Remove all .terraform directories
make delete_lockfiles # Remove all .terraform.lock.hcl files
```

## Python Environment

- Uses `uv` for Python dependency management
- Python 3.11+ required (see `pyproject.toml`)
- Key dependencies: `jinja2`, `packaging`, `python-terraform`, `py-utils` (custom utility library)
- Development dependencies: `pre-commit`, `ruff`, `yamllint`

## CI/CD

- **Build workflow**: Runs on all PRs/pushes - validates and tests all modules
- **Tagging workflow**: Automated via `vertag` tool - creates module-specific tags based on VERSION files and CHANGELOG.md changes
- **Release workflow**: Publishes module tarballs to GitHub releases
- **README generation**: Auto-updates README.rst when tags change on main branch

## Key Design Patterns

1. **Module Composition**: Modules are designed to be composed together, not used in isolation
2. **Secure by Default**: Security best practices are baked into module defaults
3. **Diagnostic Settings**: Modules include Azure Monitor Diagnostic Settings where applicable
4. **Independent Releases**: Each module can be updated/released without affecting others
5. **Test Configurations**: Each module includes a working test configuration demonstrating usage

## Working with Modules

When creating or modifying modules:

1. Always update the VERSION file if making breaking changes (increment major) or adding features (increment minor)
2. Document changes in the module's CHANGELOG.md
3. Ensure both `src/` and `test/` directories validate with `make test`
4. Follow the standardized variable pattern (`environment`, `zone`, `location`, `identifier`, `tags`)
5. Include appropriate outputs in `outputs.tf` (typically resource ID and name)
6. Lock providers after changes: `make lock_providers`
