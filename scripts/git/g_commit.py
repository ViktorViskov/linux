#!/usr/bin/python3
# libs
from os import system

# 
# simple script to make git commit in branch som in root folder
# 

# main function
def main():
    # start message read user message
    print("Type 'exit' to close program")
    user_message = read_commit_description("Commit description:")

    # if exit stop program
    if user_message.lower().strip(" ") == "exit":
        print("Canceled by user")
        return

    # make commit and push
    system("git add .")
    system("git commit -m '%s'" % (user_message))
    system("git push")

# function for read user input only one word
def read_commit_description(message:str):
    # define variable and read user input
    user_input:str = ""
    while len(user_input) == 0:
        user_input = input(message + " ")

    # return message
    return user_input


# start app
main()

