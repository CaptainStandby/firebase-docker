FROM debian:bullseye-slim

RUN apt-get update \
	&& export DEBIAN_FRONTEND=noninteractive \
	&& apt-get -y install --no-install-recommends \
	default-jre \
	curl \
	&& apt-get clean \
	&& rm -rf /var/lib/apt/lists/*

RUN curl -Lo /usr/local/bin/firebase https://firebase.tools/bin/linux/latest && chmod +x /usr/local/bin/firebase

ENV WORKDIR=/workdir
RUN mkdir ${WORKDIR}
VOLUME ${WORKDIR}

COPY ./entrypoint.sh /

ENTRYPOINT ["/entrypoint.sh"]
CMD ["firebase"]
