
Docker Compose+Swarm using dind
===============================

A sandboxed swarm cluster.

.. contents::
    :backlinks: none


Setup
-----

.. code:: sh

    docker-compose up -d
    eval "$(./bin/env)"


Running ``docker`` or ``docker-compose`` commands in the shell will run them
on the ``swarm`` sandbox.


Features
--------

Scale the number of swarm slaves or masters
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

To increase or decrease the number of swarm slaves, run `docker-compose scale`.
They will auto-join the cluster.

.. code:: sh

    docker-compose scale swarm.slave=3


To scale the number of master replicas:

.. code:: sh

    docker-compose scale swarm.master=3


Discovery Backends
------------------

The master branch uses `zookeeper` as a discovery backend. There are also
`with_etcd`, and `with_consul` branches which use other discovery backends.
