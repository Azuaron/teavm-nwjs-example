#!/bin/sh

"${NPM_CONFIG_PREFIX}"/bin/nwbuild -p linux64 -v "${NWJS_VERSION}" --cacheDir "${NWJS_CACHE_DIR}" package

#  -p, --platforms      Platforms to build, comma-sperated, can be: win32,win64,osx32,osx64,linux32,linux64   ['osx64', 'win32', 'win64']
