<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<!-- 
	Grid
-->

<xsl:template match="cont">
	<div class="container"><xsl:apply-templates select="row|frow|span"/></div>
</xsl:template>

<xsl:template match="fcont">
	<div class="container-fluid"><xsl:apply-templates select="frow|span"/></div>
</xsl:template>

<xsl:template match="row">
	<div class="row"><xsl:apply-templates select="span"/></div>
</xsl:template>

<xsl:template match="frow">
	<div class="row-fluid"><xsl:apply-templates select="span"/></div>
</xsl:template>

<xsl:template match="span">
	<div>
		<xsl:attribute name="class">
			<xsl:if test="string-length(@v) > 0">span<xsl:value-of select="@v"/></xsl:if>
			<xsl:if test="string-length(@o) > 0"><xsl:text> </xsl:text>offset<xsl:value-of select="@o"/></xsl:if>
			<xsl:if test="string-length(@class) > 0"><xsl:text> </xsl:text><xsl:value-of select="@class"/></xsl:if>
		</xsl:attribute>	
		<xsl:apply-templates select="*"/>
	</div>
</xsl:template>

<xsl:template match="box">
	<div class="well {@class}"><xsl:apply-templates select="*"/></div>
</xsl:template>

<!-- 
	Segments
-->

<xsl:template match="hero"></xsl:template>
<xsl:template match="ph"></xsl:template>
<xsl:template match="tumb"></xsl:template>

<!-- 
	Elements
-->

<xsl:template match="h"><h1><xsl:value-of select="."/></h1></xsl:template>
<xsl:template match="ah"><h2><xsl:value-of select="."/></h2></xsl:template>
<xsl:template match="bh"><h3><xsl:value-of select="."/></h3></xsl:template>

<xsl:template match="lead"><div class="lead"><xsl:value-of select="."/></div></xsl:template>
<xsl:template match="b"><strong><xsl:value-of select="."/></strong></xsl:template>
<xsl:template match="i"><em><xsl:value-of select="."/></em></xsl:template>
<xsl:template match="addr"><address><xsl:value-of select="."/></address></xsl:template>

<xsl:template match="q">
	<blockquote>
		<xsl:if test="@pull='r'">
			<xsl:attribute name="class">pull-right</xsl:attribute>
		</xsl:if>	
		<p><xsl:value-of select="."/></p>
		<xsl:if test="string-length(@sub) > 0">
			<small><xsl:value-of select="@sub"/></small>
		</xsl:if>	
	</blockquote>
</xsl:template>

<xsl:template match="list"></xsl:template>
<xsl:template match="code"></xsl:template>

<xsl:template match="ico"><i class="icon-{@p}"></i></xsl:template>
<xsl:template match="wico"><i class="icon-{@p} icon-white"></i></xsl:template>


</xsl:stylesheet>
