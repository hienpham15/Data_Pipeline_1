<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output omit-xml-declaration="yes" indent="yes"/>
    <xsl:strip-space elements="*"/>
    
    <!--The number of each type of operation throughout the year 2022-->
    <xsl:param name="StartDate" select="'20220101'"/>
    <xsl:param name="EndDate" select="'20221231'"/>

    <xsl:template match="/">
        <!-- Search for all operations which have a begin date between 01-Jan-2022 and 31-Dec-2022 -->
        <xsl:variable name="OpsInRange" select=
        "/*/*[translate(Period/From, '-', '') >= $StartDate
        and
        $EndDate >= translate(Period/From, '-', '')]"/>
        
        <!-- Count the type of each valid operation -->
        Inbound <xsl:value-of select="count($OpsInRange/Type[@OperationType='Inbound'])"/>
        Outbound <xsl:value-of select="count($OpsInRange/Type[@OperationType='Outbound'])"/>
        Domestic <xsl:value-of select="count($OpsInRange/Type[@OperationType='Domestic'])"/>


    </xsl:template>
</xsl:stylesheet>