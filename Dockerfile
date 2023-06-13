ARG SDK_IMAGE

FROM $SDK_IMAGE AS build-stage
ARG GIT_URL
ARG PACK_NAME
RUN [ -z "$GIT_URL" ] && echo 'GIT_URL is required' && exit 1 || true
RUN [ -z "$PACK_NAME" ] && echo 'PACK_NAME is required' && exit 1 || true
RUN echo "src-git myrepo $GIT_URL" >> feeds.conf.default
RUN ls -lha
RUN rm -Rfv tmp/
RUN ./scripts/feeds update myrepo
RUN ./scripts/feeds install $PACK_NAME
RUN ./scripts/feeds update -i myrepo
RUN ./scripts/feeds install -a -f $PACK_NAME
RUN make package/$PACK_NAME/compile
RUN make package/index

FROM scratch AS export-stage
COPY --from=build-stage /home/openwrt/sdk/bin /
