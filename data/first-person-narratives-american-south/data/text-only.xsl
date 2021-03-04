<?xml version="1.0"?>

<xsl:stylesheet version="2.0"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:output omit-xml-declaration="yes" indent="no" method="text"/>
  <xsl:strip-space elements="*"/>
  <xsl:variable name="newline"><xsl:text>&#xa;</xsl:text></xsl:variable>

  <xsl:template match="@*|node()">
    <xsl:apply-templates/>
  </xsl:template>

  <!-- all sections -->
  <xsl:template match="text//node()[starts-with(name(), 'div')]">
    <xsl:apply-templates/>
  </xsl:template>

  <xsl:template match="text//head | text//opener | text//closer">
    <xsl:value-of select="$newline"/>
    <xsl:value-of select="normalize-space(.)"/>
  </xsl:template>

  <!-- all paragraphs without a table -->
  <xsl:template match="text//p[not(table)]">
    <xsl:value-of select="$newline"/>
    <xsl:value-of select="normalize-space(.)"/>
  </xsl:template>

  <!-- all linegroups -->
  <xsl:template match="text//lg">
    <xsl:value-of select="$newline"/>
    <xsl:apply-templates/>
    <xsl:value-of select="$newline"/>
  </xsl:template>

  <xsl:template match="text//lg/l">
    <xsl:value-of select="$newline"/>
    <xsl:value-of select="normalize-space(.)"/>
  </xsl:template>

  <!-- tables inside paragraphs -->
  <xsl:template match="text//p/table">
    <xsl:value-of select="$newline"/>
    <xsl:apply-templates/>
    <xsl:value-of select="$newline"/>
  </xsl:template>

  <xsl:template match="row">
    <xsl:value-of select="$newline"/>
    <xsl:apply-templates select="cell"/>
  </xsl:template>

  <xsl:template match="cell">
    <xsl:text>"</xsl:text>
    <xsl:value-of select="normalize-space(.)"/>
    <xsl:text>"</xsl:text>
    <xsl:choose>
      <xsl:when test="position() != last()">
        <xsl:text>,</xsl:text>
      </xsl:when>
    </xsl:choose>
  </xsl:template>
</xsl:stylesheet>
