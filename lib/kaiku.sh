#!/bin/bash
if [ $KR_DEBUG == "true" ]; then echo "[[ KRAKEN/KAIKU ]]"; fi
TYNNYRI=""

kaiku80() {
	echo 12345678901234567890123456789012345678901234567890123456789012345678901234567890
}

verboosi() {
	if [ $KR_DEBUG == "true" ]; then echo "[[ $1 $2 $3 $4 ]]"; fi
}
