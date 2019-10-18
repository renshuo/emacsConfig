#!/bin/sh
source emacs.env

/usr/bin/mbsync -Va 
/usr/bin/mu index -m ~/.mail/qqmail
