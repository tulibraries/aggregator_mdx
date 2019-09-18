FROM openjdk:8-jre

ENV XSPEC_VERSION=1.3.0
ENV SAXON_VERSION=9.9.1-4

# install XSpec
RUN curl -fSL -o xspec-${XSPEC_VERSION}.tar.gz https://github.com/xspec/xspec/archive/v${XSPEC_VERSION}.tar.gz && \
	tar xvzf xspec-${XSPEC_VERSION}.tar.gz && \
	mv /xspec-${XSPEC_VERSION} /xspec && \
	rm xspec-${XSPEC_VERSION}.tar.gz
ENV XSPEC_HOME /xspec
RUN mkdir -p /transforms

WORKDIR /xspec

# install Saxon HE
ENV SAXON_DOWNLOAD_SHA1 96574cbdfeea782b252a071d0c33295f4ff543ca
RUN mkdir -p saxon && \
	export SAXON_CP=/xspec/saxon/saxon9he.jar && \
	curl -fSL -o ${SAXON_CP} http://central.maven.org/maven2/net/sf/saxon/Saxon-HE/${SAXON_VERSION}/Saxon-HE-${SAXON_VERSION}.jar && \
	echo ${SAXON_DOWNLOAD_SHA1} ${SAXON_CP} | sha1sum -c - && \
	chmod +x ${SAXON_CP}
ENV SAXON_CP /xspec/saxon/saxon9he.jar

# use non-privileged user to run xspec
RUN groupadd -r xspec && \
    useradd -s /bin/bash -r -g xspec xspec && \
 	chown xspec:xspec -R /xspec && \
	chown xspec:xspec -R /transforms
USER xspec

ENTRYPOINT ["/xspec/bin/xspec.sh"]
CMD ["-h"]
