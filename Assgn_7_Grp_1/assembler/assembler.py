import sys
import re
import json

REGDICT = {}
INSTRUCTION_DICT = {}


def spit_line(line):
    try:
        print(f"processing {line}")
        opcode=INSTRUCTION_DICT[line[0]][0]
        opc=int(opcode,2)
        print(opc)
        if opc==1 or opc==2:
            if len(line)!=3:
                print("error")
                return
            else:
                rs=f"{REGDICT[line[1]]:05b}"
                rt=f"{REGDICT[line[2]]:05b}"
                shamt=f"{0:010b}"
                funct=f"{INSTRUCTION_DICT[line[0]][-1]}"
                print(f"{opcode} {rs} {rt} {shamt} {funct}")
        elif opc==3:
            if len(line)!=3:
                print("error")
                return
            else:
                rs=f"{REGDICT[line[1]]:05b}"
                funct=f"{INSTRUCTION_DICT[line[0]][-1]}"
                print(f"{opcode} {rs}  {funct}")
        elif opc==4:
            if len(line)<2:
                print("error")
                return
            else:
                funct=f"{INSTRUCTION_DICT[line[0]][-1]}"
                rs=f"{REGDICT[line[1]]:05b}"
                addr=f"{0:015b}"
                if int(funct)!=0:
                    if len(line)!=3:
                        print("error")
                        return
                    else:
                        addr=f"{int(line[2]):015b}"
                print(f"{opcode} {rs} {addr} {funct}")
        elif opc==5:
            if len(line)!=2:
                print("error")
                return
            else:
                funct = f"{INSTRUCTION_DICT[line[0]][-1]}"
                rs=f"{0:05b}"
                addr=f"{int(line[1]):015b}"
                print(f"{opcode} {rs} {addr} {funct}")
    except:
        print("error")


def bin_comm(string):
    string = re.sub(re.compile("/'''.*?\'''", re.DOTALL), "", string)
    string = re.sub(re.compile("#.*?\n"), "", string)
    return string


def process(filename):
    print(f"{0:032b}")
    with open(filename, 'r') as f:
        lines = f.readlines()
        for line in lines:
            line.strip()
            line = bin_comm(line)
            
            line = line.replace(',',' ').split()
            if len(line):
                spit_line(line)
    print(f"{0:032b}")

if __name__ == '__main__':
    with open('instruc.json', 'r') as f:
        INSTRUCTION_DICT = json.load(f)
    with open('registers.json', 'r') as f:
        REGDICT = json.load(f)
    process(sys.argv[1])
