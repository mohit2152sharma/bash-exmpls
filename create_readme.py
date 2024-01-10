import os


def get_md_files():
    return [
        f for f in os.listdir(".") if f.endswith(".md") and not f.startswith("README")
    ]


def create_content(files):
    cntnt = []
    for file in files:
        with open(file, "r") as f:
            txt = f.read()
            heading = txt.splitlines()[0].split("#")[-1].strip()
            cntnt.append((heading, txt.strip()))

    return cntnt


def create_readme(cntnt):
    sting = "# Bash Examples\n"
    for h, t in cntnt:
        sting += f"\n\n<details>\n\n<summary>{h}</summary>\n\n{t}\n\n</details>"

    with open("README.md", "w") as f:
        f.write(sting)


if __name__ == "__main__":
    files = get_md_files()
    cntnt = create_content(files)
    create_readme(cntnt)
