<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:xd="http://www.oxygenxml.com/ns/doc/xsl" xmlns:functx="http://www.functx.com"   exclude-result-prefixes="#all" version="2.0">
  
  <xsl:import href="functx:/functx.xsl"/>
  
  <xsl:template match="*">
    <xsl:element name="{functx:capitalize-first(name(.))}">
      <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
  </xsl:template>
  
</xsl:stylesheet>
