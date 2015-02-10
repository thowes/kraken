#!/bin/bash
#def/dirs.sh, L 31.3.2013/25.7.2013
if [ $VERBOSITY -ge $LEV_V ]; then tynnyri DIRS; fi

# Base or home directory
KR_DIR_BASE=~

# Your configuration directory
KR_DIR_CFG=$KR_DIR_BASE/proj/config

# Desktop directory
KR_DIR_DT=$KR_DIR_BASE/Desktop

# Exclude (for rsync) directory
KR_DIR_EXCL=$KR_DIR_BASE/proj/config/exclude

KR_DIR_FAV=$KR_DIR_BASE/proj/favorites

# HOST/COMPUTER specific config directory
#KR_DIR_HOST=$KR_DIR_BASE/proj/config/$hostname

# Kraken library directory
KR_DIR_LIB=$KR_DIR_BASE/proj/kraken/lib

# Storage directory for desktop links (or shortcuts in cygwin). Used by
# the jaax command.
KR_DIR_LNK=$KR_DIR_BASE/proj/lnks

# my project directory contains symbolic links to all project directories I
# want to access from command line. Directory required by projekti command. 
KR_DIR_PROJ=$KR_DIR_BASE/proj

# quick launch directory (cygwin)
KR_DIR_QL=$KR_DIR_BASE/proj/ql

# resources directory
KR_DIR_RES=$KR_DIR_BASE/proj/res

# SendTo directory (cygwin/windows)
KR_DIR_SENDTO=$KR_DIR_BASE/proj/sendto

# websites directory, full path
KR_DIR_SITES=$KR_DIR_BASE/proj/sites

# Startup programs directory (cygwin)
KR_DIR_STARTUP=$KR_DIR_BASE/proj/startup

# Templates directory, used by the uus command.
KR_DIR_TMPL=$KR_DIR_BASE/proj/res/tmpl
