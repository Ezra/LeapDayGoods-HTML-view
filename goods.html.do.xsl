<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:strip-space elements="*"/>
  <xsl:output method="html" indent="yes" version="4.0"/>
  <xsl:template match="/">
    <html>
      <head>
        <title>LeapDayGoods HTML</title>
        <link href="http://static.zoll.me/bootstrap/css/bootstrap.min.css" rel="stylesheet"/>
        <link href="http://static.zoll.me/bootstrap/css/bootstrap-responsive.min.css" rel="stylesheet"/>
        <link rel="stylesheet" href="http://static.zoll.me/compress/css/4cac45a213b3.css" type="text/css"/>
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
            <th class="">Mult</th>
            <th class="recipe-column">Recipe</th>
            <th class="">Minor Cost</th>
            <th class="">Major Cost</th>
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
          <xsl:attribute name="title">Black Heart</xsl:attribute>
          <xsl:attribute name="class">tooltip-icon leapday-goods-icon leapday-goods-icon-black-heart</xsl:attribute>
        </i>
        <xsl:value-of select="Key/@value"/>
        <br/>
        <h4>
          <xsl:text>Level </xsl:text>
          <xsl:value-of select="Level/@value"/>
        </h4>
      </td>
      <td>
        <xsl:value-of select="Value/@value"/>
      </td>
      <td>
        <xsl:value-of select="RecipeValueMultiplier/@value"/>
      </td>
      <td>
        <xsl:value-of select="NumIngredients/@value"/>
        <xsl:text> ingredients</xsl:text>
        <br/>
        <xsl:apply-templates select="CraftingRecipe/Good"/>
        <br/>
        <xsl:text>Junk? </xsl:text>
        <xsl:value-of select="AllowJunk/@value"/>
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
