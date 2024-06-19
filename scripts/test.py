import os
from helpers.test_terraform import test_terraform
from tempfile import TemporaryDirectory


if __name__ == "__main__":
    temp_dir = TemporaryDirectory()

    env = {"TF_PLUGIN_CACHE_DIR": temp_dir.name}
    for dir in [f.path for f in os.scandir(os.path.join(os.getcwd(), "modules")) if f.is_dir()]:
        test_terraform(os.path.join(dir, "src"), False, env=env, lockfile="readonly")
        test_terraform(os.path.join(dir, "test"), env=env, lockfile="readonly")

    temp_dir.cleanup()
