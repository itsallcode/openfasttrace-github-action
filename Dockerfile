# [impl->req~run-oft-trace-command~1]
FROM eclipse-temurin:22-jre-alpine

ARG OFT_CORE_VERSION=4.1.0
ARG OFT_ASCIIDOC_PLUGIN_VERSION=0.2.0

ENV LIB_DIR=/opt/oft/lib

RUN <<EOF
mkdir -p $LIB_DIR
base_url=https://github.com/itsallcode
wget -P $LIB_DIR ${base_url}/openfasttrace/releases/download/$OFT_CORE_VERSION/openfasttrace-$OFT_CORE_VERSION.jar
wget -P $LIB_DIR ${base_url}/openfasttrace-asciidoc-plugin/releases/download/$OFT_ASCIIDOC_PLUGIN_VERSION/openfasttrace-asciidoc-plugin-$OFT_ASCIIDOC_PLUGIN_VERSION-with-dependencies.jar
EOF

COPY run-oft.sh /opt/oft/run-oft.sh 

ENTRYPOINT [ "/opt/oft/run-oft.sh" ]
