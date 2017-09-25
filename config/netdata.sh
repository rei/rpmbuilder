#!/bin/bash
cd ~
rm -rf netdata/
netdataRelease=${netdataRelease:-master}
git clone --branch ${netdataRelease} https://github.com/firehol/netdata.git --depth=1
cd netdata
autoreconf -ivf
./configure && make dist
/bin/cp -f netdata-*.tar.xz netdata.spec ~/rpmbuild/SOURCES/
rpmbuild -bb ~/rpmbuild/SOURCES/netdata.spec --without nfacct

# TODO: sign RPM, upload to s3 automagically
# gpg2 --export-secret-keys --armor your@email.com
