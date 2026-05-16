<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:fn="http://www.w3.org/2005/xpath-functions">

<xsl:output method="text"/>

<xsl:function name="fn:heapify" as="xs:integer*">
    <xsl:param name="arr" as="xs:integer*"/>
    <xsl:param name="n" as="xs:integer"/>
    <xsl:param name="i" as="xs:integer"/>
    <xsl:variable name="left" select="2*$i + 1"/>
    <xsl:variable name="right" select="2*$i + 2"/>
    <xsl:variable name="largest0" select="if ($left lt $n and $arr[$left+1] gt $arr[$i+1]) then $left else $i"/>
    <xsl:variable name="largest" select="if ($right lt $n and $arr[$right+1] gt $arr[$largest0+1]) then $right else $largest0"/>
    <xsl:sequence select="if ($largest ne $i)
        then fn:heapify(
            for $k in 1 to count($arr) return
                if ($k eq $i+1) then $arr[$largest+1]
                else if ($k eq $largest+1) then $arr[$i+1]
                else $arr[$k],
            $n, $largest)
        else $arr"/>
</xsl:function>

<xsl:function name="fn:heapsort" as="xs:integer*">
    <xsl:param name="arr" as="xs:integer*"/>
    <xsl:variable name="n" select="count($arr)"/>
    <xsl:variable name="heap" select="fold-left(reverse(0 to ($n idiv 2 - 1)), $arr, function($a,$i){fn:heapify($a,$n,$i)})"/>
    <xsl:sequence select="fold-left(reverse(1 to ($n - 1)), $heap, function($a,$i){
        fn:heapify(for $k in 1 to count($a) return if ($k eq 1) then $a[$i+1] else if ($k eq $i+1) then $a[1] else $a[$k], $i, 0)
    })"/>
</xsl:function>

<xsl:template match="/">
    <xsl:value-of select="fn:heapsort((12,11,13,5,6,7))" separator=" "/>
</xsl:template>

</xsl:stylesheet>
