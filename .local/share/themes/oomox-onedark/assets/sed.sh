#!/bin/sh
sed -i \
         -e 's/#1e2127/rgb(0%,0%,0%)/g' \
         -e 's/#c8ccd4/rgb(100%,100%,100%)/g' \
    -e 's/#16191d/rgb(50%,0%,0%)/g' \
     -e 's/#61afef/rgb(0%,50%,0%)/g' \
     -e 's/#21262c/rgb(50%,0%,50%)/g' \
     -e 's/#c8ccd4/rgb(0%,0%,50%)/g' \
	"$@"
