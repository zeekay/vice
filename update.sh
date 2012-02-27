#!/bin/sh

echo "Updated vim plugins"
echo
yes | vim -c "UpdateAddons" -c ":q"
