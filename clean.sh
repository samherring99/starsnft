#!/bin/bash

echo "Removing descriptions..."

cd desc

rm ./*

cd ..

rmdir desc

echo "Removing images..."

cd images

rm ./*.png

cd ..

rmdir images

rm minting_x6.png

rm coverimage.png

echo "Directory cleaned!"
