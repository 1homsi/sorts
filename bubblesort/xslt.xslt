<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:xs="http://www.w3.org/2001/XMLSchema">

  <xsl:template name="bubble-sort">
    <xsl:param name="seq" as="xs:integer*"/>
    <xsl:variable name="passed" select="local:bubble-pass($seq)"/>
    <xsl:choose>
      <xsl:when test="$passed[last()] = 1">
        <xsl:call-template name="bubble-sort">
          <xsl:with-param name="seq" select="$passed[position() lt last()]"/>
        </xsl:call-template>
      </xsl:when>
      <xsl:otherwise>
        <xsl:value-of select="$passed[position() lt last()]" separator=" "/>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>

  <xsl:template match="/">
    <xsl:call-template name="bubble-sort">
      <xsl:with-param name="seq" select="(64, 34, 25, 12, 22, 11, 90)"/>
    </xsl:call-template>
  </xsl:template>

</xsl:stylesheet>
