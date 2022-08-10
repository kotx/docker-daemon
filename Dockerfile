FROM docker:dind

RUN apk add bash ip6tables pigz sysstat procps lsof gcompat

COPY etc/docker/daemon.json /etc/docker/daemon.json

COPY ./entrypoint ./entrypoint
COPY ./docker-entrypoint.d/* ./docker-entrypoint.d/

ENV DOCKER_TMPDIR=/data/docker/tmp

ENTRYPOINT ["./entrypoint"]

CMD ["dockerd", "-p", "/var/run/docker.pid"]
