kraken.sh
=========

kraken.sh is a collection of my shell scripts. I use these shell scripts to automate tasks (such as backup) and to increase contextual awareness of my laptop. The collection existed first in private svn repository for 100+ revisions, then it was migrated to github. It doesn't quite work out of the box yet, although I'm working on it. Use at your own risk.

NOTE: This project has _nothing_ todo with Mozilla's kraken JS benchmark tool. My project got it's name before I knew about Mozilla's kraken project. I'll eventually get to renaming this project to something else when I get an inspiration for a good name. 

Requirements
------------

To fully use kraken.sh, it is assumed that your command line environment has at least the following tools:

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


Configuration
-------------

In the cfg-directory you just created, there are five files for configuration:

* compu.sh
* kerain.sh
* kraken.cfg
* nets.sh
* proj.csv