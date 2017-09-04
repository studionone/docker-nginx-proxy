FROM jwilder/nginx-proxy

MAINTAINER Studio None <developers@studionone.com.au>
LABEL \
    project="studionone/shale" \
    maintainer="Studio None <developers@studionone.com.au>" \
    author="Studio None <developers@studionone.com.au>" \
    homepage="https://hub.docker.com/r/studionone/nginx-proxy" \
    git_repository="https://github.com/studionone/docker-nginx-proxy.git"

RUN ( \
        echo "client_max_body_size 4g;" \
    ) > /etc/nginx/conf.d/client_max_body_size.conf \
    && ( \
        echo "proxy_read_timeout 600;" && \
        echo "proxy_send_timeout 600;" && \
        echo "fastcgi_read_timeout 600;" \
    ) > /etc/nginx/conf.d/connection_timeouts.conf
