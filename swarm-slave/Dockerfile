# TODO: this hack could be removed by using machine to spin up the nodes
# or if docker provided some way to auto-start containers.
# Another slight imporvement might be to use s6 to start the container.

FROM    dockerswarm/dind:1.8.1

COPY    start.sh /opt/start.sh
ENTRYPOINT  ["bash", "/opt/start.sh"]
