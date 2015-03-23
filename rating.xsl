<xsl:stylesheet
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:sudoku="http://eric.brechemier.name/game/sudoku"
  exclude-result-prefixes="sudoku"
  version="1.0"
>

  <xsl:output method="html" encoding="UTF-8" />

  <xsl:template match="/">
    <html>
      <head>
        <title>Sudoku Rating</title>
        <xsl:call-template name="rating-styles" />
      </head>
      <body>
        <h1>Sudoku Rating</h1>
        <xsl:call-template name="grid" />
      </body>
    </html>
  </xsl:template>

  <xsl:template name="rating-styles">
<style>
/* Sudoku table styles from: http://stackoverflow.com/a/3841203 */
table { border: 3px solid black; }
td { width:60px; height:60px; border:1px solid black; }
td:nth-child(3n) { border-right-width:3px; }
tr:nth-child(3n) td { border-bottom-width:3px; }

/* Enhancements to sudoku table styles */
table { border-collapse: collapse; }
td { text-align: center; }

/* Contrast of given vs solution */
td {
  color: #333;
  font-family: sans-serif;
}
td.level0-given {
  background-color: white;
  color: black;
  font-weight: 900;
}

/* Difficulty Rating */
/*
  Background color scheme generated with: http://colorbrewer2.org/
  "3-class Blues" (3 data classes, sequential data, single hue: blue)
  The level0 uses color white; it is configured as background color
  in the color scheme tool by default, which ensures sufficient contrast.
*/
.level1-scanning {
  background-color: #deebf7;
}
.level2-marking-up {
  background-color: #9ecae1;
}
.level3-pattern-matching {
  background-color: #3182bd;
}
</style>
  </xsl:template>

  <xsl:key name="cell" match="sudoku:square" use="concat(@col,@row)" />

  <xsl:template name="grid">
    <table>
      <tr>
        <xsl:apply-templates mode="cell" select="key('cell','A1')" />
        <xsl:apply-templates mode="cell" select="key('cell','B1')" />
        <xsl:apply-templates mode="cell" select="key('cell','C1')" />
        <xsl:apply-templates mode="cell" select="key('cell','D1')" />
        <xsl:apply-templates mode="cell" select="key('cell','E1')" />
        <xsl:apply-templates mode="cell" select="key('cell','F1')" />
        <xsl:apply-templates mode="cell" select="key('cell','G1')" />
        <xsl:apply-templates mode="cell" select="key('cell','H1')" />
        <xsl:apply-templates mode="cell" select="key('cell','I1')" />
      </tr>
      <tr>
        <xsl:apply-templates mode="cell" select="key('cell','A2')" />
        <xsl:apply-templates mode="cell" select="key('cell','B2')" />
        <xsl:apply-templates mode="cell" select="key('cell','C2')" />
        <xsl:apply-templates mode="cell" select="key('cell','D2')" />
        <xsl:apply-templates mode="cell" select="key('cell','E2')" />
        <xsl:apply-templates mode="cell" select="key('cell','F2')" />
        <xsl:apply-templates mode="cell" select="key('cell','G2')" />
        <xsl:apply-templates mode="cell" select="key('cell','H2')" />
        <xsl:apply-templates mode="cell" select="key('cell','I2')" />
      </tr>
      <tr>
        <xsl:apply-templates mode="cell" select="key('cell','A3')" />
        <xsl:apply-templates mode="cell" select="key('cell','B3')" />
        <xsl:apply-templates mode="cell" select="key('cell','C3')" />
        <xsl:apply-templates mode="cell" select="key('cell','D3')" />
        <xsl:apply-templates mode="cell" select="key('cell','E3')" />
        <xsl:apply-templates mode="cell" select="key('cell','F3')" />
        <xsl:apply-templates mode="cell" select="key('cell','G3')" />
        <xsl:apply-templates mode="cell" select="key('cell','H3')" />
        <xsl:apply-templates mode="cell" select="key('cell','I3')" />
      </tr>
      <tr>
        <xsl:apply-templates mode="cell" select="key('cell','A4')" />
        <xsl:apply-templates mode="cell" select="key('cell','B4')" />
        <xsl:apply-templates mode="cell" select="key('cell','C4')" />
        <xsl:apply-templates mode="cell" select="key('cell','D4')" />
        <xsl:apply-templates mode="cell" select="key('cell','E4')" />
        <xsl:apply-templates mode="cell" select="key('cell','F4')" />
        <xsl:apply-templates mode="cell" select="key('cell','G4')" />
        <xsl:apply-templates mode="cell" select="key('cell','H4')" />
        <xsl:apply-templates mode="cell" select="key('cell','I4')" />
      </tr>
      <tr>
        <xsl:apply-templates mode="cell" select="key('cell','A5')" />
        <xsl:apply-templates mode="cell" select="key('cell','B5')" />
        <xsl:apply-templates mode="cell" select="key('cell','C5')" />
        <xsl:apply-templates mode="cell" select="key('cell','D5')" />
        <xsl:apply-templates mode="cell" select="key('cell','E5')" />
        <xsl:apply-templates mode="cell" select="key('cell','F5')" />
        <xsl:apply-templates mode="cell" select="key('cell','G5')" />
        <xsl:apply-templates mode="cell" select="key('cell','H5')" />
        <xsl:apply-templates mode="cell" select="key('cell','I5')" />
      </tr>
      <tr>
        <xsl:apply-templates mode="cell" select="key('cell','A6')" />
        <xsl:apply-templates mode="cell" select="key('cell','B6')" />
        <xsl:apply-templates mode="cell" select="key('cell','C6')" />
        <xsl:apply-templates mode="cell" select="key('cell','D6')" />
        <xsl:apply-templates mode="cell" select="key('cell','E6')" />
        <xsl:apply-templates mode="cell" select="key('cell','F6')" />
        <xsl:apply-templates mode="cell" select="key('cell','G6')" />
        <xsl:apply-templates mode="cell" select="key('cell','H6')" />
        <xsl:apply-templates mode="cell" select="key('cell','I6')" />
      </tr>
      <tr>
        <xsl:apply-templates mode="cell" select="key('cell','A7')" />
        <xsl:apply-templates mode="cell" select="key('cell','B7')" />
        <xsl:apply-templates mode="cell" select="key('cell','C7')" />
        <xsl:apply-templates mode="cell" select="key('cell','D7')" />
        <xsl:apply-templates mode="cell" select="key('cell','E7')" />
        <xsl:apply-templates mode="cell" select="key('cell','F7')" />
        <xsl:apply-templates mode="cell" select="key('cell','G7')" />
        <xsl:apply-templates mode="cell" select="key('cell','H7')" />
        <xsl:apply-templates mode="cell" select="key('cell','I7')" />
      </tr>
      <tr>
        <xsl:apply-templates mode="cell" select="key('cell','A8')" />
        <xsl:apply-templates mode="cell" select="key('cell','B8')" />
        <xsl:apply-templates mode="cell" select="key('cell','C8')" />
        <xsl:apply-templates mode="cell" select="key('cell','D8')" />
        <xsl:apply-templates mode="cell" select="key('cell','E8')" />
        <xsl:apply-templates mode="cell" select="key('cell','F8')" />
        <xsl:apply-templates mode="cell" select="key('cell','G8')" />
        <xsl:apply-templates mode="cell" select="key('cell','H8')" />
        <xsl:apply-templates mode="cell" select="key('cell','I8')" />
      </tr>
      <tr>
        <xsl:apply-templates mode="cell" select="key('cell','A9')" />
        <xsl:apply-templates mode="cell" select="key('cell','B9')" />
        <xsl:apply-templates mode="cell" select="key('cell','C9')" />
        <xsl:apply-templates mode="cell" select="key('cell','D9')" />
        <xsl:apply-templates mode="cell" select="key('cell','E9')" />
        <xsl:apply-templates mode="cell" select="key('cell','F9')" />
        <xsl:apply-templates mode="cell" select="key('cell','G9')" />
        <xsl:apply-templates mode="cell" select="key('cell','H9')" />
        <xsl:apply-templates mode="cell" select="key('cell','I9')" />
      </tr>
    </table>
  </xsl:template>

  <xsl:template mode="cell" match="sudoku:square">
    <xsl:variable name="step">
      <xsl:choose>
        <xsl:when test="@step">
          <xsl:value-of select="@step" />
        </xsl:when>
        <xsl:otherwise>
          <xsl:value-of select="0" />
        </xsl:otherwise>
      </xsl:choose>
    </xsl:variable>
    <td class="col{@col} row{@row} step{$step} level{@method}">
      <xsl:value-of select="@value" />
    </td>
  </xsl:template>

</xsl:stylesheet>
