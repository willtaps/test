*-----------------------------------------------------------------------------
* <Rating>0</Rating>
*-----------------------------------------------------------------------------
<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl">
    <xsl:output method="text" indent="yes"/>
  <xsl:template match="/ofsAppRequest">
    APPLICATION:<xsl:value-of select="./request/application"/>
    TRANSACTION.ID:<xsl:value-of select="./request/transactionID"/>
  </xsl:template>
<xsl:template match="/ofsResponse">
    STATUS:<xsl:value-of select="./response/successFail"/>
    TRANSACTION.ID:<xsl:value-of select="./response/recordId"/>
  </xsl:template>
</xsl:stylesheet>
