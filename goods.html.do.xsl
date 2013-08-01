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
        <main>
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
            <colgroup id="minor-colgroup">
              <col/>
            </colgroup>
            <colgroup id="major-colgroup">
              <col/>
            </colgroup>
            <tr>
              <th class="item-column">Item</th>
              <th class="value-column">Value</th>
              <th class="value-column">Multiplier</th>
              <th class="recipe-column">Recipe</th>
              <th class="minor-column">Levelup Cost</th>
              <th class="major-column">Major Levelup Cost</th>
            </tr>
            <xsl:apply-templates select="/GOODS/GOOD"/>
          </table>
        </main>
      </body>
    </html>
  </xsl:template>
  <xsl:template match="/GOODS/GOOD[Active/@value='TRUE']">
    <tr>
      <td class="item-column">
        <i data-toggle="tooltip">
          <xsl:attribute name="title">
            <xsl:value-of select="substring-after(Key/@value, '_')"/>
          </xsl:attribute>
          <xsl:attribute name="class">tooltip-icon leapday-goods-icon float leapday-goods-icon-<xsl:value-of select="substring-after(Key/@value, '_')"/></xsl:attribute>
        </i>
        <h4>
          <xsl:value-of select="substring-after(Key/@value, '_')"/>
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
          <i data-toggle="tooltip">
            <xsl:attribute name="title"> Junkable </xsl:attribute>
            <xsl:attribute name="class">tooltip-icon junkable-icon inline</xsl:attribute>
          </i>
        </xsl:if>
        <xsl:apply-templates select="CraftingRecipe/Good"/>
      </td>
      <td class="minor-column">
        <xsl:apply-templates select="MinorUpgradeDesc/Entry"/>
      </td>
      <td class="major-column">
        <xsl:apply-templates select="MajorUpgradeDesc/Entry"/>
      </td>
    </tr>
  </xsl:template>
  <xsl:template match="/GOODS/GOOD[Active/@value='TRUE']/CraftingRecipe/Good">
    <i data-toggle="tooltip">
      <xsl:attribute name="title">
        <xsl:value-of select="substring-after(@value, '_')"/>
      </xsl:attribute>
      <xsl:attribute name="class">tooltip-icon leapday-goods-icon inline leapday-goods-icon-<xsl:value-of select="substring-after(@value, '_')"/></xsl:attribute>
    </i>
  </xsl:template>
  <xsl:template match="/GOODS/GOOD[Active/@value='TRUE']/MinorUpgradeDesc/Entry">
    <i data-toggle="tooltip">
      <xsl:attribute name="title">
        <xsl:value-of select="substring-after(Key/@value, '_')"/>
      </xsl:attribute>
      <xsl:attribute name="class">tooltip-icon leapday-goods-icon inline leapday-goods-icon-<xsl:value-of select="substring-after(Key/@value, '_')"/></xsl:attribute>
    </i>
    <span class="base-materials-count">
      <span class="mult-indicator">x</span>
      <xsl:value-of select="Num/@value"/>
    </span>
  </xsl:template>
  <xsl:template match="/GOODS/GOOD[Active/@value='TRUE']/MajorUpgradeDesc/Entry">
    <i data-toggle="tooltip">
      <xsl:attribute name="title">
        <xsl:value-of select="substring-after(Key/@value, '_')"/>
      </xsl:attribute>
      <xsl:attribute name="class">tooltip-icon leapday-goods-icon inline leapday-goods-icon-<xsl:value-of select="substring-after(Key/@value, '_')"/></xsl:attribute>
    </i>
    <span class="base-materials-count">
      <span class="mult-indicator">x</span>
      <xsl:value-of select="Num/@value"/>
    </span>
  </xsl:template>
</xsl:stylesheet>
