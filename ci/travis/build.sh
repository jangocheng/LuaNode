#! /bin/bash

set -eufo pipefail

pushd $TRAVIS_BUILD_DIR/build
if [ "$COMPILE_LUA" == "yes" ]; then
	# be explicit, or else CMake may pick the Lua package from the os)
	cmake -DBOOST_ROOT=/usr/lib -DLUA_INCLUDE_DIR=${LUA_DIR}/include -DLUA_LIBRARY=${LUA_DIR}/lib/liblua.a ..
else
	cmake -DBOOST_ROOT=/usr/lib ..
fi
cmake --build .
cp luanode luanode_d

popd
