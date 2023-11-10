#!/usr/bin/env python3
#
# By Le Chen and Chatgpt
# chenle02@gmail.com / le.chen@auburn.edu
# Created at Thu Nov  9 10:44:01 AM EST 2023
#

import os
import argparse
import sys


# Function to convert a list to a string without square brackets
def list_to_string(lst):
    return ', '.join(str(x) for x in lst)


# Set up the argument parser
parser = argparse.ArgumentParser(description='Process some integers.')
parser.add_argument('input_file', metavar='input_file', type=str,              help='an input file to process')
parser.add_argument('-o',         '--output',           metavar='output_file', type=str,                  help='the output file where to write the result')

# Parse arguments
args = parser.parse_args()

# Check if the input file exists
if not os.path.exists(args.input_file):
    print("Error: Input file does not exist.")
    sys.exit(1)

# Initialize four empty lists
list1, list2, list3, list4 = [], [], [], []

# Define a list of lists to make appending in a round-robin fashion easier
lists = [list1, list2, list3, list4]

# Open the file and read lines
with open(args.input_file, 'r') as file:
    # Filter out lines that start with '#'
    lines = [line for line in file if not line.strip().startswith('#')]

# Check if the number of lines is a multiple of 4
if len(lines) % 4 != 0:
    print("Warning: The number of lines in the file is not a multiple of 4.")

# Loop through each line and append it to the corresponding list
for i, line in enumerate(lines):
    lists[i % 4].append(line.strip())

# Prepare the output
output = f"""
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
"""

# Determine the output file name
output_file = args.output if args.output else os.path.splitext(args.input_file)[0] + '.wls'

# Write to the output file
with open(output_file, 'w') as file:
    file.write(output)

print(f"Output written to {output_file}")
