#!/usr/bin/bash

echo "Staring runbook to compile CRoaring tool..\n"

echo "Creating build environment.."
mkdir -p build
pushd build

echo "Cleaning up cached files.."
rm -rf  *

echo "cmake started.."
/usr/bin/cmake -DBUILD_STATIC=ON -DDISABLE_AVX=ON  -DDISABLE_NATIVE=ON -DCMAKE_C_COMPILER="/usr/bin/gcc_Original_backu" ..
if [ $? -ne 0 ]; then
	echo "Failed to cmake the tool.."
	exit -1
fi

echo "make/compilation sarted.."
make -j 8
if [ $? -ne 0 ]; then
	echo "Failed to make/compile the tool.."
	exit -1
fi

popd
echo "Compilation completed.."

