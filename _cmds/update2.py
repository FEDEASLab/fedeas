import os
import re
import sys
import glob
import shutil
from pathlib import Path

import yaml


function_name_pattern = re.compile(r"= *([A-z_0-9]*)")

def is_dir(data):
    #return all([data[k] is not None for k in data])
    return len(data) > 1

def iterate_files(data):
    if isinstance(data,(list,tuple)):
        return data
    elif isinstance(data,dict):
        return [key for key in data if data[key] is None]
        #for key in data:
        #    if data[key] is None:
        #        yield key
    else:
        return []

def update_pkg(dir_layout:dict, source_path:Path, dest_path:Path, dry_run=True):
    """This function recursively walks the map-like data structure, `dir_layout`,
    and copies files from `source_path` to `dest_path` according to the given
    layout.
    """
    for folder_name, data in dir_layout.items():
        print(f"DIR: {folder_name}")
        print(f"SRC: {source_path}")
        print(f"DST: {dest_path}")
        for item in iterate_files(data):
            match = function_name_pattern.search(item)
            if match:
                # Use recursive Unix-like glob matching to find exact paths 
                # files in source directory using matched file name.
                function_name = match.group(1)
            else:
                function_name = os.path.splitext(item)[0]

            sources = list(source_path.glob("**/"+function_name+".?"))

            if sources: # Check that a matching file was found.
                if len(sources)>1:
                    # Possibly picked up .p files, extract only '.m' files.
                    sources = [s for s in sources if s.suffix == ".m"]
                    assert len(sources) == 1, sources
                source = sources[0]
                # concatenate destination path
                destination = dest_path/folder_name/os.path.split(source)[1]
                print(f"  source: {source}")
                print(f"  dest: {destination}\n")

                if not dry_run:
                    os.makedirs(os.path.dirname(destination),exist_ok=True)
                    shutil.copy(source,destination)
            else:
                print(f"FILE NOT FOUND: {function_name}")

        if isinstance(data, dict) and is_dir(data):
            update_pkg(data,source_path,dest_path/folder_name, dry)


if __name__=="__main__":
    # Handle arguments when this file is run as a script from the console.
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



