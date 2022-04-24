#!/usr/bin/python3

# libs
from os import system

# function for read branch name
def read_branch_name(message:str):

    # define variable and read result to time when user input dont have spaces and size more like 0 chars
    user_input:str = ""
    while len(user_input) == 0 or " " in user_input:
        user_input = input(message + " ")

    # return message
    return user_input

# function for read commit description
def read_commit_description(message:str):
    # define variable and read user input
    user_input:str = ""
    while len(user_input) == 0:
        user_input = input(message + " ")

    # return message
    return user_input

# method for check exit input
def check_for_exit(user_input: str):
    if user_input.lower() == "exit":
        return True
    else:
        return False

# main script application
def main():

    # read branch name 
    branch_name = read_branch_name("Branch name:").strip(" ")

    # check for exit
    if check_for_exit(branch_name): return 1

    # read commit description
    commit_description = read_commit_description("Commit:").strip(" ")
    # check for exit
    if check_for_exit(commit_description): return 1

    # make git commands
    system("git branch %s" % (branch_name))
    system("git checkout %s" % (branch_name))
    system("git add .")
    system("git commit -m '%s'" % (commit_description))
    system("git push")


# start app
main()
