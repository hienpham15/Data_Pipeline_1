<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="xml" indent="yes"/>
    
    <!-- Convert all of attributes into child element(s) of the node for future expansion -->
    
    <!--Apply identity transformation.-->
    <xsl:template match="node()">
        <xsl:copy>
            <xsl:apply-templates select="@*|node()" />
        </xsl:copy>
    </xsl:template>
    
    <!--At each node, its attribute is turned into node's child element.-->
    <xsl:template match="@*">
        <xsl:element name="{name()}">
            <xsl:value-of select="." />
        </xsl:element>
    </xsl:template>
</xsl:stylesheet>
