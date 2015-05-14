kraken.sh
=========

kraken.sh is my shell script collection. The collection existed first in private svn repository for 100+ revisions, then it was migrated to github. It doesn't quite work out of the box yet, although I'm working on it. Use at your own risk.

Requirements
------------

To fully use kraken.sh, it is assumed that your command line environment has at least the following:

* git
* ssh
* rsync
* wget


Installation
------------

First, clone the repository to your local environment:

		git clone https://github.com/thowes/kraken.git


Go to the kraken.sh directory:

		cd kraken


Then run the install command:

		. install.sh

That command copies default configuration files from 'def/'' directory to 'cfg/'' directory under 'kraken/'' directory. If you want to use another directory for configuration files, use instead:

		. install.sh /your/directory