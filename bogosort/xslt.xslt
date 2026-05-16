<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:xs="http://www.w3.org/2001/XMLSchema">

  <xsl:function name="local:is-sorted" as="xs:boolean">
    <xsl:param name="arr" as="xs:integer*"/>
    <xsl:value-of select="every $i in 1 to count($arr) - 1 satisfies $arr[$i] le $arr[$i + 1]"/>
  </xsl:function>

  <xsl:function name="local:bogosort" as="xs:integer*">
    <xsl:param name="arr" as="xs:integer*"/>
    <xsl:choose>
      <xsl:when test="local:is-sorted($arr)">
        <xsl:sequence select="$arr"/>
      </xsl:when>
      <xsl:otherwise>
        <xsl:sequence select="local:bogosort(for $x in $arr order by random() return $x)"/>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:function>

  <xsl:template match="/">
    <result>
      <xsl:value-of select="local:bogosort((3, 1, 4, 1, 5, 9, 2, 6))" separator=" "/>
    </result>
  </xsl:template>
</xsl:stylesheet>
