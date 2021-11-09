import sys
import re
import json

REGDICT = {}
INSTRUCTION_DICT = {}
OUTPUT_FILE = open("output", "w")

def two_comp(num,nbits):
    '''
    gives nbit long two complement representation of number
    '''
    if num>=0:
        return f"{num:0{nbits}b}"
    else:
        return f"{((1<<nbits)+num):0{nbits}b}"

def spit_line(line):
    try:
        # print(line)
        opcode=INSTRUCTION_DICT[line[0]][0]
        opc=int(opcode,2)
        # print(opc)
        if opc==1 or opc==2:
            if len(line)!=3:
                print(f"error in line {line}")
                return
            else:
                rs=f"{REGDICT[line[1]]:05b}"
                rt=f"{REGDICT[line[2]]:05b}"
                shamt=f"{0:010b}"
                funct=f"{INSTRUCTION_DICT[line[0]][-1]}"
                print(f"{opcode}{rs}{rt}{shamt}{funct},", file = OUTPUT_FILE)
        elif opc==3:
            if len(line)!=3:
                print(f"error in line {line}")
                return
            else:
                rs=f"{REGDICT[line[1]]:05b}"
                funct=f"{INSTRUCTION_DICT[line[0]][-1]}"
                rt=f"{0:05b}"
                shamt=f"{0:010b}"
                if line[2] in REGDICT:
                    rt=f"{REGDICT[line[2]]:05b}"
                else: 
                    shamt=f"{int(line[2]):010b}"
                print(f"{opcode}{rs}{rt}{shamt}{funct},", file = OUTPUT_FILE)
        elif opc==4:
            if len(line)<2:
                print(f"error in line {line}")
                return
            else:
                funct=f"{INSTRUCTION_DICT[line[0]][-1]}"
                rs=f"{REGDICT[line[1]]:05b}"
                addr=f"{0:015b}"
                if int(funct)!=0:
                    if len(line)!=3:
                        print(f"error in line {line}")
                        return
                    else:
                        addr=f"{int(line[2]):015b}"
                print(f"{opcode}{rs}{addr}{funct},", file = OUTPUT_FILE)
        elif opc==5 or opc==6:
            if len(line)!=2:
                print(f"error in line {line}")
                return
            else:
                funct = f"{INSTRUCTION_DICT[line[0]][-1]}"
                rs=f"{0:05b}"
                addr=f"{int(line[1]):015b}"
                print(f"{opcode}{rs}{addr}{funct},", file = OUTPUT_FILE)
        elif opc==60 or opc==61:
            if len(line)!=3:
                print(f"error in line {line}")
                return
            else:
                rs=f"{REGDICT[line[1]]:05b}"
                rt=f"{0:05b}"
                imm_dec=int(line[2])
                imm=two_comp(imm_dec,16)
                print(f"{opcode}{rs}{rt}{imm},", file = OUTPUT_FILE)
        elif opc==62 or opc==63:
            if len(line)!=4:
                print(f"error in line {line}")
                return
            else:
                rt=f"{REGDICT[line[1]]:05b}"
                rs=f"{REGDICT[line[-1]]:05b}"
                imm_dec=int(line[2])
                imm=two_comp(imm_dec,16)
                print(f"{opcode}{rs}{rt}{imm},", file = OUTPUT_FILE)
    except:
        print(f"error in line {line}")


def bin_comm(string):
    string = re.sub(re.compile("/'''.*?\'''", re.DOTALL), "", string)
    string = re.sub(re.compile("#.*?\n"), "", string)
    return string


def process(filename):
    print("memory_initialization_radix=2;", file = OUTPUT_FILE)
    print("memory_initialization_vector=", file = OUTPUT_FILE)
    print(f"{0:032b}", file = OUTPUT_FILE)
    with open(filename, 'r') as f:
        lines = f.readlines()
        for line in lines:
            line.strip()
            line = bin_comm(line)
            
            line = line.replace(',',' ').replace(')',' ').replace('(',' ').split()
            if len(line):
                spit_line(line)
    print(f"{0:032b};", file = OUTPUT_FILE)

if __name__ == '__main__':
    with open('instruc.json', 'r') as f:
        INSTRUCTION_DICT = json.load(f)
    with open('registers.json', 'r') as f:
        REGDICT = json.load(f)
    process(sys.argv[1])
