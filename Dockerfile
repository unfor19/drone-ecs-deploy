FROM alpine:3.12

RUN apk add --update --no-cache \
    curl \
    jq \
    ca-certificates \
    bash \
    python \
    && python -m ensurepip \
    && rm -r /usr/lib/python*/ensurepip \
    && pip install --upgrade pip setuptools \
    awscli --ignore-installed \
    && rm -r /root/.cache

RUN curl https://raw.githubusercontent.com/unfor19/ecs-deploy/develop/ecs-deploy -o /bin/ecs-deploy \
    && chmod +x /bin/ecs-deploy

COPY update.sh /bin/

ENTRYPOINT ["/bin/bash"]

CMD ["/bin/update.sh"]
