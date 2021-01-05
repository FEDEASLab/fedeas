#!/usr/bin/env python
# -*- encoding: utf-8 -*-
import io, re, os
from glob import glob
from os.path import basename
from os.path import dirname
from os.path import join
from os.path import splitext

from setuptools import find_packages
from setuptools import setup





def get_version(package):
    """Return package version as listed in `__version__` in `__init__.py`."""
    with open(os.path.join(package, '__init__.py')) as f:
        init_py = f.read()
    return re.search("__version__ = ['\"]([^'\"]+)['\"]", init_py).group(1)


def read(*names, **kwargs):
    with io.open(
        join(dirname(__file__), *names),
        encoding=kwargs.get('encoding', 'utf8')
    ) as fh:
        return fh.read()

name = "fmake"

setup(
    name=name,
    version=get_version("./_cmds/"),
    license='Apache-2.0',
    description='FedeasLab Development manager.',
    long_description='%s\n' % (
        re.compile('^.. start-badges.*^.. end-badges', re.M | re.S).sub('', read('README.md')),
    ),
    long_description_content_type= 'text/markdown',
    author='Claudio Perez',
    author_email='claudio_perez@berkeley.edu',
    url='https://github.com/FEDEASLab/fedeas',
    # packages = find_packages('./_cmds'),
    packages = ["_cmds"],
    # package_dir={'': './_cmds/'},
    package_dir={'': '.'},
    py_modules=[splitext(basename(path))[0] for path in glob('_cmds/*.py')],
    include_package_data=True,
    entry_points={
        'console_scripts': [
            f'{name} = _cmds.__main__:main',
        ]
    },
    zip_safe=False,
    classifiers=[
        'Development Status :: 2 - Pre-Alpha',
        'Intended Audience :: Education',
        'Operating System :: POSIX',
        'Operating System :: Microsoft :: Windows',
        'Programming Language :: Python',
        'Programming Language :: Python :: 3',
        'Programming Language :: Python :: 3.7',
        'Programming Language :: Python :: 3.8',
        'Programming Language :: Python :: Implementation :: CPython',
        'Topic :: Scientific/Engineering',
        'Topic :: Education'
    ],
    keywords=[
    ],
    python_requires='>=3.6',
    install_requires = [
        "PyYaml",
        # 'elstir',
        # 'elstir @ git+https://github.com/claudioperez/elstir@master',
        # 'rendre @ git+https://github.com/claudioperez/rendre@master',

        # FEDEASdoc
        "python-markdown-math",
        "pymdown-extensions",
    ]
)



