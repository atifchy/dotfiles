#!/bin/sh
sed -i \
         -e 's/rgb(0%,0%,0%)/#1e2127/g' \
         -e 's/rgb(100%,100%,100%)/#c8ccd4/g' \
    -e 's/rgb(50%,0%,0%)/#16191d/g' \
     -e 's/rgb(0%,50%,0%)/#61afef/g' \
 -e 's/rgb(0%,50.196078%,0%)/#61afef/g' \
     -e 's/rgb(50%,0%,50%)/#21262c/g' \
 -e 's/rgb(50.196078%,0%,50.196078%)/#21262c/g' \
     -e 's/rgb(0%,0%,50%)/#c8ccd4/g' \
	"$@"
