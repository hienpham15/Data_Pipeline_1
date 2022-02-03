<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="xml" indent="yes"/>

    <!-- Visualize all available tour categories (cultural, wellness, ...) 
    and all of the associate activities of each category.-->

    <xsl:template match="/TourOperator"> 
            <xsl:apply-templates select="Operation"/>
    </xsl:template>
    
    <!--At each operation, get the type of the tour and recursively move through each available date.-->
    <xsl:template match="Operation">
            <xsl:value-of select="TourCategory/Type"/>
            <xsl:apply-templates select="TourCategory/Activities"/>
    </xsl:template>
    
    <!--Get all available activity of each date and its respective location.-->
    <xsl:template match="Activities/Date">
            <xsl:value-of select="@Date"/>
                <xsl:apply-templates select="Activity"/>
    </xsl:template>
</xsl:stylesheet>
