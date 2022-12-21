# External monitoring config using docker-compose 

### Example of external monitoring an app using:
* Grafana
* Loki
* Promtail
* Prometheus
* alertmanager
* cadvisor

The app is a simple container that prints "Hello world". This container would be replaced with the real app with a prometheus library: [prometheus client libs](https://prometheus.io/docs/instrumenting/clientlibs/)

## How to run:

### Build and start containers:
`docker-compose up`

### Stop containers:
`docker-compose down`

### Open links in-browser:
`http://localhost:<PORT_HERE>` -> check ports inside [docker-compose.yml](docker-compose.yml)

### If the containers don't stop
Restart the docker service. Some recipes are available in the [just](just) file. Or using [https://github.com/casey/just](https://github.com/casey/just).
