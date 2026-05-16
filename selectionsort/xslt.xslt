<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:template name="selection-sort">
    <xsl:param name="seq"/>
    <xsl:if test="exists($seq)">
      <xsl:variable name="min" select="min($seq)"/>
      <item><xsl:value-of select="$min"/></item>
      <xsl:call-template name="selection-sort">
        <xsl:with-param name="seq" select="remove($seq, index-of($seq, $min)[1])"/>
      </xsl:call-template>
    </xsl:if>
  </xsl:template>
</xsl:stylesheet>
