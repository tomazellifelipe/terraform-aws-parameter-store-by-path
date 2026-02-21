<!-- BEGIN_TF_DOCS -->
# parameter-store-by-path

Return values from AWS Parameter Store using by path data block in a friendly formatted way.

## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >=1.3 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | ~> 6.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | ~> 6.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_ssm_parameters_by_path.parameters](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/ssm_parameters_by_path) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_path"></a> [path](#input\_path) | Prefix path of the parameter(s) to retrive. | `string` | n/a | yes |
| <a name="input_recursive"></a> [recursive](#input\_recursive) | Whether to retrieve all parameters under the path recursively. | `bool` | `false` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_sensitive_values"></a> [sensitive\_values](#output\_sensitive\_values) | Parameter store secure values by path. |
| <a name="output_values"></a> [values](#output\_values) | Parameter store values by path. |

---
by @tomazellifelipe
<!-- END_TF_DOCS -->

## Local Development Setup

This project uses [Husky](https://typicode.github.io/husky/) to run Git hooks that enforce code quality and commit message standards.

### Prerequisites

- [Node.js](https://nodejs.org/) (LTS recommended)
- [pnpm](https://pnpm.io/) `9.14.2` (declared via `packageManager` in `package.json`)
- [OpenTofu](https://opentofu.org/) (for Terraform format and validation checks)

### Installing Git Hooks

After cloning the repository, install dependencies to activate the hooks:

```sh
pnpm install
```

This runs the `prepare` script, which executes `husky` and configures the local Git hooks automatically.

### Git Hooks

| Hook | Purpose |
|------|---------|
| `commit-msg` | Validates commit messages with [commitlint](https://commitlint.js.org/) against the [Conventional Commits](https://www.conventionalcommits.org/) specification. |
| `pre-commit` | Runs `tofu fmt -check`, `tofu init -backend=false`, and `tofu validate` on staged `.tf` files. |

#### Commit Message Rules

Commit messages must follow the format `type(scope): subject` with a maximum header length of **50 characters**.

Allowed types: `feat`, `fix`, `refactor`, `docs`, `chore`, `ci`, `perf`, `test`, `revert`, `build`, `style`.

Example:

```
feat(config): add recursive parameter option
```

## Release Process

Releases are fully automated using [Release Please](https://github.com/googleapis/release-please) via the `.github/workflows/release-please.yml` workflow.

### How It Works

1. Every push to `main` triggers the [Release Please Action](https://github.com/googleapis/release-please-action) (`v4`).
2. Release Please analyzes commit messages since the last release and determines the next [Semantic Version](https://semver.org/) based on the Conventional Commits types:
   - `fix` commits bump the **patch** version (e.g., `1.0.0` -> `1.0.1`).
   - `feat` commits bump the **minor** version (e.g., `1.0.0` -> `1.1.0`).
   - **Breaking changes** (commits with `BREAKING CHANGE` footer or `!` after the type) bump the **major** version (e.g., `1.0.0` -> `2.0.0`).
3. It opens (or updates) a **release PR** that contains a generated changelog.
4. When the release PR is merged, Release Please creates a **GitHub release** with the corresponding Git tag.

The `release-type` is set to `terraform-module`, which follows the versioning conventions expected by the [Terraform Registry](https://registry.terraform.io/).

### PR Title Validation

Pull request titles are validated by the `.github/workflows/lint-pr.yml` workflow using [action-semantic-pull-request](https://github.com/amannn/action-semantic-pull-request). This ensures PR titles also follow the Conventional Commits format, which is important when using squash merges since the PR title becomes the commit message on `main`.