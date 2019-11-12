FROM openjdk:11-jre

### install Saxon HE
ENV SAXON_VERSION 9.9.1-5
ENV SAXON_DOWNLOAD_SHA1 c1f413a1b810dbf0d673ffd3b27c8829a82ac31c
ENV SAXON_CP /saxon/saxon9he.jar
RUN mkdir -p /saxon && \
	curl -fSL -o ${SAXON_CP} http://central.maven.org/maven2/net/sf/saxon/Saxon-HE/${SAXON_VERSION}/Saxon-HE-${SAXON_VERSION}.jar && \
	echo ${SAXON_DOWNLOAD_SHA1} ${SAXON_CP} | sha1sum -c - && \
	chmod +x ${SAXON_CP}

### entrypoint
RUN mkdir /aggregator_mdx
WORKDIR /aggregator_mdx
ENTRYPOINT [ "java", "-jar", "/saxon/saxon9he.jar" ]
