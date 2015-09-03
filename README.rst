
Docker Compose+Swarm using dind
===============================

A sandboxed swarm cluster.


Setup
-----

.. code:: sh

    docker build -t dind-swarm-slave swarm-slave/
    docker-compose up -d
    eval "$(./bin/env)"


Running ``docker`` or ``docker-compose`` commands in the shell will run them
on the ``swarm`` sandbox.
