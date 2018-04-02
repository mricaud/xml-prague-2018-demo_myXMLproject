<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xd="http://www.oxygenxml.com/ns/doc/xsl" xmlns:myXslLib="http://www.lefebvre-sarrut.eu/ns/lib/xsl" version="2.0">
  
  <!--<xsl:import href="dependency://eu.els.lib+myXslLib/myLib.xsl"/>-->
  <!--cals2html has a dependency to myXslLib, let's try 2 levels dependency here-->
  <xsl:import href="dependency://eu.els.lib+cals2html/cals2html.xsl"/>
  
  <xd:doc>
    <xd:desc>
      <xd:p>Add hello attribute to the root element</xd:p>
    </xd:desc>
  </xd:doc>
  <xsl:template match="/*">
    <xsl:copy>
      <xsl:attribute name="hello" select="myXslLib:hello()"/>
    </xsl:copy>
  </xsl:template>  
  
</xsl:stylesheet>
