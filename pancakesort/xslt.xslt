<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:xs="http://www.w3.org/2001/XMLSchema">

  <xsl:function name="local:flip">
    <xsl:param name="arr"/>
    <xsl:param name="k"/>
    <xsl:sequence select="(reverse(subsequence($arr, 1, $k + 1)), subsequence($arr, $k + 2))"/>
  </xsl:function>

  <xsl:function name="local:find-max-idx" as="xs:integer">
    <xsl:param name="arr"/>
    <xsl:param name="size" as="xs:integer"/>
    <xsl:variable name="sub" select="subsequence($arr, 1, $size)"/>
    <xsl:variable name="mx" select="max($sub)"/>
    <xsl:sequence select="index-of($sub, $mx)[1] - 1"/>
  </xsl:function>

  <xsl:function name="local:sort">
    <xsl:param name="arr"/>
    <xsl:param name="size" as="xs:integer"/>
    <xsl:choose>
      <xsl:when test="$size le 1">
        <xsl:sequence select="$arr"/>
      </xsl:when>
      <xsl:otherwise>
        <xsl:variable name="mi" select="local:find-max-idx($arr, $size)"/>
        <xsl:variable name="a1" select="if ($mi ne 0) then local:flip($arr, $mi) else $arr"/>
        <xsl:variable name="a2" select="local:flip($a1, $size - 1)"/>
        <xsl:sequence select="local:sort($a2, $size - 1)"/>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:function>

  <xsl:template match="/">
    <result>
      <xsl:value-of select="local:sort((3,6,2,7,4,1,5), 7)" separator=" "/>
    </result>
  </xsl:template>
</xsl:stylesheet>
