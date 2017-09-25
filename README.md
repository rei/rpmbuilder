# Simple container to build RPMs. Multiple Dockerfiles included to support multiple architectures.

## Building the docker containers

#### Build rpmbuilder container (amazonlinux base)
    docker build -t rpmbuilder-amazonlinux:latest -f Dockerfile-amazonlinux .

#### Build rpmbuilder container (centos base)
    docker build -t rpmbuilder-centos:latest -f Dockerfile-centos .


<br><br>


## Building RPMs using the container image
Using any of the methods below should produce a .rpm in the rpms/ directory

#### Build Netdata for amazonlinux
```
docker run --rm -v $PWD/rpms:/home/rpmbuilder/rpmbuild/RPMS/x86_64:Z --name rpmbuilder rpmbuilder-amazonlinux:latest ./netdata.sh

# Specify a tag as a docker environment variable to build a specific version (example: v1.8.0, default is master)
docker run --rm -v $PWD/rpms:/home/rpmbuilder/rpmbuild/RPMS/x86_64:Z --name rpmbuilder -e netdataRelease=v1.8.0 rpmbuilder-amazonlinux:latest ./netdata.sh
```

#### Build Netdata for CentOS/RHEL7
```
docker run --rm -v $PWD/rpms:/home/rpmbuilder/rpmbuild/RPMS/x86_64:Z --name rpmbuilder rpmbuilder-centos:latest ./netdata.sh

# Specify a tag as a docker environment variable to build a specific version (example: v1.8.0, default is master)
docker run --rm -v $PWD/rpms:/home/rpmbuilder/rpmbuild/RPMS/x86_64:Z --name rpmbuilder -e netdataRelease=v1.8.0 rpmbuilder-centos:latest ./netdata.sh
```
