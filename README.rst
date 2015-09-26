
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

To increase or decrease the number of swarm slaves, run ``docker-compose scale``.
They will auto-join the cluster.

.. code:: sh

    docker-compose scale swarm.slave=3


To scale the number of master replicas:

.. code:: sh

    docker-compose scale swarm.master=3


Discovery Backends
------------------

The default discovery backend is ``zookeeper``. To use ``etcd`` or ``consul``
as the discovery backends you can run ``docker-compose`` with one of the extra
``with-*.yml`` files.

.. note::

   This requires features only available in the (upcoming) docker-compose 1.5
   release.

.. code:: sh

    docker-compose -f docker-compose.yml -f with-etcd.yml up


Troubleshooting
---------------

Docker-in-docker and storage drivers
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

If the ``swarm.slave`` containers fail to start with an error about
``Error starting daemon: error initializing graphdriver: driver not supported``
you can adjust the storage in ``docker-compose.yml`` with the ``DOCKER_ARGS``
environment variable.

The default storage driver is ``overlay``, but it may not be available on your
kernel.
