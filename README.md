rexster-orientdb-docker
=======================

[Rexster](https://github.com/tinkerpop/rexster/wiki) is a server that provides two vendor-independent protocols for access and modify Graph databases. It's compatible with Neo4J, OrientDB, Titan and others. Rexster project is led by [Tinkerpop](http://www.tinkerpop.com).

This container is using **Rexter 2.6.0**.

[OrientDB](http://www.orientechnologies.com/orientdb/) is an open-source distributed graph database led by [Orient Technologies](http://www.orientechnologies.com).

This container was tested against **OrientDB 2.0.3**.

This docker runs a Rexster server linked to a docker with OrientDB server.

[Gremlin](https://github.com/tinkerpop/gremlin/wiki) is a vendor-independent graph traversal language. This container enables [Gremlin Extension](https://github.com/tinkerpop/rexster/wiki/Gremlin-Extension) for Rexter, so Rexster may be executed via REST API and Rexter web console.


Getting started
---------------

1. Pull the OrientDb image: <code>docker pull ruliana/orientdb</code>
2. Pull this image:  <code>docker pull ruliana/rexster-orientdb</code>
3. Run OrientDB image: <code>docker run --name orientdb -d -v \<SOME-DIR-ON-YOUR-BOX\>:/opt/orientdb/databases -p 2424:2424 -p 2480:2480 ruliana/orientdb</code>
4. Go to http://localhost:2480 and create a database named **main** (IMPORTANT! This container expects a database named **main**)
5. Run this image: <code>docker run --name rexster -d -p 8182:8182 -p 8183:8183 -p 8184:8184 --link orientdb:orientdb ruliana/rexster-orientdb</code>
6. Go to http://localhost:8182

All data will be saved to \<SOME-DIR-ON-YOUR-BOX\>, so you can drop and recreate the OrientDB container without lose data. If you are testing and there is no problem loosing data, remove the <code>-v  \<SOME-DIR-ON-YOUR-BOX\>:/opt/orientdb/databases</code> from step 3 above.

Mapped ports
------------

* Port 2480 is OrientDB web console.
* Port 8184 is Rexster web console and REST API.
* Port 8182 access the database via RexPro binary protocol (useful for [rexpro-ruby](https://github.com/lann/rexpro-ruby) gem)
* Port 8183 is Rexster shutdown port: <code>telnet localhost 8183</code>, then <code>sw</code> ("s" stops and "status" reports shutdown status)

Change database name
--------------------

Start Rexster container (step 5 in "Getting started" above) with:

<code>
docker run --name rexster -d -p 8182:8182 -p 8183:8183 -p 8184:8184 **--env DATABASE\_NAME=something** --link orientdb:orientdb ruliana/rexster-orientdb
</code>

The database name is now "something"
