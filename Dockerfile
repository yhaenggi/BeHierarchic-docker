FROM golang:1.24 AS build

WORKDIR /tmp

RUN git clone https://github.com/elliotnunn/BeHierarchic.git
WORKDIR /tmp/BeHierarchic
RUN CGO_ENABLED=0 go build -ldflags '-extldflags "-static"'

FROM scratch

COPY --from=build /tmp/BeHierarchic/BeHierarchic /BeHierarchic

USER 1000

CMD [ "/BeHierarchic", "0.0.0.0:1997" , "/"]
