import os
from pathlib import Path

from .update import update_pkg
from .conf import ROOT, GIT, MATLAB, Packages, Gallery, REPOS
try:
    from .conf import ROOT, GIT, MATLAB, Packages, Gallery, REPOS
except Exception as e:
    print(e)
    ROOT = Path("../")
    GIT,MATLAB,Packages,Gallery = ["NONE"]*4

INVOKE = "&" if "nt" in os.name.lower() else ""

# Root directories
CMD = ROOT/"_cmds"
CFG = ROOT/"_conf"
DOC = ROOT/"FEDEASdoc" # Source repository for FEDEASLab webside
WEB = ROOT/"FEDEASweb" # Build repository for FEDEASLab webside
SRC = ROOT/"FEDEASLab" # Source repository for FEDEASLab
PKG = ROOT/"Packages"  # 
GLY = ROOT/"Gallery"



# f"'htmldir', '{Path('../FEDEASdoc/docs/Functions/')}', " \
m2html = \
f"\"addpath '{CMD/'m2html'}'; " \
f"m2html('mfiles','latest/', " \
    f"'htmldir', '{DOC/'docs/Functions/'}', " \
    "'recursive','on'," \
    "'global','on'," \
    "'extension','.md'," \
    "'source','off', " \
    "'indexFile', 'index', " \
    "'clip_synopsis', true " \
    "); " \
"exit;\""

# f"'data_file', '{CFG/'.aurore/fdlb.cache.json'}'" \

ELSTIR = ["elstir"]

options = {
    "pkg": tuple(["--all"]+[pkg for pkg in Packages if "_Excl" not in pkg])
}

galleries = tuple([k for k in Gallery])

makefile = {
    # "Resource management and indexing": {
    #     # "list": ((galleries,"<args>"),{
    #     #     "List gallery items.":
    #     #         [["rendre", "-d", "Gallery.yaml#/{0}", "list", "{1}"]],
    #     # }),
    # },
    "Documentation": {
        "clean": (("--dry-run",),{
            "Clean DOC/docs/Functions":
                [["python", CMD/"clean.py","--not","index.md",DOC/"docs/Functions/latest","{0}"]],
        }),
        "serve": {
            "Create a live server for real-time web page editing.":
                [[*ELSTIR, "serve", "--config-file", f"{DOC/'elstir.yml'}"]]
        },
        "m2html": (options["pkg"], ("",), {
            "Generate intermediate API pages with `m2html`.":
                [[{"cwd":PKG},MATLAB, "-batch", m2html.replace(r"/mnt/c", r"C:\\").replace("/","\\")]],
        }),
        "build": {
           # "Clean DOC/docs/Functions":
           #     [["python", CMD/"clean.py","--not","index.md",DOC/"docs/Functions/latest"]],
           # "Copy current `.m` files to 'latest' package.":
           #     [["python", CMD/"update.py","latest", CFG/"Packages.yaml",SRC,PKG,"--all-m"]],
           # "Generate intermediate API pages with `m2html`.": 
           #     [[{"cwd":PKG},MATLAB, "-batch", m2html]],
            "Build full website from intermediate pages.":
                [[*ELSTIR, "build", "--config-file", f"{DOC/'elstir.yml'}", "--site-dir", f"{WEB}"]],
        },
    },
    "Packaging and Distribution":{
        "update": (options["pkg"] ,("--dry-run",), {
            "Copy '.m' files to the Packages directory.":
                [[ "python", CMD/"update2.py","{0}",CFG/"Packages.yaml",SRC,PKG,"{}"]],
        })
    },
    "Development Environment": {
        # "refresh": {
        #     "Update README file":
        #         [[""]]
        # },
        # "clone": {
        #     "Initialize fedeas directory by cloning project repositories.": 
        #         [[GIT, "clone", f"http://github.com/{user}/{repo}", f"{path}"]
        #             for path, (user,repo) in REPOS.items()]
        # },
        "init" : {
            "Install in-house fmake system dependencies": [
                [GIT, "clone", 
                  #"-b", "cmp-dev", 
                  "--single-branch","--recurse-submodules", 
                  f"http://github.com/claudioperez/aurore", f"{ROOT/'_cmds/aurore'}"],
                [{"cwd":f"{ROOT/'_cmds/aurore'}"},"python","setup.py", "develop"],
                [GIT, "clone", f"http://github.com/claudioperez/elstir", f"{ROOT/'_cmds/elstir'}"],
                [{"cwd":f"{ROOT/'_cmds/elstir'}"}, "python","setup.py", "develop"],
                [GIT, "clone", f"http://github.com/claudioperez/rendre", f"{ROOT/'_cmds/rendre'}"],
                [{"cwd":f"{ROOT/'_cmds/rendre'}"}, "python","setup.py", "develop"],
                [GIT, "clone", f"http://github.com/claudioperez/FEDEASdoc", f"{DOC}"],
                [{"cwd":f"{DOC}"},GIT, "checkout", f"folder-struct-2"],
            ]
        },
        "upgrade" : {
            "Upgrade in-house fmake system dependencies": [
                [{"cwd":f"{ROOT/'_cmds/aurore'}"}, GIT, "pull"],
                [{"cwd":f"{ROOT/'_cmds/elstir'}"}, GIT, "pull"],
                [{"cwd":f"{ROOT/'_cmds/rendre'}"}, GIT, "pull"],
            ]
        },
        "check": {
            "Check fmake": [
                [GIT, "--help"]
            ]
        },
        # "upgrade": {
        #     "Upgrade system dependencies": [
        #         ["pip", "install", "--upgrade", 
        #             f"{module} @ git+https://github.com/claudioperez/{module}@cmp-dev"]
        #         for module in ["elstir", "aurore", "rendre"]
        #     ]
        # },
        # "upgrade": (("elstir", "aurore", "rendre"), {
        #     "Upgrade system dependencies": [
        #         ["pip", "install", "--upgrade", 
        #             "{0} @ git+https://github.com/claudioperez/{0}@cmp-dev"]
        #     ]
        # })
    },
    "Other": {
        "which": {
            "Print fmake location": [
                ["echo", ROOT]
            ]
        },
    }
}


