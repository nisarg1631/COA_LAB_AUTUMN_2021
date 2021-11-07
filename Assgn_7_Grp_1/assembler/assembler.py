import sys
import re
import json

REGDICT = {}
INSTRUCTION_DICT = {}
TYPE_DICT = {}


def spit_line(line):
    pass


def bin_comm(string):
    string = re.sub(re.compile("/'''.*?\'''", re.DOTALL), "", string)
    string = re.sub(re.compile("#.*?\n"), "", string)
    return string


def process(filename):
    with open(filename, 'r') as f:
        lines = f.readlines()
        for line in lines:
            line.strip()
            line = bin_comm(line)
            line = line.split()
            if len(line):
                spit_line(line)


if __name__ == '__main__':
    with open('instruc.json', 'r') as f:
        INSTRUCTION_DICT = json.load(f)
    with open('register.json', 'r') as f:
        REGDICT = json.load(f)
    with open('type.json', 'r') as f:
        TYPE_DICT = json.load(f)
    print(REGDICT)
    print(INSTRUCTION_DICT)
    print(TYPE_DICT)
    process(sys.argv[1])
