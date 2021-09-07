

readme:
	cat _cmds/README.md > README.md
	printf '## `fmake` Commands\n\n' >> README.md 
	printf 'The `fmake` command is invoked as follows from the command line:\n' >> README.md 
	fmake --print-help >> README.md
