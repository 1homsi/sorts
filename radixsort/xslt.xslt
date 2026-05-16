<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema">

    <xsl:variable name="input" select="(170, 45, 75, 90, 802, 24, 2, 66)"/>

    <xsl:function name="local:get-digit" as="xs:integer">
        <xsl:param name="x" as="xs:integer"/>
        <xsl:param name="exp" as="xs:integer"/>
        <xsl:value-of select="($x idiv $exp) mod 10"/>
    </xsl:function>

    <xsl:function name="local:counting-sort" as="xs:integer*">
        <xsl:param name="arr" as="xs:integer*"/>
        <xsl:param name="exp" as="xs:integer"/>
        <xsl:for-each select="0 to 9">
            <xsl:variable name="d" select="."/>
            <xsl:for-each select="$arr[local:get-digit(., $exp) = $d]">
                <xsl:value-of select="."/>
            </xsl:for-each>
        </xsl:for-each>
    </xsl:function>

    <xsl:function name="local:radix-sort" as="xs:integer*">
        <xsl:param name="arr" as="xs:integer*"/>
        <xsl:variable name="max-val" select="max($arr)"/>
        <xsl:sequence select="local:radix-loop($arr, $max-val, 1)"/>
    </xsl:function>

    <xsl:function name="local:radix-loop" as="xs:integer*">
        <xsl:param name="arr" as="xs:integer*"/>
        <xsl:param name="max-val" as="xs:integer"/>
        <xsl:param name="exp" as="xs:integer"/>
        <xsl:choose>
            <xsl:when test="$max-val idiv $exp = 0">
                <xsl:sequence select="$arr"/>
            </xsl:when>
            <xsl:otherwise>
                <xsl:sequence select="local:radix-loop(local:counting-sort($arr, $exp), $max-val, $exp * 10)"/>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:function>

    <xsl:template match="/">
        <result>
            <xsl:value-of select="string-join(for $x in local:radix-sort($input) return string($x), ' ')"/>
        </result>
    </xsl:template>

</xsl:stylesheet>
