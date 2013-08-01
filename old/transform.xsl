<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:strip-space elements="*"/>
  <xsl:output method="text"/>
  <xsl:template match="/">
    <xsl:text>Key,Type,DisplayName,Tier,BaseMultiplier,BaseValue,NumIngredients,RecipeValueMultiplier,Value,CraftingRecipe Total,SellPrice Num,SellPrice Type,StackLimit,Active
</xsl:text>
    <xsl:apply-templates select="/GOODS/GOOD"/>
  </xsl:template>
  <!-- write out comma separated file -->
  <xsl:template match="/GOODS/GOOD">
    <xsl:value-of select="Key/@value"/>
    <xsl:value-of select="','"/>
    <xsl:value-of select="Type/@value"/>
    <xsl:value-of select="','"/>
    <xsl:value-of select="DisplayName/@value"/>
    <xsl:value-of select="','"/>
    <xsl:value-of select="Tier/@value"/>
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
    <!-- need to define this template to output ingredients -->
    <xsl:apply-templates select="CraftingRecipe/Good"/>
    <xsl:value-of select="CraftingRecipe/Value/Total/@value"/>
    <xsl:value-of select="','"/>
    <xsl:value-of select="SellPrice/Currency/Num/@value"/>
    <xsl:value-of select="','"/>
    <xsl:value-of select="SellPrice/Currency/Type/@value"/>
    <xsl:value-of select="','"/>
    <xsl:value-of select="StackLimit/@value"/>
    <xsl:value-of select="','"/>
    <xsl:value-of select="Active/@value"/>
    <!-- the Description would go here, but it's full of commas -->
    <xsl:text xml:space="preserve">
</xsl:text>
  </xsl:template>
</xsl:stylesheet>
