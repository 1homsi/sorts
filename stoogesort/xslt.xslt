<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema">

    <xsl:function name="local:stooge-sort" as="xs:integer*">
        <xsl:param name="arr" as="xs:integer*"/>
        <xsl:param name="first" as="xs:integer"/>
        <xsl:param name="last" as="xs:integer"/>
        <xsl:variable name="a" select="$arr[$first]"/>
        <xsl:variable name="b" select="$arr[$last]"/>
        <xsl:variable name="swapped" select="if ($a gt $b) then
            (subsequence($arr,1,$first - 1), $b, subsequence($arr,$first+1,$last - $first - 1), $a, subsequence($arr,$last+1))
            else $arr"/>
        <xsl:variable name="n" select="$last - $first + 1"/>
        <xsl:choose>
            <xsl:when test="$n gt 2">
                <xsl:variable name="t" select="xs:integer(floor($n * 2 div 3))"/>
                <xsl:variable name="s1" select="local:stooge-sort($swapped, $first, $first + $t - 1)"/>
                <xsl:variable name="s2" select="local:stooge-sort($s1, $last - $t + 1, $last)"/>
                <xsl:sequence select="local:stooge-sort($s2, $first, $first + $t - 1)"/>
            </xsl:when>
            <xsl:otherwise>
                <xsl:sequence select="$swapped"/>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:function>

    <xsl:template match="/">
        <result>
            <xsl:value-of select="local:stooge-sort((3,1,4,1,5,9,2,6), 1, 8)" separator=" "/>
        </result>
    </xsl:template>
</xsl:stylesheet>
