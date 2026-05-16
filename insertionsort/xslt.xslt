<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:template name="insertion-sort">
    <xsl:param name="seq"/>
    <xsl:for-each select="$seq">
      <xsl:sort select="." data-type="number"/>
      <item><xsl:value-of select="."/></item>
    </xsl:for-each>
  </xsl:template>
</xsl:stylesheet>
