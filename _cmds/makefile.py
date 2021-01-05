import glob
from pathlib import Path

try:
    from .conf import ROOT, GIT, MATLAB, Packages, Gallery
except Exception as e:
    print(e)
    ROOT = Path("../")
    GIT,MATLAB,Packages,Gallery = ["NONE"]*4

# MATLAB = "matlab"
# ROOT = ""
# GIT = ""

# Root directories
CMD = ROOT/"_cmds/"
DOC = ROOT/"FEDEASdoc" # Source repository for FEDEASLab webside
WEB = ROOT/"FEDEASweb" # Build repository for FEDEASLab webside
LAB = ROOT/"FEDEASLab" # Source repository for FEDEASLab
PKG = ROOT/"Packages"  # 
GLY = ROOT/"Gallery"



# m2html = f"""
# addpath {CMD/'m2html'};
# m2html('mfiles','latest', ...
#        'htmldir','../FEDEASdoc/docs/Functions/', ...
#        'recursive','on',...
#        'global','on',...
#        'extension','.md',...
#        'source','off', ...
#        'indexFile', '_index'...
#        );
# exit;
# """

m2html = \
f"addpath {CMD/'m2html'}; " \
"m2html('mfiles','latest', " \
    "'htmldir','../FEDEASdoc/docs/Functions/', " \
    "'recursive','on'," \
    "'global','on'," \
    "'extension','.md'," \
    "'source','off', " \
    "'indexFile', '_index'" \
    "); " \
"exit;"

ELSTIR = ["elstir", "--config-file", f"{DOC/'elstir.yaml'}"]

options = {
    "pkg": tuple([pkg for pkg in Packages])
}
galleries = tuple([k for k in Gallery])

makefile = {
    "Resource management and indexing": {
        "list": ((galleries,"<args>"),{
            "List gallery items.":
                [["rendre", "-d", "Gallery.yaml#/{0}", "list", "{1}"]],
        }),
    },
    "Documentation": {
        "build": {
            "Generate intermediate API pages with `m2html`.": 
                [[MATLAB, "-batch", m2html]],
            "Generate index pages":
                [["rendre", "-d", folder]
                for folder in ["TEST"] ], #glob.glob(DOC/"docs/Functions/*")],
            "Build full website from intermediate pages.": 
                [[*ELSTIR, "--site-dir", f"{WEB}","build"]],
        },
        "serve": {
            "Create a live server for real-time web page editing.":
                [[*ELSTIR, "serve"]]
        }
    },
    "Packaging and Distribution":{
        "update": (options["pkg"] , {
            "Create necessary `.p` files and copy to package directory.":
                [["", "{pkg}"]],
            "Create zip file.":
                [[""]]
        })
    },
    "House-keeeping": {
        "refresh": {
            "Update README file":
                [[""]]
        },
        "init": {
            "Initialize directory": 
                [[""]]
        },
        "upgrade": (("elstir", "aurore", "rendre"), {
            "Upgrade system dependencies": [
                ["pip", "install", "--upgrade", 
                    "{0} @ git+https://github.com/claudioperez/{0}@cmp-dev"]
            ]
        })
    }
}


