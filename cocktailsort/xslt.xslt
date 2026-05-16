<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:xs="http://www.w3.org/2001/XMLSchema">

  <xsl:function name="local:forward-pass">
    <xsl:param name="seq" as="xs:integer*"/>
    <xsl:param name="i" as="xs:integer"/>
    <xsl:param name="end" as="xs:integer"/>
    <xsl:choose>
      <xsl:when test="$i ge $end">
        <xsl:sequence select="$seq"/>
      </xsl:when>
      <xsl:when test="$seq[$i] gt $seq[$i + 1]">
        <xsl:variable name="swapped" select="(subsequence($seq,1,$i - 1), $seq[$i+1], $seq[$i], subsequence($seq,$i+2))"/>
        <xsl:sequence select="local:forward-pass($swapped, $i + 1, $end)"/>
      </xsl:when>
      <xsl:otherwise>
        <xsl:sequence select="local:forward-pass($seq, $i + 1, $end)"/>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:function>

  <xsl:function name="local:cocktail-sort">
    <xsl:param name="seq" as="xs:integer*"/>
    <xsl:sequence select="local:forward-pass($seq, 1, count($seq))"/>
  </xsl:function>

  <xsl:template match="/">
    <result>
      <xsl:value-of select="local:cocktail-sort((5,3,8,1,9,2,7,4,6,0))"/>
    </result>
  </xsl:template>

</xsl:stylesheet>
