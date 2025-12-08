<<<<<<< HEAD
FROM eclipse-temurin:17-jre

### install Saxon HE
<<<<<<< HEAD
ENV SAXON_VERSION=11.6
ENV SAXON_DOWNLOAD_SHA1=09bdbb195580875f3ffb084eaf9ac7a7482776b5

RUN mkdir -p /saxon && \
    curl -fSL -o /saxon/saxon-he.jar \
      https://repo1.maven.org/maven2/net/sf/saxon/Saxon-HE/${SAXON_VERSION}/Saxon-HE-${SAXON_VERSION}.jar && \
    echo "${SAXON_DOWNLOAD_SHA1}  /saxon/saxon-he.jar" | sha1sum -c - && \
    chmod +x /saxon/saxon-he.jar

### install XMLResolver (required for XSpec schematron)
ENV XMLRESOLVER_VERSION=5.2.2
RUN curl -fSL -o /saxon/xmlresolver.jar \
    https://repo1.maven.org/maven2/org/xmlresolver/xmlresolver/${XMLRESOLVER_VERSION}/xmlresolver-${XMLRESOLVER_VERSION}.jar
=======
ENV SAXON_VERSION=9.9.1-5
ENV SAXON_DOWNLOAD_SHA1=c1f413a1b810dbf0d673ffd3b27c8829a82ac31c
ENV SAXON_CP=/saxon/saxon9he.jar
RUN apk add --no-cache curl bash && \
	mkdir -p /saxon && \
=======
FROM openjdk:11-jre

### install Saxon HE
ENV SAXON_VERSION 9.9.1-5
ENV SAXON_DOWNLOAD_SHA1 c1f413a1b810dbf0d673ffd3b27c8829a82ac31c
ENV SAXON_CP /saxon/saxon9he.jar
RUN mkdir -p /saxon && \
>>>>>>> 211b988 (Revert changes made to Dockerfile)
	curl -fSL -o ${SAXON_CP} https://repo1.maven.org/maven2/net/sf/saxon/Saxon-HE/${SAXON_VERSION}/Saxon-HE-${SAXON_VERSION}.jar && \
	echo ${SAXON_DOWNLOAD_SHA1} ${SAXON_CP} | sha1sum -c - && \
	chmod +x ${SAXON_CP}
>>>>>>> 9566f96 (Use updated syntax for ENV)

### install XSpec
ENV XSPEC_VERSION=2.3.2
ENV XSPEC_HOME=/xspec

RUN curl -fSL -o xspec-${XSPEC_VERSION}.tar.gz \
      https://github.com/xspec/xspec/archive/refs/tags/v${XSPEC_VERSION}.tar.gz && \
    tar xvzf xspec-${XSPEC_VERSION}.tar.gz && \
    mv /xspec-${XSPEC_VERSION} /xspec && \
    rm xspec-${XSPEC_VERSION}.tar.gz

### remove bundled Saxon jars
RUN rm -f /xspec/java/saxon*.jar

### set classpath used by xspec.sh
ENV SAXON_CP="/saxon/saxon-he.jar:/saxon/xmlresolver.jar"

### entrypoint
WORKDIR /aggregator_mdx
ENTRYPOINT ["/bin/bash", "/xspec/bin/xspec.sh"]
CMD ["-h"]
