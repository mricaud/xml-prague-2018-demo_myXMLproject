<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:myXslLib="http://www.lefebvre-sarrut.eu/ns/lib/xsl" version="2.0">
  
  <xsl:import href="myXslLib:/myLib.xsl"/>
  
  <xsl:template match="/*">
    <xsl:copy>
      <xsl:attribute name="hello" select="myXslLib:hello()"/>
    </xsl:copy>
  </xsl:template>  
  
</xsl:stylesheet>
