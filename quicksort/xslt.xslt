<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema">

    <xsl:template name="quicksort">
        <xsl:param name="seq" as="xs:integer*"/>
        <xsl:choose>
            <xsl:when test="count($seq) le 1">
                <xsl:sequence select="$seq"/>
            </xsl:when>
            <xsl:otherwise>
                <xsl:variable name="pivot" select="$seq[ceiling(count($seq) div 2)]"/>
                <xsl:variable name="left" select="$seq[. lt $pivot]"/>
                <xsl:variable name="middle" select="$seq[. eq $pivot]"/>
                <xsl:variable name="right" select="$seq[. gt $pivot]"/>
                <xsl:call-template name="quicksort"><xsl:with-param name="seq" select="$left"/></xsl:call-template>
                <xsl:sequence select="$middle"/>
                <xsl:call-template name="quicksort"><xsl:with-param name="seq" select="$right"/></xsl:call-template>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>

    <xsl:template match="/">
        <xsl:variable name="sorted">
            <xsl:call-template name="quicksort">
                <xsl:with-param name="seq" select="(3, 6, 8, 10, 1, 2, 1)"/>
            </xsl:call-template>
        </xsl:variable>
        <xsl:value-of select="$sorted"/>
    </xsl:template>
</xsl:stylesheet>
