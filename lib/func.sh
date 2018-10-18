#!/bin/bash
if [ $KR_DEBUG == "true" ]; then tynnyri PASSU; fi

olemassa() {
	kaiku MAN $1; man $1
	kaiku WHICH $1; which $1
	kaiku ALIAS $1; alias $1
}