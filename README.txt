# Archi to neo4j

DONE Transform XSLT from Archi XML format to GraphML

xsltproc transform.xsl testing2.xml > output2.xml --verbose

Transformation has issue with namespaces:

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
<model xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
       xsi:schemaLocation="http://www.opengroup.org/xsd/archimate http://www.opengroup.org/xsd/archimate/archimate_v2p1.xsd">

DONE Install Neo4j
http://neo4j.com/docs/operations-manual/current/
/Users/michem/neo4j-community-2.3.4

./bin/neo4j start
(./bin/neo4j restart)
3.0 is available but does not work with the importtools

TODO Importing into neo4j

./bin/neo4j-shell


https://github.com/jexp/neo4j-shell-tools
<?xml version="1.0" encoding="UTF-8"?>
<graphml xmlns="http://graphml.graphdrawing.org/xmlns"
         xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
         xsi:schemaLocation="http://graphml.graphdrawing.org/xmlns
        http://graphml.graphdrawing.org/xmlns/1.0/graphml.xsd">
    <key id="d0" for="node" attr.name="color" attr.type="string">
        <default>yellow</default>
    </key>
    <key id="d1" for="edge" attr.name="weight" attr.type="double"/>
    <graph id="G" edgedefault="undirected">
        <node id="n0">
            <data key="d0">green</data>
        </node>
        <node id="n1"/>
        <edge id="e0" source="n0" target="n1">
            <data key="d1">1.0</data>
        </edge>
    </graph>
</graphml>

$ import-graphml -i in.xml
GraphML-Import file in.xml rel-type RELATED_TO batch-size 40000 use disk-cache false
0. 100%: nodes = 1 rels = 0 properties = 0 time 11 ms
Finished: nodes = 2 rels = 1 properties = 2 total time 16 ms
GraphML import created 3 entities.


TODO Select Archimate Model
/Volumes/Jet/Sandbox/archineo/archisurance.xml


$ import-graphml -i /Volumes/Jet/Sandbox/archineo/archisurance.xml



Cypher Queries

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
