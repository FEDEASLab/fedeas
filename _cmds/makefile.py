import os
from pathlib import Path

from .conf import ROOT, GIT, MATLAB, Packages, Gallery, REPOS
try:
    from .conf import ROOT, GIT, MATLAB, Packages, Gallery, REPOS
except Exception as e:
    print(e)
    ROOT = Path("../")
    GIT,MATLAB,Packages,Gallery = ["NONE"]*4

INVOKE = "&" if "nt" in os.name.lower() else ""

# Root directories
CMD = ROOT/"_cmds/"
DOC = ROOT/"FEDEASdoc" # Source repository for FEDEASLab webside
WEB = ROOT/"FEDEASweb" # Build repository for FEDEASLab webside
LAB = ROOT/"FEDEASLab" # Source repository for FEDEASLab
PKG = ROOT/"Packages"  # 
GLY = ROOT/"Gallery"



m2html = \
f"\"addpath '{CMD/'m2html'}'; " \
"m2html('mfiles','latest', " \
    f"'htmldir', '{ROOT/'/FEDEASdoc/docs/Functions/'}', " \
    "'recursive','on'," \
    "'global','on'," \
    "'extension','.md'," \
    "'source','off', " \
    "'indexFile', '_index', " \
    f"'data_dir', '{ROOT/'.aurore/'}'" \
    "); " \
"exit;\""

ELSTIR = ["elstir"]

options = {
    "pkg": tuple([pkg for pkg in Packages])
}
galleries = tuple([k for k in Gallery])

makefile = {
    "Resource management and indexing": {
        # "list": ((galleries,"<args>"),{
        #     "List gallery items.":
        #         [["rendre", "-d", "Gallery.yaml#/{0}", "list", "{1}"]],
        # }),
    },
    "Documentation": {
        "build": {
            "Generate intermediate API pages with `m2html`.": 
                [[MATLAB, "-batch", m2html]],
            # "Generate index pages":
            #     [["rendre", "-d", folder]
            #     for folder in ["TEST"] ], #glob.glob(DOC/"docs/Functions/*")],
            "Build full website from intermediate pages.": 
                [[*ELSTIR, "build", "--config-file", f"{DOC/'elstir.yml'}", "--site-dir", f"'{WEB}'"]],
        },
        "serve": {
            "Create a live server for real-time web page editing.":
                [[*ELSTIR, "serve", "--config-file", f"{DOC/'elstir.yml'}"]]
        }
    },
    "Packaging and Distribution":{
        "update": (options["pkg"] , {
            "Create necessary `.p` files and copy to package directory.":
                [["", "{0}"]],
        })
    },
    "House-keeeping": {
        "refresh": {
            "Update README file":
                [[""]]
        },
        "clone": {
            "Initialize fedeas directory by cloning project repositories.": 
                [[GIT, "clone", f"http://github.com/{user}/{repo}", f"{path}"]
                    for path, (user,repo) in REPOS.items()]
        },
        "init" : {
            "Install in-house fmake system dependencies": [
                [GIT, "clone", "-b", "cmp-dev", "--single-branch","--recurse-submodules", f"http://github.com/claudioperez/aurore", f"{ROOT/'_cmds/aurore'}"],
                [{"cwd":f"{ROOT/'_cmds/aurore'}"},"python","setup.py", "develop"],
                [GIT, "clone", f"http://github.com/claudioperez/elstir", f"{ROOT/'_cmds/elstir'}"],
                [{"cwd":f"{ROOT/'_cmds/elstir'}"}, "python","setup.py", "develop"],
                [GIT, "clone", f"http://github.com/claudioperez/rendre", f"{ROOT/'_cmds/rendre'}"],
                [{"cwd":f"{ROOT/'_cmds/rendre'}"}, "python","setup.py", "develop"],
            ]
        },
        "upgrade" : {
            "Upgrade in-house fmake system dependencies": [
                [{"cwd":f"{ROOT/'_cmds/aurore'}"}, GIT, "pull"],
                [{"cwd":f"{ROOT/'_cmds/elstir'}"}, GIT, "pull"],
                [{"cwd":f"{ROOT/'_cmds/rendre'}"}, GIT, "pull"],
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
    }
}


