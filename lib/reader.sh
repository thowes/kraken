#!/bin/bash
#bmread.sh, L 25.3.2013/9.6.2014
if [ $VERBOSITY -ge $LEV_V ]; then tynnyri READER; fi

reader() {
	case $1 in 
		deli) reader_deli $2;;
		*) echo foofoo;;
	esac
}

reader_deli() {
	if [ -f $1 ]; then 
		echo START
		k=1
		while read line; do 
			#awk -F" " 
			echo "L#$k $line"
			((k++))
		done < $1
	fi
}

# 1 grep with only DT
# 2 split to substrings (awk) on < and >
# 3 firget DT part, and take <a part
# 4 split to substring on " "
# 5 take the href-starting substring, save to $bm_URL
# take the ADD-Date substring asnd save as BM-date
# 6 take the TAGS-starting part, split to substrings on ","
# 7 save each substring to tagname.lst
# 8 take the substring between > < which is the link title
# 9 print the resulted info
# 10 save the line to tagname
# or just parse the whole doc with awk -F"<""
