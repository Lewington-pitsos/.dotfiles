#!/bin/bash

CHANGED_FILES=$(gdf)

for FILENAME in $CHANGED_FILES do
	echo $FILENAME
done

exit
