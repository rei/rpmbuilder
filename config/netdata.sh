#!/bin/bash
cd ~
rm -rf netdata/
netdataRelease=${netdataRelease:-master}
git clone --branch ${netdataRelease} https://github.com/firehol/netdata.git --depth=1
netdata/contrib/rhel/build-netdata-rpm.sh
