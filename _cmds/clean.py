import os
import argparse
from pathlib import Path

if __name__=="__main__":
    parser = argparse.ArgumentParser()
    parser.add_argument("directory")
    parser.add_argument("--not",action="append", dest="nots")
    parser.add_argument("--dry-run",action="store_true")

    args,unknown = parser.parse_known_args()
    print(args.nots)
    for file in Path(args.directory).glob("**/*.md"):
        if file.name not in args.nots:
            print(f"removing file: {file} {'(dry run)' if args.dry_run else ''}")
            if not args.dry_run:
                os.remove(file)


