<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<!-- 
	Grid
-->

<xsl:template match="cont">
	<div class="container"><xsl:apply-templates select="row|frow|span"/></div>
</xsl:template>

<xsl:template match="fcont">
	<div class="container-fluid"><xsl:apply-templates select="frow|row|span"/></div>
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

<xsl:template match="t"><xsl:apply-templates select="*"/></xsl:template>
<xsl:template match="hero">
	<div class="hero-unit"><xsl:apply-templates select="*"/></div>
</xsl:template>

<xsl:template match="ph">
	<div class="page-header">
		<h1>
			<xsl:value-of select="."/>
			<xsl:if test="string-length(@cm) > 0"><small><xsl:value-of select="@cm"/></small></xsl:if>
		</h1>
	</div>
</xsl:template>

<xsl:template match="tumb">
	<ul class="thumbnails">
  		<xsl:for-each select="item">
  			<li class="{@s}">
  				<xsl:choose>
  					<xsl:when test="@t = 'more'">
  						 <div class="thumbnail">
      						<a href="{@b}">
      							<img src="{@i}" alt="{@title}"/>
      						</a>
      						<h5><xsl:value-of select="@title"/></h5>
      						<p><xsl:copy-of select="."/></p>
    					</div>
  					</xsl:when>
  					<xsl:otherwise>
	    				<a href="{@b}" class="thumbnail">
    	  					<img src="{@i}" alt="{@title}"/>
    					</a>
  					</xsl:otherwise>
  				</xsl:choose>
  			</li>
  		</xsl:for-each>
	</ul>
</xsl:template>

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

<xsl:template match="a"><a href="{@h}" class="{@c}" click="{@on}"><xsl:apply-templates select="*"/></a></xsl:template>
<xsl:template match="aa"><a href="#" class="{@c}" click="{@on}"><xsl:apply-templates select="*"/></a></xsl:template>

<xsl:template match="list">
	<xsl:choose>
		<xsl:when test="@t='u'">
			<ul>
				<xsl:apply-templates select="it" mode="list"/>
			</ul>
		</xsl:when>
		<xsl:when test="@t='us'">
			<ul class="unstyled">
				<xsl:apply-templates select="it" mode="list"/>
			</ul>
		</xsl:when>
		<xsl:when test="@t='o'">
			<ol>
				<xsl:apply-templates select="it" mode="list"/>
			</ol>
		</xsl:when>
		<xsl:when test="@t='d'">
			<dl>
				<xsl:apply-templates select="it" mode="dlist"/>
			</dl>
		</xsl:when>
		<xsl:when test="@t='dh'">
			<dl class="dl-horizontal">
				<xsl:apply-templates select="it" mode="dlist"/>
			</dl>
		</xsl:when>
	</xsl:choose>
</xsl:template>
<xsl:template match="it" mode="list">
	<li class="{@c}"><xsl:apply-templates select="*"/></li>
</xsl:template>
<xsl:template match="it" mode="dlist">
	<dt><xsl:value-of select="@t"/></dt>
	<dd><xsl:value-of select="."/></dd>
</xsl:template>

<xsl:template match="cd">
	<pre class="pre-scrollable"></pre>
</xsl:template>

<xsl:template match="ico"><i class="icon-{@p}"></i></xsl:template>
<xsl:template match="wico"><i class="icon-{@p} icon-white"></i></xsl:template>


</xsl:stylesheet>
