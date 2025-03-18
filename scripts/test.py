import os
from helpers.test_terraform import test_terraform


if __name__ == "__main__":
    for dir in sorted(
        [f.path for f in os.scandir(os.path.join(os.getcwd(), "modules")) if f.is_dir()]
    ):
        test_terraform(os.path.join(dir, "src"), False)
        test_terraform(os.path.join(dir, "test"))
