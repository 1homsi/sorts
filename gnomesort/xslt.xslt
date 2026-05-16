<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:template name="gnome-sort">
        <xsl:param name="arr"/>
        <xsl:param name="i" select="1"/>
        <xsl:param name="n" select="count($arr)"/>
        <xsl:choose>
            <xsl:when test="$i > $n">
                <xsl:copy-of select="$arr"/>
            </xsl:when>
            <xsl:when test="$i = 1 or $arr[$i] >= $arr[$i - 1]">
                <xsl:call-template name="gnome-sort">
                    <xsl:with-param name="arr" select="$arr"/>
                    <xsl:with-param name="i" select="$i + 1"/>
                    <xsl:with-param name="n" select="$n"/>
                </xsl:call-template>
            </xsl:when>
            <xsl:otherwise>
                <xsl:call-template name="gnome-sort">
                    <xsl:with-param name="i" select="$i - 1"/>
                    <xsl:with-param name="n" select="$n"/>
                </xsl:call-template>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
</xsl:stylesheet>
