FROM python:3.9.1-alpine3.12

RUN apk add --update --no-cache \
    curl jq ca-certificates bash \
    && rm -rf /var/cache/apk/*

RUN pip install -U pip && \
    pip install -U awscli

RUN curl https://raw.githubusercontent.com/unfor19/ecs-deploy/develop/ecs-deploy -o /bin/ecs-deploy \
    && chmod +x /bin/ecs-deploy

COPY update.sh /bin/

ENTRYPOINT ["/bin/bash"]

CMD ["/bin/update.sh"]
