<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema">

<xsl:function name="local:merge" as="xs:integer*">
    <xsl:param name="left" as="xs:integer*"/>
    <xsl:param name="right" as="xs:integer*"/>
    <xsl:choose>
        <xsl:when test="empty($left)"><xsl:sequence select="$right"/></xsl:when>
        <xsl:when test="empty($right)"><xsl:sequence select="$left"/></xsl:when>
        <xsl:when test="$left[1] le $right[1]">
            <xsl:sequence select="($left[1], local:merge(subsequence($left,2), $right))"/>
        </xsl:when>
        <xsl:otherwise>
            <xsl:sequence select="($right[1], local:merge($left, subsequence($right,2)))"/>
        </xsl:otherwise>
    </xsl:choose>
</xsl:function>

<xsl:function name="local:merge-sort" as="xs:integer*">
    <xsl:param name="seq" as="xs:integer*"/>
    <xsl:variable name="n" select="count($seq)"/>
    <xsl:choose>
        <xsl:when test="$n le 1"><xsl:sequence select="$seq"/></xsl:when>
        <xsl:otherwise>
            <xsl:variable name="mid" select="$n idiv 2"/>
            <xsl:sequence select="local:merge(
                local:merge-sort(subsequence($seq,1,$mid)),
                local:merge-sort(subsequence($seq,$mid+1)))"/>
        </xsl:otherwise>
    </xsl:choose>
</xsl:function>

<xsl:template match="/">
    <result>
        <xsl:value-of select="local:merge-sort((38,27,43,3,9,82,10))" separator=" "/>
    </result>
</xsl:template>

</xsl:stylesheet>
