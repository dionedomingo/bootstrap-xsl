<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:output method="html"/>

<xsl:template match="workflow">
    <xsl:apply-templates select="menu"/>
    <div class="container">
	<div id="_body" class="row content">
	    <div class="span7 p20">
	        <h2>Main content</h2>
	    </div>
	    <div class="span4 p20">
	        <h3>Secondary content</h3>
	    </div>
	</div>
	<div class="row help">
	    <div class="span2 p20">
		<h3>Help cheatsheet</h3>
		<p class="note">don't forget</p>
	    </div>
	    <div class="span3 h20">
		<h4>Markup</h4>
		<p>=== Heading 1 ===</p>
		<p>== Heading  2 ==</p>
		<p>= Heading 3 =</p>
		<p>* List item</p>
		<p>~ Quote ~</p>
	    </div>
	    <div class="span3 h20">
		<h4>Objects &amp; links</h4>
		<p>[http://link Text For link]</p>
		<p>[commits://hash Link to commit]</p>
		<p>[issues://id Link to issue]</p>
		<p>[branches://branch/path?s=10:30 Link to file]</p>
		<p>[wiki://wiki_id Link to wiki]</p>
	    </div>
	    <div class="span3 h20">
		<h4>Embed</h4>
		<p>{http://img_url} - add image</p>
		<p>{branches://branch/path?s=1:20} - add file fragment with colorify</p>
		<p>{users://user@domain} - user profile link</p>
	    </div>
	</div>
    </div>
</xsl:template>

<xsl:template match="menu">
    <div class="navbar navbar-fixed-top">
	<div class="navbar-inner">
	    <div class="container">
        	<a class="brand" href="#home">WfloW</a>
		<ul class="nav"><xsl:apply-templates select="item" mode="menu"/></ul>
	    </div>
	</div>
    </div>
</xsl:template>

<xsl:template match="item" mode="menu">
    <xsl:choose>
        <xsl:when test="count(item) > 0">
	    <li class="dropdown">
		<a class="dropdown-toggle" data-toggle="dropdown"><xsl:value-of select="@title"/>&#0160;<b class="caret"></b></a>
		<ul class="dropdown-menu"><xsl:apply-templates select="item" mode="menu"/></ul>
	    </li> 
	</xsl:when>
	<xsl:otherwise>
	    <li><a href="#{@id}"><xsl:value-of select="@title"/></a></li>
	</xsl:otherwise>
    </xsl:choose>
</xsl:template>


<xsl:template match="branches">
    <div class="span11 p25">
	<xsl:apply-templates select="repo" mode="branches"/>
    </div>
</xsl:template>

<xsl:template match="commits">
    <div class="span11 p25">
	<xsl:apply-templates select="repo" mode="commits"/>
    </div>
</xsl:template>

<xsl:template match="tags">
    <div class="span11 p25">
	<xsl:apply-templates select="repo" mode="tags"/>
    </div>
</xsl:template>


<xsl:template match="repo" mode="branches">
    <div class="repo row">
	<div class="span3">
	    <span class='st'>Branch</span>
	    <div class="btn-group">
		<a class="btn" href="#{@current}"><xsl:value-of select="@current"/></a>
		<a class="btn dropdown-toggle" data-toggle="dropdown" href="#"><span class="caret"></span></a>
		<ul class="dropdown-menu">
		    <xsl:for-each select="branches/item">
			<li><a href="#branches:{.}">
			    <xsl:value-of select="."/>
			    <xsl:if test=".=../../@current">&#0160;<i class="icon-ok"></i></xsl:if>
    			</a></li>
		    </xsl:for-each>
		</ul>
	    </div>
	</div>
	<div class="span8 ar">
	    <h2><xsl:value-of select="@title"/></h2>
	    <xsl:value-of select="@url"/>
	</div>
    </div>
    <xsl:apply-templates select="commit" mode="last"/>
    <div id="_files">
        <xsl:apply-templates select="folder"/>
        <div class="well readme"><div id="_readme" class="wikimu v20"></div></div>
    </div>
</xsl:template>

<xsl:template match="repo" mode="commits">
    <h2>Commits <a href="commits.rss" class="rss"></a></h2>
    <xsl:apply-templates select="commit" mode="list"/>
</xsl:template>

<xsl:template match="repo" mode="tags">
    <h2>Tags <a href="tags.rss" class="rss"></a></h2>
    <xsl:apply-templates select="tags" mode="list"/>
</xsl:template>


<xsl:template match="commit" mode="last">
    <div class="well">
	<div class="commit_head">
	    <div class="commit_title">
		Last commit: <a href="#commits:{@hash}" class="fx"><xsl:value-of select="@hash"/></a>
	    </div>
	    <div class="commit_info">
		<span class="commit_time"><xsl:value-of select="time"/></span>
    		by <span class="user"><a href="#user:{user}"><xsl:value-of select="user"/></a></span>
	    </div>
	</div>
	<div class="wikimu"><xsl:value-of select="comment"/></div>
    </div>
</xsl:template>

<xsl:template match="folder">
	<xsl:call-template name="filepath">
	    <xsl:with-param name="branch" select="@current"/>
	    <xsl:with-param name="fpath" select="@path"/> 
	</xsl:call-template>
	<div>
	    <table class="table zebra-striped">
		<th width="70%" class="smth">&#0160;</th>
		<th width="10%" class="smth">Age</th>
		<th width="10%" class="smth">Access</th>
		<th width="10%" class="smth ar">Size</th>
		
		<xsl:for-each select="*">
		    <xsl:choose>
			<xsl:when test="name()='folder'">
			    <tr>
				<td class="folder" colspan="4"><a href="#branches:{../@current}/{../@path}{.}/"><xsl:value-of select="."/></a></td>
			    </tr>
			</xsl:when>
			<xsl:otherwise>
			    <tr>
				<td class="file"><a href="#branches:{../@current}/{../@path}{.}"><xsl:value-of select="."/></a></td>
				<td><xsl:value-of select="@age"/></td>
				<td><xsl:value-of select="@access"/></td>
				<td class="ar"><xsl:value-of select="@size"/></td>
			    </tr>
			</xsl:otherwise>
		    </xsl:choose>
		</xsl:for-each>
		<tr>
		    <td class="file"><a href="#branches:master/123">123</a></td>
		    <td>1</td>
		    <td>2</td>
		    <td class="ar">3</td>
		</tr>
	    </table>
	</div>
</xsl:template>

<xsl:template name="filepath">
    <xsl:param name="branch" />
    <xsl:param name="fpath" />

	<ul class="breadcrumb">
	    <li><a href="#branches:{$branch}"><xsl:value-of select="$branch"/></a></li>
	    <xsl:call-template name="filepathi">
	        <xsl:with-param name="branch" select="$branch"/>
	        <xsl:with-param name="fpath" select="$fpath"/> 
	        <xsl:with-param name="lpath">/</xsl:with-param> 
	    </xsl:call-template>
	</ul>
</xsl:template>

<xsl:template name="filepathi">
    <xsl:param name="branch" />
    <xsl:param name="fpath" />
    <xsl:param name="lpath" />

    <xsl:variable name="first" select="substring-before($fpath, '/')" /> 
    <xsl:variable name="remaining" select="substring-after($fpath, '/')" /> 

    <li><span class="divider">/</span>
    <xsl:choose>
	<xsl:when test="string-length($first)=0">
	    <xsl:value-of select="$fpath"/>
	</xsl:when>
	<xsl:otherwise>
	    <a href="#branches:{$branch}{$lpath}{$first}/"><xsl:value-of select="$first"/></a>
	</xsl:otherwise>
    </xsl:choose>
    </li>

    <xsl:if test="string-length($remaining)>0"> 
	<xsl:call-template name="filepathi">
	    <xsl:with-param name="branch" select="$branch" />
	    <xsl:with-param name="fpath" select="$remaining" /> 
	    <xsl:with-param name="lpath"><xsl:value-of select="$lpath"/><xsl:value-of select="$first"/>/</xsl:with-param>
	</xsl:call-template>
    </xsl:if>
</xsl:template>

<xsl:template match="file">
	<xsl:call-template name="filepath">
	    <xsl:with-param name="branch" select="@current"/>
	    <xsl:with-param name="fpath" select="@path"/> 
	</xsl:call-template>

	<div>
	    <ul class="nav nav-pills">
		<li class="active"><a href="#source" data-toggle="pill" rel="l">Source</a></li>
		<li><a href="#raw" data-toggle="pill" rel="l">Raw</a></li>
		<li><a href="#history" data-toggle="pill" rel="l">History</a></li>
	    </ul>
	    <div class="pill-content">
		<div class="pill-pane active" id="source">
		    <pre><code id="_code_source" rel="{@path}"></code></pre>
		</div>
		<div class="pill-pane" id="raw">
		    <pre><code id="_code_raw"></code></pre>
		</div>
		<div class="pill-pane" id="history">
		</div>
	    </div>
	</div>
</xsl:template>



</xsl:stylesheet>
