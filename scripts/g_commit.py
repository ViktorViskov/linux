#!/usr/bin/python3
# libs
from os import system

# 
# simple script to make git commit in branch som in root folder
# 

# main function
def main():
    # read user message
    user_message = read_commit_description("Commit description:")

    # make commit and push
    system("git add .")
    system("git commit -m '%s'" % (user_message))
    system("git push")

# function for read user input only one word
def read_commit_description(message:str):
    # define variable and read result to time when user input dont have spaces and size more like 0 chars
    user_input:str = ""
    while len(user_input) == 0:
        user_input = input(message + " ")

    # return message
    return user_input


# start app
main()

