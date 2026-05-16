<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:xs="http://www.w3.org/2001/XMLSchema"
                xmlns:local="local">

  <xsl:function name="local:compare-and-swap" as="xs:integer*">
    <xsl:param name="arr" as="xs:integer*"/>
    <xsl:param name="i" as="xs:integer"/>
    <xsl:param name="j" as="xs:integer"/>
    <xsl:param name="dir" as="xs:boolean"/>
    <xsl:variable name="ai" select="$arr[$i]"/>
    <xsl:variable name="aj" select="$arr[$j]"/>
    <xsl:sequence select="
      if ($dir eq ($ai gt $aj)) then
        for $idx in 1 to count($arr) return
          if ($idx eq $i) then $aj
          else if ($idx eq $j) then $ai
          else $arr[$idx]
      else $arr
    "/>
  </xsl:function>

  <xsl:function name="local:bitonic-sort" as="xs:integer*">
    <xsl:param name="arr" as="xs:integer*"/>
    <xsl:param name="lo" as="xs:integer"/>
    <xsl:param name="cnt" as="xs:integer"/>
    <xsl:param name="dir" as="xs:boolean"/>
    <xsl:sequence select="if ($cnt le 1) then $arr else $arr"/>
  </xsl:function>

  <xsl:template match="/">
    <result>
      <xsl:value-of select="local:bitonic-sort((3,7,4,8,6,2,1,5), 1, 8, true())"/>
    </result>
  </xsl:template>
</xsl:stylesheet>
