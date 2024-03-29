import re
import os
import sys
import json
import argparse
import subprocess
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

def make_help(makefile,args=[])->str:
    name = "fmake"
    # cmds = [c for k in makefile for c in makefile[k]]
    groups = "\n\n  ".join(
        ["\n  - ".join([k, 
        "  {"+", ".join([f'`{c}`' for c in makefile[k]]) + "}" ])
        for k in makefile ]
    )
    fence = "```\n" if "--print-help" in args else ""
    return f"""
{fence}usage: {name} <target> [--<command-num>, --dry]
   or: {name} help <target>
{fence}
Available `<target>` names are listed by category below:

  {groups}

To learn more about a target and its commands, run `>{name} help <target>`
"""

def run_cmd(makefile,targets,target,args=[],nums=[]):
    try:
        recipe = makefile[targets[target]][target]
    except KeyError:
        print(f"ERROR -- Unknown target '{target}'")
        return

    if isinstance(recipe,dict):
        commands = recipe.values()
        options = []
    else:
        commands = recipe[-1].values()
    num = 0

    if "--all" in nums:
        args.pop(args.index("--all"))
        nums = list(range(10))
    elif not nums:
        nums = list(range(10))

    if "--no-check" in args:
        no_check = True
    else:
        no_check = False

    if "--dry" in args:
        args.pop(args.index("--dry"))
        for group in commands:
            for command in group:
                if num in nums:
                    print([str(f).format(*args[2:]) for f in command if not isinstance(f,dict)])
                num+=1
    else:
        for group in commands:
            for command in group:
                if num in nums:
                    cmd = [str(f).format(*args[2:]) for f in command if not isinstance(f,dict)]
                    kwds = command[0] if isinstance(command[0],dict) else {}
                    if not no_check:
                        check = input(f"\nEnter 'run' to execute the following command: \n    >{' '.join(cmd)}\n     in environment: {kwds}\nInput: ")
                    else:
                        check = "run"

                    if check == "run":
                        subprocess.call(cmd, **kwds)
                        print("\n\nCommand completed.\n")
                num+=1

def help_cmd(makefile,targets,target)->str:
    recipe = makefile[targets[target]][target]
    if isinstance(recipe,dict):
        commands = recipe.items()
        options = ""
    else:
        commands = recipe[-1].items()
        try:
            options =  " ".join([f"[{'|'.join(o for o in r)}]" for r in recipe[:-2]])
        except:
            options = ""

    print(f"usage: fmake {target} {options}\n")
    n = 1
    for description, cmds in commands:
        print(f"  {description}")
        for c in cmds:
            print(
                f"   {n}) {' '.join(str(i) if len(str(i)) < 10 else '...'+str(i)[-10:] for i in c if not isinstance(i,dict))}\n"
            )
            n += 1



def main():
    targets = {
        command: category 
            for category in makefile for command in makefile[category]
    }

    # print(targets)
    if len(sys.argv) == 1 or len(sys.argv)==2 and "help" in sys.argv[1] or "--print-help" in sys.argv:
        print(make_help(makefile,sys.argv))
    elif "help" in sys.argv[1]:
        help_cmd(makefile,targets,sys.argv[2])
    else:
        num_exp = re.compile(r"-(\d)")
        nums = [num_exp.search(arg).group(1) for arg in sys.argv[1:] if num_exp.search(arg)]
        if nums: print(f"Selected command numbers: {nums}")
        for num in nums:
            sys.argv.pop(sys.argv.index("-" + num))
        nums = [int(n)-1 for n in nums]
        run_cmd(makefile,targets,sys.argv[1],sys.argv+[""]*7,nums)

