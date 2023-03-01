from sys import argv
from os import popen
from os import system
from datetime import datetime


def get_packages_list(text:str) -> list[str]:
    out_lines = []
    file = text.split("\n")

    for line in file:
        out_lines.append(line.split("/")[0])
    
    return out_lines

def load_installed_packages() -> list[str]:
    text = popen("apt list --installed").read()
    return get_packages_list(text)[1:]

def load_dump_packages(file_name: str) -> list[str]:
    text = ""
    with open(file_name) as fstream:
        text = fstream.read()
    return text.split("\n")
    

def save_packages_to_file(file_name: str = None):
    if not file_name:
        n = datetime.now()
        file_name = f"{n.year}-{n.month}-{n.day}_{n.hour}.{n.minute}.txt"
    
    with open(file_name, "w") as fstream:
        for line in load_installed_packages():
            fstream.write(f"{line}\n")

def get_difference(dump_file_name:str) -> list[str]:
    installed = load_installed_packages()
    in_file = load_dump_packages(dump_file_name)
    return [package for package in installed if package not in in_file]


# run app in its main package
if __name__ == "__main__":
    if len(argv) < 2:
        print("Missed file name")
        exit(1)

    diff = get_difference(argv[1])

    for package in diff:
        print(package)

    # ask user about action
    print("\n\n\nPres 'A' for purge all from list")
    print("Pres 'S' for select packages for purge")
    print("Any else to exit")

    key = input().lower()

    if key == "a":
        to_delete = " ".join(diff)
        system("sudo apt purge %s" % to_delete)
        system("sudo apt autopurge -y")
    elif key == "s":
        for package in diff:
            print("\n\n Want to delete %s ?" % package)
            if "y" == input("Y / N ").lower():
                system("sudo apt autopurge %s -y" % package)
    
    else:
        exit(0)

