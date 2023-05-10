<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl">
  <xsl:output method="xml" indent="yes"/>

  <xsl:param name="sourceFolder"/>

  <xsl:template match="/">
    <test-run id="1" name="OWASPReport">
      <test-suite id="1" name="OWASPZAPReport">
        <xsl:apply-templates select="OWASPZAPReport/site/alerts/alertitem"/>
      </test-suite>
    </test-run>
  </xsl:template>

  <xsl:template match="alertitem">
    <test-case id="{generate-id()}" name="{name}">
      <failure>
        <message>
          <xsl:value-of select="desc"/>. 
          <xsl:value-of select="solution"/>
        </message>
        <stack-trace>
          <xsl:apply-templates select="instances/instance"/>
        </stack-trace>
      </failure>
    </test-case>
  </xsl:template>

  <xsl:template match="instance">
    <xsl:value-of select="concat(uri, ', ', method, ', ', param, '&#10;')"/>
  </xsl:template>

</xsl:stylesheet>
