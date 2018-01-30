<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet 
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:xs="http://www.w3.org/2001/XMLSchema"
  xmlns:xd="http://www.oxygenxml.com/ns/doc/xsl"
  xmlns:ouvrage-2-html="http://www.lefebvre-sarrut.eu/ns/els/projects/ouvrage-to-html"
  xmlns:functx="http://www.functx.com"
  xmlns:elsLib="http://www.lefebvre-sarrut.eu/ns/els/xslLib"
  xmlns:cals="http://docs.oasis-open.org/ns/oasis-exchange/table"
  xmlns="http://www.w3.org/1999/xhtml"
  exclude-result-prefixes="#all"
  version="3.0">

  <xd:doc scope="stylesheet">
    <xd:desc>
      <xd:p>This XSLT convert any Ouvrage XML to HTML</xd:p>
    </xd:desc>
  </xd:doc>
  
  <xsl:output method="xhtml"/>
  
  <xsl:import href="cals2html:/cals2html.xsl"/>
  <xsl:import href="functx:/functx.xsl"/>
  
  <!--===========================-->
  <!--INIT-->
  <!--===========================-->
  
  <xsl:template match="/">
    <xsl:apply-templates select="." mode="ouvrage-2-html:main"/>
  </xsl:template>
  
  <!--===========================-->
  <!--MAIN-->
  <!--===========================-->
  <xsl:template match="/ouvrage" mode="ouvrage-2-html:main">
    <html>
      <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <!--<link rel="shortcut icon" href="favicon.ico" type="image/gif" />-->
        <title>Ouvrage</title>
        <style type="text/css">
          <![CDATA[
            table{
               border-collapse:collapse;
               min-width:200px;
            }
          ]]>
        </style>
      </head>
      <body>
        <xsl:apply-templates mode="#current"/>
      </body>
    </html>
  </xsl:template>
  
  <xsl:template match="introduction | corpus" mode="ouvrage-2-html:main">
    <div class="{local-name()}">
      <xsl:apply-templates mode="#current"/>
    </div>
  </xsl:template>
  
  <xsl:template match="t1" mode="ouvrage-2-html:main">
    <h1>
      <xsl:apply-templates mode="#current"/>
    </h1>
  </xsl:template>
  
  <xsl:template match="t2" mode="ouvrage-2-html:main">
    <h2>
      <xsl:apply-templates mode="#current"/>
    </h2>
  </xsl:template>
  
  <xsl:template match="alinea" mode="ouvrage-2-html:main">
    <p>
      <xsl:apply-templates mode="#current"/>
    </p>
  </xsl:template>
  
  <xsl:template match="cals:table" mode="ouvrage-2-html:main">
    <xsl:variable name="cals:table" as="document-node()">
      <xsl:document>
        <xsl:sequence select="."/>
      </xsl:document>
    </xsl:variable>
    <xsl:apply-templates select="$cals:table" mode="elsLib:cals2html"/>
  </xsl:template>
  
  <xsl:template match="text()" mode="ouvrage-2-html:main">
    <xsl:value-of select="functx:words-to-camel-case(.)"/>
  </xsl:template>
  
</xsl:stylesheet>