<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:xs="http://www.w3.org/2001/XMLSchema"
                xmlns:fn="http://www.w3.org/2005/xpath-functions">

<xsl:function name="fn:insert-sorted">
    <xsl:param name="x" as="xs:double"/>
    <xsl:param name="lst" as="xs:double*"/>
    <xsl:choose>
        <xsl:when test="empty($lst)"><xsl:sequence select="$x"/></xsl:when>
        <xsl:when test="$x le $lst[1]"><xsl:sequence select="$x, $lst"/></xsl:when>
        <xsl:otherwise><xsl:sequence select="$lst[1], fn:insert-sorted($x, subsequence($lst, 2))"/></xsl:otherwise>
    </xsl:choose>
</xsl:function>

<xsl:function name="fn:insertion-sort">
    <xsl:param name="lst" as="xs:double*"/>
    <xsl:choose>
        <xsl:when test="empty($lst)"><xsl:sequence select="()"/></xsl:when>
        <xsl:otherwise><xsl:sequence select="fn:insert-sorted($lst[1], fn:insertion-sort(subsequence($lst, 2)))"/></xsl:otherwise>
    </xsl:choose>
</xsl:function>

<xsl:function name="fn:get-idx">
    <xsl:param name="num" as="xs:double"/>
    <xsl:param name="mn" as="xs:double"/>
    <xsl:param name="mx" as="xs:double"/>
    <xsl:param name="n" as="xs:integer"/>
    <xsl:sequence select="min(($n - 1, xs:integer(floor(($num - $mn) div ($mx - $mn + 1) * $n))))"/>
</xsl:function>

<xsl:template match="/">
    <xsl:variable name="data" select="(0.78, 0.17, 0.39, 0.26, 0.72, 0.94, 0.21, 0.12, 0.23, 0.68)" as="xs:double*"/>
    <xsl:variable name="n" select="count($data)" as="xs:integer"/>
    <xsl:variable name="mn" select="min($data)" as="xs:double"/>
    <xsl:variable name="mx" select="max($data)" as="xs:double"/>
    <result>
        <xsl:for-each select="0 to ($n - 1)">
            <xsl:variable name="i" select="."/>
            <xsl:sequence select="fn:insertion-sort(for $x in $data return if (fn:get-idx($x, $mn, $mx, $n) = $i) then $x else ())"/>
        </xsl:for-each>
    </result>
</xsl:template>
</xsl:stylesheet>
