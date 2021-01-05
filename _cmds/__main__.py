import re
import os
import sys
import json
import argparse
from pathlib import Path
from pprint import pprint

from .makefile import makefile

def make_parser(makefile):
    parent = argparse.ArgumentParser("fedeas")
    description = "\n".join([
        "\n".join([category, commands])
    ])
    subparsers = parent.add_subparsers()

    for category, commands in makefile.items():
        child = subparsers.add_parser("")
        sub = child.add_subparsers(title=category)
        for cmd, cmd_group in commands.items():
            print(cmd)
            sub.add_parser(cmd)
    return parent

# def make_targets(makefile)->dict:
#     targets = {}
#     for category, c in makefile.items():
#         for cmd, groups in c.items():
#             targets.update({cmd: []})
#             for group in groups.values():
#                 # print(f"grp: {group}")
#                 targets[cmd].extend(group)

#     return targets

def make_help(makefile)->str:
    name = "fmake"
    # cmds = [c for k in makefile for c in makefile[k]]
    groups = "\n\n  ".join(
        ["\n  ".join([k, 
        "  {"+", ".join([c for c in makefile[k]]) + "}" ])
        for k in makefile ]
    )
    return f"""
usage: {name} <command>
or: {name} help <command>

  {groups}
"""

def run_cmd(makefile,targets,target,args=[],nums=[]):
    recipe = makefile[targets[target]][target]
    if isinstance(recipe,dict):
        commands = recipe.values()
        options = []
    else:
        commands = recipe[1].values()
    num = 0
    if "--all" in nums:
        args.pop(args.index("--all"))
        nums = list(range(10))
    elif not nums:
        nums = list(range(10))
    if "--dry" in args:
        args.pop(args.index("--dry"))
        for group in commands:
            for command in group:
                num+=1
                if num in nums:
                    print([str(f).format(*args[2:]) for f in command])
    else:
        for group in commands:
            for command in group:
                if num in nums:
                    cmd = [str(f).format(*args[2:]) for f in command]
                    check = input(f"\nEnter <ok> to run the following command: \n  >{cmd}\n")
                    if check == "ok":
                        os.system(" ".join(cmd))
                num+=1

def help_cmd(makefile,targets,target)->str:
    recipe = makefile[targets[target]][target]
    if isinstance(recipe,dict):
        commands = recipe.items()
        options = ""
    else:
        commands = recipe[1].items()
        try:
            options =  f"[{'|'.join(o for o in recipe[0])}]"
        except:
            options = ""

    print(f"usage: fmake {target} {options}\n")
    for description, cmds in commands:
        print(f"  {description}")
        for c in cmds: print(f"    >{' '.join(str(i) for i in c)}]\n")



def main():
    targets = {
        command: category 
            for category in makefile for command in makefile[category]
    }

    # print(targets)
    if len(sys.argv) == 1:
        print(make_help(makefile))
    elif "help" == sys.argv[1]:
        help_cmd(makefile,targets,sys.argv[2])
    else:
        num_exp = re.compile(f"-(\d)")
        nums = [int(num_exp.search(arg).group(1)) for arg in sys.argv if num_exp.search(arg)]
        run_cmd(makefile,targets,sys.argv[1],sys.argv+[""]*7,nums)

