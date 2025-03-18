from python_terraform import IsFlagged, Terraform


def lock_terraform_providers(working_dir: str, **kwargs: dict):
    print(f"locking terraform providers in '{working_dir}'")

    terraform = Terraform(working_dir=working_dir)
    return_code, _, _ = terraform.cmd(
        "providers lock",
        platform=["darwin_arm64", "linux_amd64"],
        enable_plugin_cache=IsFlagged,
        capture_output=False,
    )
    if return_code != 0:
        exit(return_code)


def _test():
    raise NotImplementedError


if __name__ == "__main__":
    _test()
