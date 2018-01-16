#!/bin/bash

cd panel_src
npm install
npm run build

rm -rf ../panel
cp -r dist ../panel

cd .. 
if [ "$1" == "pack" ] ; then
    
    rm -rf pack
    mkdir pack
    mkdir pack/ps-workflow
    pack_path=./pack/ps-workflow

    cp -r CSXS $pack_path
    cp -r jsx $pack_path
    cp -r panel $pack_path
    cp CHANGELOG.md $pack_path
    cp README.md $pack_path
    cp LICENSE $pack_path

    cd $pack_path/..    
    tar -cf ps-workflow.tar *
    tar -tf ps-workflow.tar > filelist.txt
    echo ""
    echo "--- File List ---"
    cat filelist.txt
fi