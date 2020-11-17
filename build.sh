#!/bin/bash
rm -f Magisk_Riru_EnableOOSNativeCallRecording.zip
rm -f ./fileList.txt
rm -rf ./*.sha256sum
find * ! -type d -print >> ./fileList.txt
cat ./fileList.txt |grep sha256sum | while read line
do
    rm -f $line
done

cat ./fileList.txt | while read line
do
 if [[ $line == *.sha256sum ]];then
    rm -f $line
    continue
 fi
    sha256sum $line | awk '{print $1}' > ./$line.sha256sum
done

zip -r Magisk_Riru_EnableOOSNativeCallRecording.zip ./*
sha256sum Magisk_Riru_EnableOOSNativeCallRecording.zip | awk '{print $1}' | sed 's/\n//g' > Magisk_Riru_EnableOOSNativeCallRecording.zip.sha256sum



