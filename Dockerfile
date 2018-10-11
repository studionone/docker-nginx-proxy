FROM neilpang/nginx-proxy

LABEL project="studionone/nginx-proxy"
LABEL maintainer="Studio None <developers@studionone.com.au>"
LABEL author="Studio None <developers@studionone.com.au>"
LABEL homepage="https://hub.docker.com/r/studionone/nginx-proxy"
LABEL git_repository="https://github.com/studionone/docker-nginx-proxy.git"

# Adds configuration to:
# - raise file upload size limit to 4GB
# - extend connection timeouts to 10 minutes

RUN sed -i -e 's/client_max_body_size 4g;//g' /etc/nginx/conf.d/default.conf

RUN ( echo "client_max_body_size 4G;" && echo "client_body_buffer_size 500M;") > /etc/nginx/conf.d/client_max_body_size.conf
RUN ( echo "proxy_read_timeout 3600;" && echo "proxy_send_timeout 3600;" && echo "fastcgi_read_timeout 3600;") > /etc/nginx/conf.d/connection_timeouts.conf
