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
        <table id="recipeTable" class="table table-condensed table-striped table-bordered table-hover">
          <tr>
            <th>Active</th>
            <th>Key</th>
            <th>Level</th>
            <th>SubKey</th>
            <th>Shopkeeper</th>
            <th>Occupation</th>
            <th>BaseMultiplier</th>
            <th>BaseValue</th>
            <th>NumIngredients</th>
            <th>RecipeValueMultiplier</th>
            <th>Value</th>
            <th>CraftingRecipe/Good/...</th>
            <th>CraftingRecipe/Value/Total</th>
            <th>UsedInOtherRecipes</th>
            <th>AllowJunk</th>
            <th>MinorUpgradeDesc/SkillPoints</th>
            <th>MinorUpgradeDesc/Entry/...</th>
            <th>MajorUpgradeDesc/SkillPoints</th>
            <th>MajorUpgradeDesc/Entry/...</th>
          </tr>
          <xsl:apply-templates select="/GOODS/GOOD"/>
        </table>
      </body>
    </html>
  </xsl:template>
  <xsl:template match="/GOODS/GOOD[Active/@value='TRUE']">
    <tr>
      <td>
        <xsl:value-of select="Active/@value"/>
      </td>
      <td>
        <xsl:value-of select="Key/@value"/>
      </td>
      <td>
        <xsl:value-of select="Level/@value"/>
      </td>
      <td>
        <xsl:value-of select="SubKey/@value"/>
      </td>
      <td>
        <xsl:value-of select="Shopkeeper/@value"/>
      </td>
      <td>
        <xsl:value-of select="Occupation/@value"/>
      </td>
      <td>
        <xsl:value-of select="BaseMultiplier/@value"/>
      </td>
      <td>
        <xsl:value-of select="BaseValue/@value"/>
      </td>
      <td>
        <xsl:value-of select="NumIngredients/@value"/>
      </td>
      <td>
        <xsl:value-of select="RecipeValueMultiplier/@value"/>
      </td>
      <td>
        <xsl:value-of select="Value/@value"/>
      </td>
      <td>
        <xsl:apply-templates select="CraftingRecipe/Good"/>
      </td>
      <td>
        <xsl:value-of select="CraftingRecipe/Value/Total/@value"/>
      </td>
      <td>
        <xsl:value-of select="UsedInOtherRecipes/@value"/>
      </td>
      <td>
        <xsl:value-of select="AllowJunk/@value"/>
      </td>
      <td>
        <xsl:value-of select="MinorUpgradeDesc/SkillPoints/@value"/>
      </td>
      <td>
        <xsl:apply-templates select="MinorUpgradeDesc/Entry"/>
      </td>
      <td>
        <xsl:value-of select="MajorUpgradeDesc/SkillPoints/@value"/>
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
