#!/bin/bash
set -e
rm -r outdir || true
mkdir outdir
clang -o rewrite_lc_build -Wall -Os rewrite_lc_build.c
xcode_path="$(xcode-select -p)"
simpath="$xcode_path/Platforms/iPhoneOS.platform/Library/Developer/CoreSimulator/Profiles/Runtimes/iOS.simruntime/Contents/Resources/RuntimeRoot"

for i in AvatarKit AvatarUI
do
	cp -r "$simpath/System/Library/PrivateFrameworks/$i.framework" outdir/
	./rewrite_lc_build outdir/$i.framework/$i outdir/$i.framework/$i
done
