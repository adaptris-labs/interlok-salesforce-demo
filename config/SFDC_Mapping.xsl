<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:output indent="yes" />

  <xsl:template match="@*|node()">
    <xsl:copy>
      <xsl:apply-templates select="@*|node()"/>
    </xsl:copy>
  </xsl:template>

  <xsl:template match="/Row">
    <Row>  
      <xsl:apply-templates select="FirstName"/>
      <xsl:apply-templates select="LastName"/>
	  <xsl:apply-templates select="Phone"/>
	  <xsl:apply-templates select="Email"/>
	  <xsl:apply-templates select="AccountId"/>
    </Row>
  </xsl:template>
</xsl:stylesheet>