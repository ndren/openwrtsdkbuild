ARG arch
ARG relver
ARG subarch

FROM zoobab/openwrtsdk:$relver-$arch-$subarch AS build-stage
ARG giturl
ARG packname
RUN [ -z "$giturl" ] && echo 'giturl is required' && exit 1 || true
RUN [ -z "$packname" ] && echo 'packname is required' && exit 1 || true
RUN echo "src-git myrepo $giturl" >> feeds.conf.default
RUN ./scripts/feeds update myrepo
RUN ./scripts/feeds install $packname
RUN make package/$packname/compile V=s
RUN make package/index V=scripts

FROM scratch AS export-stage
COPY --from=build-stage /home/openwrt/sdk /
