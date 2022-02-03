<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="text"/>
    
    <!-- Search the nodes with a given ID and output the results under JSON format -->
    
    <!--Generate an xsl:key to look for Operation which matches the request ID.-->
    <xsl:key name="SearchID" match="Operation" use="@ID"/>
    <xsl:variable name="OpsID" select="1"/>
    
    <xsl:template match="TourOperator">
        <xsl:text>{</xsl:text>
        <xsl:for-each select="key('SearchID', $OpsID)">
            <xsl:call-template name="jsonType"/>    
            <xsl:call-template name="jsonPrice"/>
            <xsl:call-template name="jsonCES"/>
            <xsl:call-template name="jsonInsurance"/>
            <xsl:call-template name="jsonPeriod"/>
        </xsl:for-each>
        <xsl:text>}</xsl:text>
    </xsl:template>
    
    <!--Template to transform Type node.-->
    <xsl:template name="jsonType">
        <xsl:text>"</xsl:text> <xsl:value-of select="name(./Type)"/> <xsl:text>":</xsl:text>
        <xsl:text>[</xsl:text>
        <xsl:text>"</xsl:text> <xsl:value-of select="./Type/@OperationType"/> <xsl:text>"</xsl:text>
        <xsl:text>,</xsl:text>

        <xsl:text>{</xsl:text>
        <xsl:for-each select="./Type/*">
            <xsl:text>"</xsl:text> <xsl:value-of select="name(.)" /> <xsl:text>":</xsl:text>
            <xsl:text>"</xsl:text> <xsl:value-of select="."/> <xsl:text>"</xsl:text>
            <xsl:if test="position()!=last()">,</xsl:if>
        </xsl:for-each>
        <xsl:text>}</xsl:text>
        <xsl:text>]</xsl:text>
        <xsl:text>,</xsl:text>
    </xsl:template>
    
    <!--Template to transform Price node.-->
    <xsl:template name="jsonPrice">
        <xsl:text>"</xsl:text> <xsl:value-of select="name(./Price)"/> <xsl:text>":</xsl:text>
        <xsl:text>[</xsl:text>
        <xsl:text>"</xsl:text> <xsl:value-of select="./Price/@CurrencyCode"/> <xsl:text>"</xsl:text> 
        <xsl:text>,</xsl:text>
        <xsl:value-of select="./Price/Value"/>
        <xsl:text>]</xsl:text>
        <xsl:text>,</xsl:text>
    </xsl:template>

    <!--Template to transform CurrencyExchangeService node.-->
    <xsl:template name="jsonCES">
        <xsl:text>"</xsl:text> <xsl:value-of select="name(./CurrencyExchangeService)"/> <xsl:text>":</xsl:text>
        <xsl:text>{</xsl:text>
        <xsl:for-each select="./CurrencyExchangeService/*">
            <xsl:text>"</xsl:text> <xsl:value-of select="name(.)"/> <xsl:text>":</xsl:text>
            <xsl:choose>
                <xsl:when test="position()=1">
                    <xsl:value-of select="."/>
                </xsl:when>

                <xsl:otherwise>
                    <xsl:text>"</xsl:text> <xsl:value-of select="."/> <xsl:text>"</xsl:text>
                </xsl:otherwise>
            </xsl:choose>
            <xsl:if test="position()!=last()">,</xsl:if>
        </xsl:for-each>
        <xsl:text>}</xsl:text>
        <xsl:text>,</xsl:text>
    </xsl:template>

    <!--Template to transform Insurance node.-->
    <xsl:template name="jsonInsurance">
        <xsl:text>"</xsl:text> <xsl:value-of select="name(./Insurance)"/> <xsl:text>":</xsl:text>
        <xsl:text>{</xsl:text>
        <xsl:for-each select="./Insurance/*">
            <xsl:text>"</xsl:text> <xsl:value-of select="name(.)"/> <xsl:text>":</xsl:text>
            <xsl:choose>
                <xsl:when test="position()=1">
                    <xsl:value-of select="."/>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:text>"</xsl:text> <xsl:value-of select="."/> <xsl:text>"</xsl:text>
                </xsl:otherwise>
            </xsl:choose>
            <xsl:if test="position()!=last()">,</xsl:if>
        </xsl:for-each>
        <xsl:text>}</xsl:text>
        <xsl:text>,</xsl:text>
    </xsl:template>

    <!--Template to transform Period node.-->
    <xsl:template name="jsonPeriod">
        <xsl:text>"</xsl:text> <xsl:value-of select="name(./Period)"/> <xsl:text>":</xsl:text>
        <xsl:text>{</xsl:text>
        <xsl:for-each select="./Period/*">
            <xsl:choose>
                <xsl:when test="position()=1">
                    <xsl:text>"</xsl:text> <xsl:value-of select="name()"/> <xsl:text>":</xsl:text>
                    <xsl:text>{</xsl:text>
                    <xsl:for-each select="./*">
                        <xsl:text>"</xsl:text> <xsl:value-of select="name(.)"/> <xsl:text>":</xsl:text>
                        <xsl:value-of select="."/>

                        <xsl:if test="position()!=last()">,</xsl:if>
                    </xsl:for-each>
                    <xsl:text>}</xsl:text>
                    <xsl:text>,</xsl:text>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:text>"</xsl:text> <xsl:value-of select="name()"/> <xsl:text>":</xsl:text>
                    <xsl:text>"</xsl:text> <xsl:value-of select="."/> <xsl:text>"</xsl:text>
                    <xsl:if test="position()!=last()">,</xsl:if>
                </xsl:otherwise>
            </xsl:choose>
        </xsl:for-each>
        <xsl:text>}</xsl:text>
    </xsl:template>

    <xsl:template match="*[position() > 5]" />
</xsl:stylesheet>

