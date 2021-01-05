def category(name:str, level=2)->str:
    return "".join(["#"]*level + [" ",name,"\n"])

def command(name:str,level=3)->str:
    return "".join(["#"]*level+[" `", name, "`\n"])


def make_readme(makefile:dict, readme:str="")->str:
    if not readme:
        readme = "# Readme\n\n"
    for k,v in makefile.items():
        readme = "\n".join([readme,category(k)])
        for c, l in v.items():
            readme = "\n".join([readme, command(c)])
    
    return readme

if __name__=="__main__":
    from makefile import makefile

    print(make_readme(makefile))
