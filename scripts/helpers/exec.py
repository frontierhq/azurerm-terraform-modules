import subprocess


def exec(*args: [], silent: bool = False, **kwargs):
    process = subprocess.run(
        args=args,
        stdout=subprocess.PIPE,
        universal_newlines=True,
        **kwargs,
    )

    if not silent:
        print(process.stdout)

    if process.returncode != 0:
        raise Exception(f"Command failed with exit code {process.returncode}")

    return process


def _test():
    raise NotImplementedError


if __name__ == "__main__":
    _test()
