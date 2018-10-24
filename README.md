storm-rpmbuild
---------
A set of scripts to package storm into an rpm.
Requires **CentOS/RedHat 7**.

#### Tarball Source
-----
Presently we are downloading `tarballs` from [storm.apache.org](http://storm.apache.org/).

#### Setup
-----
    sudo yum install make rpmdevtools

#### Building
--------
Use `Make`

    make rpm

or use `Docker`. Environment variable `storm_version` can be used to change storm `versions`

    docker build -t storm-build . && docker run -ti -v $(pwd)/RPMS:/repo/x86_64/ -e storm_version="1.2.2" storm-build


Resulting RPM will be avaliable at `$(pwd)/RPMS`

#### Installing and operating
------------------------
```
sudo yum install storm*.rpm
sudo systemctl start storm
sudo systemctl enable storm
```

storm cli is avaiable in `/usr/local/storm/bin`

#### Locations
-----------------
|Items | Default Locations  |
|:------------- |:-------------|
| Binaries     | `/usr/local/storm` |
| Data      |`/usr/local/storm/data`|
| Logs      | `/usr/local/storm/logs`|
| Configs| `/usr/local/storm/conf`, `/etc/sysconfig/storm`|