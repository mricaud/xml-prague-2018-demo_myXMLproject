# XML Prague 2018
## Using Maven with XML projects - Demo "myProject"

This repo holds "myProject" source presented at XML Prague 2018: [url to the presentation]

"myProject" has a XSL dependency to an xsl library in another Maven Project (https://github.com/mricaud/xml-prague-2018-demo_myLib).

**Requirements**
- Java: http://www.oracle.com/technetwork/java/javase/downloads
- Maven: https://maven.apache.org/download.cgi

> Note: Maven is written in Java, so you need Java to building your XML Maven Project. But at the end, your final delivery may not run under Java. 
> Your XMLProject will be encapsulated within a jar file, which may be used like a simple zip containing your xslt, schemas, etc.

For developing localy you have to use an XML IDE that can deal with catalogs, for example:
- [Oxygen Editor](https://www.oxygenxml.com): 
    - go to: options > Preferences > XML > XML Catalogs
    - add a new catalog: ${pdu}/catalog.xml

** Build the library:**

1. `git clone https://github.com/mricaud/xml-prague-2018-demo_myLib`
1. `cd xml-prague-2018-demo_myLib`
1. `mvn install`

** Build this project:**
1. `git clone https://github.com/mricaud/xml-prague-2018-demo_myXMLproject`
1. `cd xml-prague-2018-demo_myXMLproject` 
1. `mvn install`

**Generate documentaion:**
1.`mvn site`

----------

### Dependency

This project consists of :
- scr/main/xsl/say-hello.xsl, an xslt which call function myLib:say-hello()
- The function myLib:say-hello() is declared in another repository: https://github.com/mricaud/xml-prague-2018-demo_myLib
- say-hello.xsl uses `<xsl:import href="myXslLib:/myLib.xsl"/>` to import this lib. 
- The pom.xml references a dependency to this lib:

```xml
<dependency>
  <groupId>eu.els.lib</groupId>
  <artifactId>myXslLib</artifactId>
  <version>1.0</version>
</dependency>
```

### catalogBuilder-maven-plugin
This plugin will generate a catalog.xml file at the root of the project.

This catalog will be used to resolve artefactId:/ uri, based on dependencies declaration.

Here, the catalog references the jar where xslLib is installed, it should look like this:

```xml
<catalog xmlns="urn:oasis:names:tc:entity:xmlns:xml:catalog">
  <rewriteURI uriStartString="myXslLib:/" rewritePrefix="jar:file:C:\Users\you\.m2\repository\eu\els\lib\myXslLib\1.0\myXslLib-1.0.jar!/"></rewriteURI>
  <rewriteSystem systemIdStartString="myXslLib:/" rewritePrefix="jar:file:C:\Users\you\.m2\repository\eu\els\lib\myXslLib\1.0\myXslLib-1.0.jar!/"></rewriteSystem>
</catalog>
```

> When a lib is available in your maven repository (Nexus, Maven Central, ...) you don't need to install it, Maven will automaticaly get all dependency in your .m2 directory. 

### maven-assembly-plugin
The result of the build is a jar file, you can change that.

Here you get myProject-1.0.jar.

If you need a full jar with all dependencies included, use the plugin maven-assembly-plugin.

Here we get myProject-1.0-jar-with-dependencies.jar

### xspec-maven-plugin

If you wan to add unit test to you XSLT, you may use XSPEC.

xspec-maven-plugin will lauch every XSPEC in src/test, if one XSPEC failed the build will also fail.

The results of the xspec tests will be available in target/xspec-reports.

### xml-maven-plugin

Maven is a kind of "Lego buid", you can use any available plugin.
For example [xml-maven-plugin](http://www.mojohaus.org/xml-maven-plugin) can perform XML validation or generating new source code in the delivery.

Here we use this plugin to generated a simple version of a schema: we simply make the attribute "hello" optional where it was mandatory in the original schema.

In the delivery we can access to both schemas. If the original schema has modifications, the generated one will also have them.

### xslDoc-maven-plugin

This is report plugin that generates XSLT documentation, like java doc.

You need to run `mvn site` to generate this documentation.

The documentation wil be available in target/site.

