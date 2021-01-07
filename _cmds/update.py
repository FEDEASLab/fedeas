
import os
import re
import sys
import glob
import shutil
from pathlib import Path

import yaml


function_name_pattern = re.compile(r"= *([A-z_\d]*)")

#top_level = Path("latest")

def update_pkg(dir_layout:dict, source_path:Path, dest_path:Path,dry=True):
    for name,obj in dir_layout.items():
        print(f"DIR: {name}")
        print(f"SRC: {source_path}")
        print(f"DST: {dest_path}")
        if isinstance(obj, (set,list)):
            for item in obj:
                match = function_name_pattern.search(item)
                if match:
                    # filename = source_path + "**" + match.group(1) + ".?"
                    # sources = glob.glob(filename, recursive=True)
                    sources = list(source_path.glob("**/"+match.group(1)+".?"))
                    if sources:
                        if len(sources)>1:
                            #Possibly picked up .p files
                            sources = [s for s in sources if s.suffix == ".m"]
                            assert len(sources) == 1
                        source = sources[0]
                        destination = dest_path/name/os.path.split(source)[1]
                        print(f"  source: {source}")
                        print(f"  dest: {destination}\n")
                        if not dry:
                            os.makedirs(os.path.dirname(destination),exist_ok=True)
                            shutil.copy(source,destination)
                    else:
                        print(f"FILE NOT FOUND: {match.group(1)}")
        elif isinstance(obj, dict):
            update_pkg(obj,source_path,dest_path/name, dry)
        else:
            raise Exception(obj)

if __name__=="__main__":
    pkg_index = Path(sys.argv[2])
    source_path = Path(sys.argv[3])
    dest_path = Path(sys.argv[4])
    
    with open(pkg_index) as f:
        data = yaml.load(f,Loader=yaml.Loader)

    if "--dry-run" in sys.argv:
        dry = True
    else:
        dry = False

    if "--all" in sys.argv:
        print("all")
        update_pkg(data,source_path,dest_path, dry)
    
    else:
        data = {
            sys.argv[1]: data[sys.argv[1]]
        }
        update_pkg(data,source_path,dest_path, dry)
        


