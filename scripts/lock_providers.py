import os
from helpers.lock_terraform_providers import lock_terraform_providers

if __name__ == "__main__":
    for dir in [f.path for f in os.scandir(os.path.join(os.getcwd(), "modules")) if f.is_dir()]:
        lock_terraform_providers(os.path.join(dir, "test"))
