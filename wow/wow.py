import os
import sys
import argparse

# some muscle exercizing and scripting for my daily Way-of-Work

def showOverview():
    CMD = "exa -1 --sort=modified"
    returnValue = os.system(CMD)


def showHelp():
    print("Usage:")
    print("------")
    print("default: show this info message.")
    print(" -h : hi-prio actions")
    print(" -n  : now (overview)")
    print(" -p  : projects")
    print(" -c  : cal(endar) files")

def actOn(argv):
    opt = argv[1]
    if opt == '-n':
        return showOverview()
    if opt == '-p':
        return choose_project()
    if opt == '-c':
        return showCalendar()

def read_file_into_list(aFile):
    lines = []
    # Open the file and read its contents
    with open(aFile, 'r') as file:
        for line in file.read().split('\n'):
            lines.append(line)
    return lines


def copy_sh_cmd_in_buffer(command):
    # copy CMD in buffer, because cannot easy 'cd' from python-script.
    print(f'Command will be copied into paste buffer: "{command}"')
    #print(f'echo "{command}" | pbcopy')
    os.system(f'echo "{command}" | pbcopy')

def get_projects_file():
    return "/Users/croc02/Downloads/_projects.yaml"

def choose_project():
    options = read_file_into_list(get_projects_file())
    print("Please choose an option:")

    for i, option in enumerate(options):
        print(f"{i}. {option}")

    choice = input("Enter your choice: ")

    # Validate and respond to the choice
    try:
        choice = int(choice)
        if 0 <= choice < len(options):
            print(f"You chose {options[choice]},  will be copied into buffer!")
            CMD = f"cd {options[choice]}"
            copy_sh_cmd_in_buffer(CMD)
        else:
            print("Invalid choice, please choose an existing project.")
    except ValueError:
        print("Please enter a numerical value.")

def showCalendar():
    CMD = "ls ~/Downloads/ | grep -i '^cal'"
    returnValue = os.system(CMD)
    

if __name__ == "__main__":
    CMD = "clear"
    returnValue = os.system(CMD)

    print(f"Arguments count: {len(sys.argv)}")
    for i, arg in enumerate(sys.argv):
        print(f"{i:>6}: {arg}")

    print(f"--------------------------")
    if len(sys.argv) > 1:
        actOn(sys.argv)
    else:
        showHelp()

