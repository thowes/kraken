#!/bin/bash
#git.sh from kir_proj.sh, L 23.1.2014
if [ $VERBOSITY -ge $LEV_V ]; then tynnyri GIT; fi

git_projekti_cim() {
	debug "GIT/CIM"
	read -p "INCLUDE COMMIT MESSAGE: " -r KR_COMMIT
	git commit -m $KR_COMMIT
}
