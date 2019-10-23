#!/bin/bash
set -e
. llvm_path.conf
rm -r metaltmp metaltmp2 || true
mkdir metaltmp metaltmp2
cd metaltmp
python3 ../unmetallib.py ../outdir/AvatarKit.framework/default.metallib
for i in out_*.air
do
	"$llvm/llvm-dis" -o=- $i|\
		sed -e "s/air64-apple-ios13\.0\.0-simulator/air64-apple-ios13.0.0-macabi/" | \
		"$llvm/llvm-as" -o=../metaltmp2/$i
done
cd ..
xcrun metallib -o default.metallib metaltmp2/*
