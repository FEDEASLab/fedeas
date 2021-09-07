import os
from pathlib import Path

import yaml


ROOT = Path(
    os.path.expandvars(
        os.path.split(
            os.path.split(__file__)[0]
        )[0]
    )
)


with open(ROOT/"_conf/Packages.yaml", "r") as f:
    Packages = yaml.load(f,Loader=yaml.Loader)

with open(ROOT/"_conf/Gallery.yaml", "r") as f:
    Gallery = yaml.load(f,Loader=yaml.Loader)

with open(ROOT/"_conf/user.yaml","r") as f:
    User = yaml.load(f, Loader=yaml.Loader)

GIT = os.path.expandvars(User['git'])

try:
    MATLAB = os.path.expandvars(User['matlab'])
except:
    MATLAB = "matlab"

with open(ROOT/"_conf/General.yaml","r") as f:
    General = yaml.load(f, Loader=yaml.Loader)

def mkrepo_dict(d,base=ROOT):
    out = {}
    for k,v in d.items():
        if isinstance(v,dict):
            out.update(mkrepo_dict(
                v, os.path.join(base,k)
            ))
        else:
            out.update({os.path.join(base,k):v})
    return out

REPOS = mkrepo_dict(General["ROOT"])
