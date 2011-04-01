#!/bin/sh

set -e

for i in $( ls -1 --hide=disabled simple ); do
	echo "\033[32mRunning test case: simple."$i"\033[0m"
	#valgrind --error-exitcode=1 --quiet --gen-suppressions=yes --tool=helgrind luanode run.lua simple.$i
	#valgrind --error-exitcode=1 --db-attach=yes --quiet --suppressions=suppressions.supp --leak-check=full --show-reachable=yes --tool=memcheck luanode run.lua simple.$i
	#valgrind --error-exitcode=1 --num-callers=30 --leak-check=full --show-reachable=yes --suppressions=suppressions.supp --gen-suppressions=yes luanode run.lua simple.$i
	luanode run.lua simple.$i

	if [ $? -ne 0 ]
	then
		echo -e "\033[1m\033[41mTest case failed: " $i "\033[0m"
		break;
	fi
done

echo "Ended without errors"
