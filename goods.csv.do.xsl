<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:strip-space elements="*"/>
  <xsl:output method="text"/>
  <xsl:template match="/">
    <xsl:text>Active,Key,Level,SubKey,Shopkeeper,Occupation,BaseMultiplier,BaseValue,NumIngredients,RecipeValueMultiplier,Value,CraftingRecipe/Good/...,CraftingRecipe/Value/Total,UsedInOtherRecipes,AllowJunk,MinorUpgradeDesc/SkillPoints,MinorUpgradeDesc/Entry/...,MajorUpgradeDesc/SkillPoints,MajorUpgradeDesc/Entry/...
</xsl:text>
    <xsl:apply-templates select="/GOODS/GOOD"/>
  </xsl:template>
  <!-- write out comma separated file -->
  <xsl:template match="/GOODS/GOOD">
    <xsl:value-of select="Active/@value"/>
    <xsl:value-of select="','"/>
    <xsl:value-of select="Key/@value"/>
    <xsl:value-of select="','"/>
    <xsl:value-of select="Level/@value"/>
    <xsl:value-of select="','"/>
    <xsl:value-of select="SubKey/@value"/>
    <xsl:value-of select="','"/>
    <xsl:value-of select="Shopkeeper/@value"/>
    <xsl:value-of select="','"/>
    <xsl:value-of select="Occupation/@value"/>
    <xsl:value-of select="','"/>
    <xsl:value-of select="BaseMultiplier/@value"/>
    <xsl:value-of select="','"/>
    <xsl:value-of select="BaseValue/@value"/>
    <xsl:value-of select="','"/>
    <xsl:value-of select="NumIngredients/@value"/>
    <xsl:value-of select="','"/>
    <xsl:value-of select="RecipeValueMultiplier/@value"/>
    <xsl:value-of select="','"/>
    <xsl:value-of select="Value/@value"/>
    <xsl:value-of select="','"/>
    <xsl:apply-templates select="CraftingRecipe/Good"/>
    <xsl:value-of select="','"/>
    <xsl:value-of select="CraftingRecipe/Value/Total/@value"/>
    <xsl:value-of select="','"/>
    <xsl:value-of select="UsedInOtherRecipes/@value"/>
    <xsl:value-of select="','"/>
    <xsl:value-of select="AllowJunk/@value"/>
    <xsl:value-of select="','"/>
    <xsl:value-of select="MinorUpgradeDesc/SkillPoints/@value"/>
    <xsl:value-of select="','"/>
    <xsl:apply-templates select="MinorUpgradeDesc/Entry"/>
    <xsl:value-of select="','"/>
    <xsl:value-of select="MajorUpgradeDesc/SkillPoints/@value"/>
    <xsl:value-of select="','"/>
    <xsl:apply-templates select="MajorUpgradeDesc/Entry"/>
    <xsl:text xml:space="preserve">
</xsl:text>
  </xsl:template>
  <xsl:template match="/GOODS/GOOD/CraftingRecipe/Good">
    <xsl:value-of select="@value"/>
    <xsl:value-of select="' + '"/>
  </xsl:template>
  <xsl:template match="/GOODS/GOOD/MinorUpgradeDesc/Entry">
    <xsl:value-of select="Num/@value"/>
    <xsl:value-of select="'x '"/>
    <xsl:value-of select="Key/@value"/>
  </xsl:template>
  <xsl:template match="/GOODS/GOOD/MajorUpgradeDesc/Entry">
    <xsl:value-of select="Num/@value"/>
    <xsl:value-of select="'x '"/>
    <xsl:value-of select="Key/@value"/>
    <xsl:value-of select="' + '"/>
  </xsl:template>
</xsl:stylesheet>
