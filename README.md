rexster-orientdb-docker
=======================

The primary goal of this image is to provide **test** and **development** environment for OrientDB through a Rexster interface. Some configurations are "hard-coded" in config files so the containers are more predictable and require less configuration (that's easy to change).

[Rexster](https://github.com/tinkerpop/rexster/wiki) is a server that provides two vendor-independent protocols for access and modify Graph databases. It's compatible with Neo4J, OrientDB, Titan and others. Rexster project is led by [Tinkerpop](http://www.tinkerpop.com).

This container is using **Rexter 2.6.0**.

[OrientDB](http://www.orientechnologies.com/orientdb/) is an open-source distributed graph database led by [Orient Technologies](http://www.orientechnologies.com).

This container was tested against **OrientDB 2.0.3**.

This docker runs a Rexster server linked to a docker with OrientDB server.

[Gremlin](https://github.com/tinkerpop/gremlin/wiki) is a vendor-independent graph traversal language. This container enables [Gremlin Extension](https://github.com/tinkerpop/rexster/wiki/Gremlin-Extension) for Rexter, so Rexster may be executed via REST API and Rexter web console.


Getting started
---------------

1. Pull the OrientDb image: <code>docker pull vagas/orientdb</code>
2. Pull this image:  <code>docker pull vagas/rexster-orientdb</code>
3. Run OrientDB image: <code>docker run --name orientdb -d -v \<SOME-DIR-ON-YOUR-BOX\>:/opt/orientdb/databases -p 2424:2424 -p 2480:2480 vagas/orientdb</code>
4. Run this image: <code>docker run --name rexster -d -p 8182:8182 -p 8183:8183 -p 8184:8184 --link orientdb:orientdb vagas/rexster-orientdb</code>
5. Go to http://localhost:8182

All data will be saved to \<SOME-DIR-ON-YOUR-BOX\>, so you can drop and recreate the OrientDB container without lose data. If you are testing and there is no problem loosing data, remove the <code>-v  \<SOME-DIR-ON-YOUR-BOX\>:/opt/orientdb/databases</code> from step 3 above.

Default databases
-----------------

The *vagas/orientdb* images is pre-configured with 2 databases:

1. An in-memory database called "test". Perfect for automated tests.
2. An local storage database called "development". Good to create data containers with database in different states.

Please, refer to [*vagas/orientdb* README](https://github.com/VAGAScom/orientdb-docker/blob/master/README.md) if you want to change that.

Mapped ports
------------

* Port 2480 is OrientDB web console.
* Port 2424 is OrientDB RexPro protocol.
* Port 8184 is Rexster web console and REST API.
* Port 8182 access the database via RexPro binary protocol (useful for [rexpro-ruby](https://github.com/lann/rexpro-ruby) gem)
* Port 8183 is Rexster shutdown port: <code>telnet localhost 8183</code>, then <code>sw</code> ("s" stops and "status" reports shutdown status)

Connect to other databases
---------------------------

You can add your own *rexster.xml* configuration when running this image.

Replace **step 4** above to:

<code>docker run --name rexster -d -p 8182:8182 -p 8183:8183 -p 8184:8184 -v \<DIR-WITH-REXSTER-XML-INSIDE\>:/opt/rexster/config --link orientdb:orientdb vagas/rexster-orientdb</code>

Where is a directory in the host with *rexster.xml* inside.
