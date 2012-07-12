<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:output method="html" indent="yes"/>

<xsl:include href="grid.xsl"/>
<xsl:include href="forms.xsl"/>
<xsl:include href="components.xsl"/>

<xsl:template match="/">
	<xsl:apply-templates select="doc"/>
</xsl:template>

<xsl:template match="doc">
<xsl:text disable-output-escaping="yes"><![CDATA[<!DOCTYPE html>
]]></xsl:text>
<html>
 <head>
	<meta charset="utf-8"/>
	<title></title>
	
	<meta name="description" content=""/>
	<meta name="author" content=""/>

	<xsl:text disable-output-escaping="yes"><![CDATA[<!--[if lt IE 9]><script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script><![endif]-->]]></xsl:text>

	<link href="/css/bootstrap.css" rel="stylesheet" />

	<link rel="shortcut icon" type="image/x-icon" href="/i/favicon.ico"/>
	<link rel="apple-touch-icon" href="/i/a57x57.png"/>
	<link rel="apple-touch-icon" sizes="72x72" href="/i/a72x72.png"/>
	<link rel="apple-touch-icon" sizes="114x114" href="/i/a114x114.png"/>

	<script src="/js/jquery.js"></script>
	<script src="/js/jquery.xslt.js"></script>
	<script src="/js/jquery.md5.js"></script>
	<script src="/js/jquery.bootstrap.js"></script>
</head>
<body>
	<xsl:apply-templates select="*" />
</body>
</html>
</xsl:template>

</xsl:stylesheet>
