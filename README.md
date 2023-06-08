# Build your own Personal Package Archive (PPA) for OpenWRT in Gitlab

This project is using the OpenWRT SDK packaged into a Docker image, built from https://github.com/zoobab/openwrtsdk.

Available docker images with the SDK:

https://hub.docker.com/r/zoobab/openwrtsdk/tags

This is an example of an helloworld project written in C++ (https://github.com/zoobab/openwrt_helloworld):

```
$ export giturl="https://github.com/zoobab/openwrt_helloworld"
$ export packname="helloworld"
$ export sdk_image="zoobab/openwrtsdk:21.02.0-rc4-sunxi-cortexa53"
$ docker build --output type=local,dest=artifacts --build-arg giturl="$giturl" --build-arg packname="$packname" --build-arg sdk_image="$sdk_image" .
```

## TODO

* Publish artifacts in a package repository (maybe in debian format as ipk is similar?)
* Rebuild the SDKs with more recent versions of OpenWRT
* A drop-down list to choose your SDK/URL/packagename in Gitlab-CI parameters

## Links

* Helloworld in CPP for OpenWRT: https://github.com/zoobab/openwrt_helloworld
* OpenWRT SDK in a docker image: https://github.com/zoobab/openwrtsdk
* List of available tags https://hub.docker.com/r/zoobab/openwrtsdk/tags
* Freifunk blog: GSoC2023: Documenting the OpenWrt compilation process to set up a PPA: https://blog.freifunk.net/2023/05/13/gsoc-23-documenting-the-openwrt-compilation-process-to-set-up-a-ppa/

