FROM openjdk:11-jre

### install Saxon HE
ENV SAXON_VERSION 9.9.1-5
ENV SAXON_DOWNLOAD_SHA1 c1f413a1b810dbf0d673ffd3b27c8829a82ac31c
ENV SAXON_CP /saxon/saxon9he.jar
RUN mkdir -p /saxon && \
	curl -fSL -o ${SAXON_CP} http://central.maven.org/maven2/net/sf/saxon/Saxon-HE/${SAXON_VERSION}/Saxon-HE-${SAXON_VERSION}.jar && \
	echo ${SAXON_DOWNLOAD_SHA1} ${SAXON_CP} | sha1sum -c - && \
	chmod +x ${SAXON_CP}

### install XSpec
ENV XSPEC_VERSION=1.3.0
ENV XSPEC_HOME /xspec
RUN curl -fSL -o xspec-${XSPEC_VERSION}.tar.gz https://github.com/xspec/xspec/archive/v${XSPEC_VERSION}.tar.gz && \
	tar xvzf xspec-${XSPEC_VERSION}.tar.gz && \
	mv /xspec-${XSPEC_VERSION} /xspec && \
	rm xspec-${XSPEC_VERSION}.tar.gz

### copy over files, only used in CI/CD
COPY . /aggregator_mdx

### entrypoint
WORKDIR /aggregator_mdx
ENTRYPOINT ["/xspec/bin/xspec.sh"]
CMD ["-h"]
