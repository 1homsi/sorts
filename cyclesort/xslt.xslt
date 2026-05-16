<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema">

  <xsl:template match="/">
    <xsl:variable name="input" select="(5, 4, 3, 2, 1)" as="xs:integer*"/>
    <xsl:variable name="sorted">
      <xsl:perform-sort select="$input">
        <xsl:sort order="ascending"/>
      </xsl:perform-sort>
    </xsl:variable>
    <result>
      <xsl:value-of select="$sorted" separator=" "/>
    </result>
  </xsl:template>

</xsl:stylesheet>
