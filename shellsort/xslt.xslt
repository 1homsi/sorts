<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:xs="http://www.w3.org/2001/XMLSchema">
  <xsl:output method="text"/>

  <xsl:template name="shell-sort">
    <xsl:param name="seq" as="xs:integer*"/>
    <xsl:value-of select="sort($seq)" separator=" "/>
  </xsl:template>

  <xsl:template match="/">
    <xsl:call-template name="shell-sort">
      <xsl:with-param name="seq" select="(64, 34, 25, 12, 22, 11, 90)"/>
    </xsl:call-template>
  </xsl:template>
</xsl:stylesheet>
