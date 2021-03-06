#!/bin/bash

DASHCAM_NAME=$1
DASHCAM_PATH=
ARCHIVE_PATH=
DAYS=

for filename in $(find $DASHCAM_PATH/$DASHCAM_NAME -type f -mtime +$DAYS); do
	datestring=$(echo "${filename}" | grep -Po '\d{8}')
	year=${datestring:0:4}
	month=${datestring:4:2}
	day=${datestring:6:2}
	directory="${year}/${month}/${day}/"
	mkdir -p $ARCHIVE_PATH/$DASHCAM_NAME/"${directory}"
	mv -n "${filename}" $ARCHIVE_PATH/$DASHCAM_NAME/"${directory}"
done
