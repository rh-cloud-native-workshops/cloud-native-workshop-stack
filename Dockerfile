ARG FROM_IMAGE
FROM ${FROM_IMAGE}

ENV STAGE_DIR=/tmp/stage BIN_DIR=/home/user/bin NODE_HOME=/home/user/node \
    OC_VERSION=4.5.7 \
    KNATIVE_CLI_VERSION=0.16.1 TEKTON_CLI_VERSION=0.13.1 \
    NODE_VERSION=v12.18.4
ENV PATH="${BIN_DIR}:${NODE_HOME}/bin:${PATH}"

RUN mkdir -p ${BIN_DIR} && mkdir -p ${STAGE_DIR} && cd ${STAGE_DIR} && \
    curl -sOL https://mirror.openshift.com/pub/openshift-v4/clients/ocp/${OC_VERSION}/openshift-client-linux-${OC_VERSION}.tar.gz && \
    tar xzf openshift-client-linux-${OC_VERSION}.tar.gz && \
    mv kubectl oc ${BIN_DIR} && \
    curl -sOL https://github.com/knative/client/releases/download/v${KNATIVE_CLI_VERSION}/kn-linux-amd64 && \
    chmod a+x kn-linux-amd64 && \
    mv kn-linux-amd64 ${BIN_DIR}/kn && \
    curl -sOL https://github.com/tektoncd/cli/releases/download/v${TEKTON_CLI_VERSION}/tkn_${TEKTON_CLI_VERSION}_linux_x86_64.tar.gz && \
    tar xzf tkn_${TEKTON_CLI_VERSION}_linux_x86_64.tar.gz && \
    mv tkn ${BIN_DIR} && \
    curl -sOL https://nodejs.org/dist/${NODE_VERSION}/node-${NODE_VERSION}-linux-x64.tar.gz && \
    tar xzf node-${NODE_VERSION}-linux-x64.tar.gz && \
    mv node-${NODE_VERSION}-linux-x64 ${NODE_HOME}
    
RUN rm -rf ${STAGE_DIR}

USER 10001
ENV HOME=/home/user
WORKDIR /projects
ENTRYPOINT [ "/entrypoint.sh" ]
CMD ["tail", "-f", "/dev/null"]

