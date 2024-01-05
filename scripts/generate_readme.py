import logging
import jinja2
import os
import sys
from helpers.exec import exec
from packaging.version import Version


def get_tags():
    return exec("git", "tag", "--merged", sys.argv[1], silent=True).stdout.splitlines()


def get_modules(tags):
    modules = []
    for dir in [f.path for f in os.scandir(os.path.join(os.getcwd(), "modules")) if f.is_dir()]:
        module_name = os.path.basename(dir)
        module_tags = list(filter(lambda tag: tag.startswith(module_name), tags))

        if len(module_tags) == 0:
            continue

        module_versions = list(map(lambda tag: Version(tag.split("/")[1]), module_tags))
        module_versions.sort(reverse=True)

        modules.append({"name": module_name, "version": module_versions[0]})

    modules.sort(key=lambda module: module["name"])

    return modules


def generate_readme():
    logging.info("Fetching module information")

    tags = get_tags()
    modules = get_modules(tags)

    for module in modules:
        logging.debug(f"{module['name']}: {module['version']}")

    environment = jinja2.Environment(
        keep_trailing_newline=True,
        loader=jinja2.FileSystemLoader(os.getcwd()),
    )

    template = environment.get_template("README.rst.j2")
    content = template.render({"modules": modules})

    logging.info("Content generated")

    readme_path = os.path.join(os.getcwd(), "README.rst")
    with open(readme_path, mode="w", encoding="utf-8") as readme:
        readme.write(content)
        logging.info(f"{readme_path} written")


if __name__ == "__main__":
    logging.Logger.setLevel(logging.getLogger(), logging.DEBUG)

    generate_readme()
