ARG FROM_IMAGE
FROM ${FROM_IMAGE}

ENV STAGE_DIR=/tmp/stage BIN_DIR=/home/user/bin \
    OC_VERSION=4.2.0 \
    KNATIVE_CLI_VERSION=0.2.0 TEKTON_CLI_VERSION=0.4.0
ENV PATH="${BIN_DIR}:${PATH}"

RUN mkdir -p ${BIN_DIR} && mkdir -p ${STAGE_DIR} && cd ${STAGE_DIR} && \
    curl -OL https://mirror.openshift.com/pub/openshift-v4/clients/ocp/${OC_VERSION}/openshift-client-linux-${OC_VERSION}.tar.gz && \
    tar xvzf openshift-client-linux-${OC_VERSION}.tar.gz && \
    mv kubectl oc ${BIN_DIR} && \
    curl -OL https://github.com/knative/client/releases/download/v${KNATIVE_CLI_VERSION}/kn-linux-amd64 && \
    chmod a+x kn-linux-amd64 && \
    mv kn-linux-amd64 ${BIN_DIR}/kn && \
    curl -OL https://github.com/tektoncd/cli/releases/download/v${TEKTON_CLI_VERSION}/tkn_${TEKTON_CLI_VERSION}_linux_x86_64.tar.gz && \
    tar xvzf tkn_${TEKTON_CLI_VERSION}_linux_x86_64.tar.gz && \
    mv tkn ${BIN_DIR}
    
RUN rm -rf ${STAGE_DIR}

ADD ./etc/settings.xml ${MAVEN_HOME}/conf/settings.xml

USER 10001
ENV HOME=/home/user
WORKDIR /projects
ENTRYPOINT [ "/entrypoint.sh" ]
CMD ["tail", "-f", "/dev/null"]

