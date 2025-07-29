FROM golang:1.24 AS build

ARG VERSION
ENV VERSION=${VERSION}

WORKDIR /tmp

RUN git clone https://github.com/elliotnunn/BeHierarchic.git
WORKDIR /tmp/BeHierarchic
RUN git checkout ${VERSION}
RUN CGO_ENABLED=0 nice -n 10 go build -ldflags '-extldflags "-static"'

FROM scratch

COPY --from=build /tmp/BeHierarchic/BeHierarchic /BeHierarchic

USER 1000

CMD [ "/BeHierarchic", "0.0.0.0:1997" , "/"]
