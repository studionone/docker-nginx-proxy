FROM studionone/nginx-proxy-clean

LABEL project="studionone/nginx-proxy"
LABEL maintainer="Studio None <developers@studionone.com.au>"
LABEL author="Studio None <developers@studionone.com.au>"
LABEL homepage="https://hub.docker.com/r/studionone/nginx-proxy"
LABEL git_repository="https://github.com/studionone/docker-nginx-proxy.git"

# Adds configuration to:
# - raise file upload size limit to 4GB
# - extend connection timeouts to 10 minutes