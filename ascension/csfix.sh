
#!/bin/bash

CHANGED_FILES=$(gdf)

for FILENAME in $CHANGED_FILES; do
	if [ ${FILENAME: -4} == ".php" ]
	then
		echo fixing $FILENAME
		php-cs-fixer fix $FILENAME
	fi
done

exit
