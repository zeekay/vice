#!/bin/sh

echo "Updating vim plugins"
echo
yes | vim -c "silent! UpdateAddons" -c "q"
