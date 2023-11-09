#!/usr/bin/env python3
#
# By Le Chen and Chatgpt
# chenle02@gmail.com / le.chen@auburn.edu
# Created at Thu Nov  9 10:44:01 AM EST 2023
#

import os
import sys

# Check the number of arguments, only one argument is allowed and it should be the input file
if len(sys.argv) != 2:
    print("Error: Incorrect number of arguments.")
    print("Usage: python parseArg.py <input_file>")
    sys.exit(1)

# Check if the input file exists
if not os.path.exists(sys.argv[1]):
    print("Error: Input file does not exist.")
    sys.exit(1)

# Define the name of the input file
input_file = sys.argv[1]

# Initialize four empty lists
list1, list2, list3, list4 = [], [], [], []

# Define a list of lists to make appending in a round-robin fashion easier
lists = [list1, list2, list3, list4]

# Open the file and read lines
with open(input_file, 'r') as file:
    lines = file.readlines()

# Check if the number of lines is a multiple of 4
if len(lines) % 4 != 0:
    print("Warning: The number of lines in the file is not a multiple of 4.")

# Loop through each line and append it to the corresponding list
for i, line in enumerate(lines):
    # Remove newline characters and whitespace, if any, and append to the corresponding list
    lists[i % 4].append(line.strip())


def list_to_string(lst):
    return ', '.join(str(x) for x in lst)


# Output the contents of the lists
# print("List 1:", list1)
# print("List 2:", list2)
# print("List 3:", list3)
# print("List 4:", list4)

print(f"""
A = {{
       (* Upper List *) {{
         (* Upper Front list *) {{
           {list_to_string(list1)}
         }},
         (* Upper Rear List *) {{
           {list_to_string(list2)}
         }}
       }},
       (* Lower List *) {{
         (* Lower Front List *){{
           {list_to_string(list3)}
         }},
         (* Lower Rear List *){{
           {list_to_string(list4)}
         }}
       }}
     }}
""")
