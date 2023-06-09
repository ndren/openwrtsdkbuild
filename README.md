# Build your own Personal Package Archive (PPA) for OpenWRT in Gitlab

This project is using the OpenWRT SDK packaged into a Docker image, built from https://github.com/zoobab/openwrtsdk.

Available docker images with the SDK:

https://hub.docker.com/r/zoobab/openwrtsdk/tags

This is an example of an helloworld project written in C++ (https://github.com/zoobab/openwrt_helloworld):

```
$ export GIT_URL="https://github.com/zoobab/openwrt_helloworld"
$ export PACK_NAME="helloworld"
$ export SDK_IMAGE="zoobab/openwrtsdk:21.02.0-rc4-sunxi-cortexa53"
$ docker build --output type=local,dest=artifacts --build-arg GIT_URL="$GIT_URL" --build-arg packname="$PACK_NAME" --build-arg sdk_image="$SDK_IMAGE" .
```

## TODO

* Publish artifacts in a package repository (maybe in debian format as ipk is similar?)
* Rebuild the SDKs with more recent versions of OpenWRT
* A drop-down list to choose your SDK/URL/packagename in Gitlab-CI parameters
* Add an architecture diagram
* Try self-hosted gitlab
* Implement a test stage in the pipeline to add the URL, install the package and run it

## Links

* Helloworld in CPP for OpenWRT: https://github.com/zoobab/openwrt_helloworld
* OpenWRT SDK in a docker image: https://github.com/zoobab/openwrtsdk
* List of available tags https://hub.docker.com/r/zoobab/openwrtsdk/tags
* Freifunk blog: GSoC2023: Documenting the OpenWrt compilation process to set up a PPA: https://blog.freifunk.net/2023/05/13/gsoc-23-documenting-the-openwrt-compilation-process-to-set-up-a-ppa/
* Issue with WARNINGs in builds: https://forum.openwrt.org/t/run-scripts-feeds-update-a-and-scripts-feeds-install-a-have-some-warning/68197/5 
