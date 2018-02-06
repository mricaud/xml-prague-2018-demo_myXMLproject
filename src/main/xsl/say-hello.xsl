<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:my-xsl-lib="http://www.lefebvre-sarrut.eu/ns/lib/xsl" version="2.0">
  
  <xsl:import href="my-xslt-lib:/myLib.xsl"/>
  
  <xsl:template match="/*">
    <xsl:sequence select="my-xsl-lib:hello()"/>
  </xsl:template>  
  
</xsl:stylesheet>
