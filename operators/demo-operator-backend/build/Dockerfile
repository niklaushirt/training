FROM registry.access.redhat.com/ubi7/ubi-minimal:latest

ENV OPERATOR=/usr/local/bin/demo-operator-backend \
    USER_UID=1001 \
    USER_NAME=demo-operator-backend

# install operator binary
COPY build/_output/bin/demo-operator-backend ${OPERATOR}

COPY build/bin /usr/local/bin
RUN  /usr/local/bin/user_setup

ENTRYPOINT ["/usr/local/bin/entrypoint"]

USER ${USER_UID}
