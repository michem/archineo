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
