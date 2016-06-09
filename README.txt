# Archi to neo4j

DONE Transform XSLT from Archi XML format to GraphML

<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:x="http://www.opengroup.org/xsd/archimate"
  xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
  xsi:schemaLocation="http://www.opengroup.org/xsd/archimate http://www.opengroup.org/xsd/archimate/archimate_v2p1.xsd"
  version="1.0">
<xsl:output method="xml" indent="yes"/>
<xsl:template match="/">
  <graphml>
    <key id="d0" for="node" attr.name="color" attr.type="string">
        <default>yellow</default>
    </key>
    <key id="name" for="node" attr.name="name" attr.type="string">
      <default>blank</default>
    </key>
    <graph id="G" edgedefault="undirected">
      <xsl:for-each select="model/elements/element">
        <node>
          <xsl:attribute name="id">
              <xsl:value-of select="@identifier"/>
          </xsl:attribute>
          <xsl:attribute name="labels">
              <xsl:value-of select="label"/>
          </xsl:attribute>
          <data key="labels">
              <xsl:value-of select="label"/>
          </data>
          <data key="name">
              <xsl:value-of select="label"/>
          </data>
        </node>
      </xsl:for-each>
      <xsl:for-each select="model/relationships/relationship">
        <edge>
          <xsl:attribute name="id">
              <xsl:value-of select="@identifier"/>
          </xsl:attribute>
          <xsl:attribute name="source">
              <xsl:value-of select="@source"/>
          </xsl:attribute>
          <xsl:attribute name="target">
              <xsl:value-of select="@target"/>
          </xsl:attribute>
          <xsl:attribute name="label">
                <xsl:value-of select="@xsi:type"/>
            </xsl:attribute>
          <data key="d2">
              <xsl:value-of select="@xsi:type"/>
          </data>
        </edge>
      </xsl:for-each>
    </graph>
  </graphml>
</xsl:template>
</xsl:stylesheet>

xsltproc transform.xsl testing2.xml > output2.xml --verbose


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
