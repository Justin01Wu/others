<?xml version="1.0" encoding="iso-8859-1"?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:template match="/">
		<html>
			<head>
				<title>case desc</title>
			</head>
			<body>


				<xsl:for-each select="/masterfile/doc">
					<xsl:variable name="code" select='@filename' />
					<xsl:call-template name="OneCase">
						<xsl:with-param name="CaseFile" select="$code" />
					</xsl:call-template>


				</xsl:for-each>

			</body>
		</html>
	</xsl:template>

	<xsl:template name="OneCase">
		<xsl:param name="CaseFile" />

		file:
		<b>
			<xsl:value-of select="$CaseFile" />
		</b>
		<br />
			
		title:		
		<xsl:value-of
			select="document($CaseFile)/jmeterTestPlan/hashTree/hashTree/ThreadGroup/@testname" />		
		<br />
	
		Desc:
		<pre>
			<xsl:value-of
				select="document($CaseFile)/jmeterTestPlan/hashTree/hashTree/ThreadGroup/stringProp[@name='TestPlan.comments']" />
		</pre>
		<br />
		<br />
	</xsl:template>
</xsl:stylesheet>
