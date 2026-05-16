<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:f="http://example.org/functions">

<xsl:function name="f:insert-val" as="xs:integer*">
    <xsl:param name="x" as="xs:integer"/>
    <xsl:param name="lst" as="xs:integer*"/>
    <xsl:choose>
        <xsl:when test="empty($lst)"><xsl:sequence select="$x"/></xsl:when>
        <xsl:when test="$x le $lst[1]"><xsl:sequence select="$x, $lst"/></xsl:when>
        <xsl:otherwise><xsl:sequence select="$lst[1], f:insert-val($x, $lst[position() gt 1])"/></xsl:otherwise>
    </xsl:choose>
</xsl:function>

<xsl:function name="f:insertion-sort" as="xs:integer*">
    <xsl:param name="lst" as="xs:integer*"/>
    <xsl:choose>
        <xsl:when test="empty($lst)"><xsl:sequence select="()"/></xsl:when>
        <xsl:otherwise>
            <xsl:sequence select="f:insert-val($lst[1], f:insertion-sort($lst[position() gt 1]))"/>
        </xsl:otherwise>
    </xsl:choose>
</xsl:function>

<xsl:function name="f:merge-runs" as="xs:integer*">
    <xsl:param name="xs" as="xs:integer*"/>
    <xsl:param name="ys" as="xs:integer*"/>
    <xsl:choose>
        <xsl:when test="empty($xs)"><xsl:sequence select="$ys"/></xsl:when>
        <xsl:when test="empty($ys)"><xsl:sequence select="$xs"/></xsl:when>
        <xsl:when test="$xs[1] le $ys[1]">
            <xsl:sequence select="$xs[1], f:merge-runs($xs[position() gt 1], $ys)"/>
        </xsl:when>
        <xsl:otherwise>
            <xsl:sequence select="$ys[1], f:merge-runs($xs, $ys[position() gt 1])"/>
        </xsl:otherwise>
    </xsl:choose>
</xsl:function>

<xsl:function name="f:timsort" as="xs:integer*">
    <xsl:param name="lst" as="xs:integer*"/>
    <xsl:if test="not(empty($lst))">
        <xsl:variable name="sorted" as="xs:integer*"
            select="f:insertion-sort($lst)"/>
        <xsl:sequence select="$sorted"/>
    </xsl:if>
</xsl:function>

<xsl:template match="/">
    <result>
        <xsl:value-of select="f:timsort((5,2,8,1,9,3,7,4,6))" separator=" "/>
    </result>
</xsl:template>

</xsl:stylesheet>
