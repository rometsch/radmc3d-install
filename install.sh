#!/usr/bin/env bash
# make a temporary dir
TMPDIR="radmc3d-install"
mdkir -p $TMPDIR
cp radmc3dPy_setuptools.patch $TMPDIR
cd $TMPDIR

# get the source code and extract
wget http://www.ita.uni-heidelberg.de/~dullemond/software/radmc-3d/radmc-3d_v0.41_07.07.17.zip
unzip radmc-3d_v0.41_07.07.17.zip

# patch the python setup script
patch -p 0 < radmc3dPy_setuptools.patch
# install radmc3dPy
cd radmc-3d/version_0.*/python
python3 setup.py install --user
cd -

# make the code
cd radmc-3d/version_0.*/src
make
# copy the executable to .local/bin if this dir exists
[[ -d ~/.local/bin ]] && cp radmc3d ~/.local/bin

