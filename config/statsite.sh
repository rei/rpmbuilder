#!/bin/bash
cd ~
rm -rf statsite
git clone https://github.com/statsite/statsite.git
./autogen.sh
./configure && make && make rpms RPMBUILDROOT=~/rpmbuild
mv ~/rpmbuild/*.rpm ~/rpmbuild/RPMS/
