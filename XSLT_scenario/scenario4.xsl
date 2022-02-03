<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="html" indent="yes"/>

    <!--Display all visiting locations (includeing date and time) for each tour operation in HTML table.-->
    
    <!--Form a table with 4 columns (tour type, date, time and activity).-->
    <xsl:template match="/">
        <html>
            <body>
                <table border="1">
                    <tr>
                        <td>Tour Type</td>
                        <td>Date</td>
                        <td>Time</td>
                        <td>Activity</td>
                    </tr>
                    <xsl:apply-templates/>
                </table>
                
            </body>
        </html>
    </xsl:template>
    
    <!--At each Operation, iteratively traverse the Itineraries node to obtain required information.-->
    <xsl:template match="*/Operation">
            <xsl:variable name="tourType" select="Type/@OperationType"/>
            <xsl:variable name="tourCategory" select="TourCategory/Type"/>

            <xsl:for-each select="Itineraries/Date">

                <xsl:variable name="date" select="@Date"/>

                <xsl:for-each select="VisitingLocations/Name">
                    <tr>
                        <td>
                            <xsl:value-of select="$tourType"/> / <xsl:value-of select="$tourCategory"/>
                        </td>
                        <td>
                            <xsl:value-of select="$date"/>
                        </td>
                        <td>
                            From <xsl:value-of select="@From"/>
                            to <xsl:value-of select="@To"/>
                        </td>
                        <td>
                            <xsl:value-of select="."/>
                        </td>
                    </tr>
                </xsl:for-each>
            
            </xsl:for-each>
            
    </xsl:template>

</xsl:stylesheet>
