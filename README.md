# Build your own Personal Package Archive (PPA) for OpenWRT in Gitlab

This project is using the OpenWRT SDK packaged into a Docker image, built from https://github.com/zoobab/openwrtsdk.

Available docker images with the SDK:

https://hub.docker.com/r/zoobab/openwrtsdk/tags

This is an example of an helloworld project written in C++ (https://github.com/zoobab/openwrt_helloworld):

```
$ export giturl="https://github.com/zoobab/openwrt_helloworld
$ export packname="helloworld"
$ export sdk_image="zoobab/openwrtsdk:21.02.0-rc4-sunxi-cortexa53"
$ docker build --output type=local,dest=artifacts --build-arg giturl="$giturl" --build-arg packname="$packname" --build-arg sdk_image="$sdk_image" .
```

## TODO

* Publish artifacts in a package repository (maybe in debian format as ipk is similar?)
* Rebuild the SDKs with more recent versions of OpenWRT

