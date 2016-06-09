# Archi to neo4j


## Archimate
### Base Model

TODO Select Archimate Model
/Volumes/Jet/Sandbox/archineo/archisurance.xml

### Transformation


DONE Transform XSLT from Archi XML format to GraphML

xsltproc transform.xsl testing2.xml > output2.xml --verbose

Transformation has issue with basic xmlns namespace:

DOESNOTWORK
<model xmlns="http://www.opengroup.org/xsd/archimate"
       xmlns:dc="http://purl.org/dc/elements/1.1/"
       xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
       xsi:schemaLocation="http://www.opengroup.org/xsd/archimate
                          http://www.opengroup.org/xsd/archimate/archimate_v2p1.xsd
                          http://purl.org/dc/elements/1.1/
                          http://dublincore.org/schemas/xmls/qdc/2008/02/11/dc.xsd"
       identifier="id-11f5304f">

WORKS
<model xmlns:dc="http://purl.org/dc/elements/1.1/"
       xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
       xsi:schemaLocation="http://www.opengroup.org/xsd/archimate
                           http://www.opengroup.org/xsd/archimate/archimate_v2p1.xsd
                           http://purl.org/dc/elements/1.1/
                           http://dublincore.org/schemas/xmls/qdc/2008/02/11/dc.xsd"
       identifier="id-11f5304f">


TODO 'type' attributes in transformation


## Neo4j
### Install
DONE Install Neo4j
http://neo4j.com/docs/operations-manual/current/
/Users/michem/neo4j-community-2.3.4

### Running
./bin/neo4j start
(./bin/neo4j restart)
3.0 is available but does not work with the importtools


### Import data
DONE Importing into neo4j

./bin/neo4j-shell
https://github.com/jexp/neo4j-shell-tools

$ import-graphml -i /Volumes/Jet/Sandbox/archineo/archisurance.xml


### GRASS Graph Style Sheet
TODO Add stylesheet
TODO Business, Application, Technology color

### Cypher Queries

START n=node(*) RETURN n;

displays the nodes and the relationships
START n=node(*) MATCH (n)-[r]->(m) RETURN n,r,m;


Delete all
MATCH (n) DETACH
DELETE n


TODO Inferring missing relations?
http://stackoverflow.com/questions/16279059/patterns-for-adding-inferred-relationships-to-a-neo4j-database

TODO Plain visualisation?
http://visjs.org/network_examples.html
