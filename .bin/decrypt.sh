#!/bin/bash
openssl enc -d -aes256 -in $1 | tar --extract --file - --gzip
#http://www.commandlinefu.com/commands/view/11584/encrypted-archive-with-openssl-and-tar
