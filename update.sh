#!/bin/sh

echo "Updating vim plugins"
echo
vim -c "for a in values(ft_addons) | silent! call vam#install#Update(a) | endfor" -c "silent! UpdateActivatedAddons" -c "q"
