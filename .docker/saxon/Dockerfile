FROM eclipse-temurin:17-jre

### Install Saxon HE (11.6)
ENV SAXON_VERSION=11.6
ENV SAXON_DOWNLOAD_SHA1=09bdbb195580875f3ffb084eaf9ac7a7482776b5
ENV SAXON_JAR=/saxon/saxon-he.jar

RUN mkdir -p /saxon && \
    curl -fSL -o ${SAXON_JAR} \
      https://repo1.maven.org/maven2/net/sf/saxon/Saxon-HE/${SAXON_VERSION}/Saxon-HE-${SAXON_VERSION}.jar && \
    echo "${SAXON_DOWNLOAD_SHA1}  ${SAXON_JAR}" | sha1sum -c - && \
    chmod 644 ${SAXON_JAR}

### Install XMLResolver (to support XML Catalog resolution)
ENV XMLRESOLVER_VERSION=5.2.2
ENV XMLRESOLVER_JAR=/saxon/xmlresolver.jar

RUN curl -fSL -o ${XMLRESOLVER_JAR} \
    https://repo1.maven.org/maven2/org/xmlresolver/xmlresolver/${XMLRESOLVER_VERSION}/xmlresolver-${XMLRESOLVER_VERSION}.jar && \
    chmod 644 ${XMLRESOLVER_JAR}

### Create wrapper script that runs Saxon with the correct classpath
RUN printf '%s\n' \
  '#!/bin/sh' \
  'exec java -cp "/saxon/saxon-he.jar:/saxon/xmlresolver.jar" net.sf.saxon.Transform "$@"' \
  > /usr/local/bin/saxon && \
  chmod +x /usr/local/bin/saxon

ENV SAXON=/usr/local/bin/saxon

### Runtime environment
RUN mkdir /aggregator_mdx
WORKDIR /aggregator_mdx

ENTRYPOINT ["saxon"]
