#!/bin/bash
tar --create --file - --posix --gzip -- $1 | openssl enc -e -aes256 -out $2;
#see http://www.commandlinefu.com/commands/view/11584/encrypted-archive-with-openssl-and-tar
