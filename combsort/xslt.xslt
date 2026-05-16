<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:fn="http://www.w3.org/2005/xpath-functions">

  <xsl:function name="fn:comb-sort" as="xs:integer*">
    <xsl:param name="arr" as="xs:integer*"/>
    <xsl:variable name="n" select="count($arr)"/>
    <xsl:sequence select="fn:sort-loop($arr, $n, $n)"/>
  </xsl:function>

  <xsl:function name="fn:sort-loop" as="xs:integer*">
    <xsl:param name="arr" as="xs:integer*"/>
    <xsl:param name="n" as="xs:integer"/>
    <xsl:param name="gap" as="xs:integer"/>
    <xsl:variable name="g" select="max((1, xs:integer($gap div 1.3)))"/>
    <xsl:variable name="result" select="fn:pass($arr, $g, 1, $n, false())"/>
    <xsl:choose>
      <xsl:when test="$g = 1 and not($result[last()])">
        <xsl:sequence select="$result[position() lt last()]"/>
      </xsl:when>
      <xsl:otherwise>
        <xsl:sequence select="fn:sort-loop(subsequence($result, 1, last($result)-1), $n, $g)"/>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:function>

  <xsl:function name="fn:pass" as="item()*">
    <xsl:param name="arr" as="xs:integer*"/>
    <xsl:param name="gap" as="xs:integer"/>
    <xsl:param name="i" as="xs:integer"/>
    <xsl:param name="n" as="xs:integer"/>
    <xsl:param name="changed" as="xs:boolean"/>
    <xsl:choose>
      <xsl:when test="$i + $gap gt $n">
        <xsl:sequence select="($arr, $changed)"/>
      </xsl:when>
      <xsl:when test="$arr[$i] gt $arr[$i + $gap]">
        <xsl:variable name="arr2" select="
          for $j in 1 to count($arr) return
            if ($j = $i) then $arr[$i + $gap]
            else if ($j = $i + $gap) then $arr[$i]
            else $arr[$j]"/>
        <xsl:sequence select="fn:pass($arr2, $gap, $i + 1, $n, true())"/>
      </xsl:when>
      <xsl:otherwise>
        <xsl:sequence select="fn:pass($arr, $gap, $i + 1, $n, $changed)"/>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:function>

</xsl:stylesheet>
