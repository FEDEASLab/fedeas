import os
from pathlib import Path

import yaml


ROOT = Path(
    os.path.normpath(
        os.path.split(
            os.path.split(__file__)[0]
        )[0]
    )
)

GIT = ""
MATLAB = "matlab"

with open(ROOT/"_conf/Packages.yaml", "r") as f:
    Packages = yaml.load(f,Loader=yaml.Loader)

with open(ROOT/"_conf/Gallery.yaml", "r") as f:
    Gallery = yaml.load(f,Loader=yaml.Loader)
