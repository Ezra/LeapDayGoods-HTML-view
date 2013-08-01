<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:strip-space elements="*"/>
  <xsl:output method="html" indent="yes" version="4.0"/>
  <xsl:template match="/">
    <html>
      <head>
        <title>Leap Day Temporary Recipedia</title>
        <link href="webfiles/bootstrap.min.css" rel="stylesheet"/>
        <link href="webfiles/bootstrap-responsive.min.css" rel="stylesheet"/>
        <link rel="stylesheet" href="webfiles/basic.css" type="text/css"/>
        <link rel="stylesheet" href="webfiles/styles.css" type="text/css"/>
        <link rel="stylesheet" href="webfiles/leapday-goods-icon.css" type="text/css"/>
      </head>
      <body>
        <div class="page-header">
          <h1>Leap Day Temporary Recipedia</h1>
        </div>
        <table id="recipeTable" class="table table-condensed table-striped table-bordered table-hover">
          <colgroup id="item-colgroup">
            <col/>
          </colgroup>
          <colgroup id="value-colgroup">
            <col/>
            <col/>
          </colgroup>
          <colgroup id="recipe-colgroup">
            <col/>
          </colgroup>
          <colgroup id="base-material-colgroup">
            <col/>
            <col/>
          </colgroup>
          <tr>
            <th class="item-column">Item</th>
            <th class="value-column">Value</th>
            <th class="value-column">Mult</th>
            <th class="recipe-column">Recipe</th>
            <th class="base-material-column">Minor Cost</th>
            <th class="base-material-column">Major Cost</th>
          </tr>
          <xsl:apply-templates select="/GOODS/GOOD"/>
        </table>
      </body>
    </html>
  </xsl:template>
  <xsl:template match="/GOODS/GOOD[Active/@value='TRUE']">
    <tr>
      <td class="item-column">
        <i data-toggle="tooltip">
          <xsl:attribute name="title">
            <xsl:value-of select="Key/@value"/>
          </xsl:attribute>
          <xsl:attribute name="class">tooltip-icon leapday-goods-icon leapday-goods-icon-<xsl:value-of select="Key/@value"/></xsl:attribute>
        </i>
        <h4>
          <xsl:value-of select="Key/@value"/>
          <br/>
          <xsl:text>Level </xsl:text>
          <xsl:value-of select="Level/@value"/>
        </h4>
      </td>
      <td class="value-column">
        <span>
          <xsl:value-of select="Value/@value"/>
        </span>
      </td>
      <td class="value-column">
        <span>
        <xsl:value-of select="RecipeValueMultiplier/@value"/>
        </span>
      </td>
      <td class="recipe-column">
		<xsl:if test="AllowJunk/@value = 'TRUE'">
        <xsl:text>Allow Junk</xsl:text>
		</xsl:if>
        <xsl:apply-templates select="CraftingRecipe/Good"/>
      </td>
      <td>
        <xsl:apply-templates select="MinorUpgradeDesc/Entry"/>
      </td>
      <td>
        <xsl:apply-templates select="MajorUpgradeDesc/Entry"/>
      </td>
    </tr>
  </xsl:template>
  <xsl:template match="/GOODS/GOOD[Active/@value='TRUE']/CraftingRecipe/Good">
    <xsl:value-of select="@value"/>
    <xsl:value-of select="' + '"/>
  </xsl:template>
  <xsl:template match="/GOODS/GOOD[Active/@value='TRUE']/MinorUpgradeDesc/Entry">
    <xsl:value-of select="Num/@value"/>
    <xsl:value-of select="'x '"/>
    <xsl:value-of select="Key/@value"/>
  </xsl:template>
  <xsl:template match="/GOODS/GOOD[Active/@value='TRUE']/MajorUpgradeDesc/Entry">
    <xsl:value-of select="Num/@value"/>
    <xsl:value-of select="'x '"/>
    <xsl:value-of select="Key/@value"/>
    <xsl:value-of select="' + '"/>
  </xsl:template>
</xsl:stylesheet>
