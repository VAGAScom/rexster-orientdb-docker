/bin/sed -i s/_ORIENTDB_PORT_2424_TCP_ADDR_/${ORIENTDB_PORT_2424_TCP_ADDR}/ /opt/rexster/config/rexster.xml
/bin/sed -i s/_ORIENTDB_PORT_2424_TCP_PORT_/${ORIENTDB_PORT_2424_TCP_PORT}/ /opt/rexster/config/rexster.xml
/bin/sed -i s/_DATABASE_NAME_/${DATABASE_NAME}/ /opt/rexster/config/rexster.xml

/opt/rexster/bin/rexster.sh --start -c /opt/rexster/config/rexster.xml
