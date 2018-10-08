# docker-nginx-proxy
Customised build of [neilpang/nginx-proxy](https://github.com/neilpang/nginx-proxy) with some extra config for development such as:

- Raised file upload size limit to 4GB.
- Extended connection timeouts to 10 minutes.

The proxy makes use of the local network we all at Studio None should have running. If not, run `docker network create localdev`. All other running projects in the machine should be updated accordingly.

## docker-compose.yml example
We used to have projects running like this:
```
version: '3.7'
services:
  mysql:
    container_name: db-service
    image: mariadb:10
    network_mode: bridge
    restart: on-failure
  web:
    container_name: web-service
    image: php:7.2
    network_mode: bridge
    restart: on-failure
    links:
    - mysql
    depends_on:
    - mysql
```

The above meaning that the `web` service was running in the default network with the `bridge` driver. Because we are using a custom network, `localdev`, we need to update stuff like the above example to:
```
version: '3.7'
networks:
  customnetworkname:
    external: true
    name: localdev
services:
  mysql:
    container_name: db-service
    image: mariadb:10
    networks:
    - customnetworkname
    restart: on-failure
  web:
    container_name: web-service
    image: php:7.2
    networks:
    - customnetworkname
    restart: on-failure
    depends_on:
    - mysql
```
As you probably noticed, `links` is gone, as there is a better networking going on behind the scenes. Each project should have a unique network name to make things easier in production (ie host resolving). In this example, we are aliasing `localdev` with `customnetworkname`.
