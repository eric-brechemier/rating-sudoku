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
        <xsl:call-template name="legend" />
        <xsl:call-template name="grid" />
      </body>
    </html>
  </xsl:template>

  <!--
  Background color scheme generated with: http://colorbrewer2.org/
  "3-class Blues" (3 data classes, sequential data, single hue: blue)
  The level0 uses color white; it is configured as background color
  in the color scheme tool by default, which ensures sufficient contrast.
  -->
  <xsl:variable name="level0BackgroundColor">white</xsl:variable>
  <xsl:variable name="level1BackgroundColor">#deebf7</xsl:variable>
  <xsl:variable name="level2BackgroundColor">#9ecae1</xsl:variable>
  <xsl:variable name="level3BackgroundColor">#3182bd</xsl:variable>
  <!--
  The color for the extra level 'Not Found' is the last color from the
  color scheme 4-class Reds, also from http://colorbrewer2.org/ -->
  <xsl:variable name="level404BackgroundColor">#cb181d</xsl:variable>

  <xsl:variable name="level0Class">level0-given</xsl:variable>
  <xsl:variable name="level1Class">level1-scanning</xsl:variable>
  <xsl:variable name="level2Class">level2-marking-up</xsl:variable>
  <xsl:variable name="level3Class">level3-pattern-matching</xsl:variable>
  <xsl:variable name="level404Class">level404-not-found</xsl:variable>

  <xsl:variable name="level0Text">Given</xsl:variable>
  <xsl:variable name="level1Text">Easy: Scanning (Naked Singles)</xsl:variable>
  <xsl:variable name="level2Text">Medium: Marking Up (Hidden Singles)</xsl:variable>
  <xsl:variable name="level3Text">Hard: Pattern Matching (Exclusion Classes)</xsl:variable>
  <xsl:variable name="level404Text">Problematic: Not Found (New Strategy Needed)</xsl:variable>

  <xsl:template name="legend">
    <ul class="legend">
      <xsl:call-template name="legendItem">
        <xsl:with-param name="class" select="$level0Class" />
        <xsl:with-param name="text" select="$level0Text" />
      </xsl:call-template>
      <xsl:call-template name="legendItem">
        <xsl:with-param name="class" select="$level1Class" />
        <xsl:with-param name="text" select="$level1Text" />
      </xsl:call-template>
      <xsl:call-template name="legendItem">
        <xsl:with-param name="class" select="$level2Class" />
        <xsl:with-param name="text" select="$level2Text" />
      </xsl:call-template>
      <xsl:call-template name="legendItem">
        <xsl:with-param name="class" select="$level3Class" />
        <xsl:with-param name="text" select="$level3Text" />
      </xsl:call-template>
      <xsl:call-template name="legendItem">
        <xsl:with-param name="class" select="$level404Class" />
        <xsl:with-param name="text" select="$level404Text" />
      </xsl:call-template>
    </ul>
  </xsl:template>

  <xsl:template name="legendItem">
    <xsl:param name="class" />
    <xsl:param name="text" />
    <li>
      <div class="legend-color {$class}"></div>
      <xsl:value-of select="$text" />
    </li>
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
td { text-align: center; padding: 0; }

/* Leftover clues displayed in unsolved puzzles */
table table {
  border: none;
  margin: 0;
}
table table td {
  width: 20px;
  height: 20px;
  border: none;
  color: white;
  font-size: small;
}

/* Contrast of given vs solution */
td {
  color: #333;
  font-family: sans-serif;
}
td.<xsl:value-of select="$level0Class" /> {
  background-color: <xsl:value-of select="$level0BackgroundColor" />;
  color: black;
  font-weight: 900;
}

/* Difficulty Rating */
.<xsl:value-of select="$level1Class" /> {
  background-color: <xsl:value-of select="$level1BackgroundColor" />;
}
.<xsl:value-of select="$level2Class" /> {
  background-color: <xsl:value-of select="$level2BackgroundColor" />;
}
.<xsl:value-of select="$level3Class" /> {
  background-color: <xsl:value-of select="$level3BackgroundColor" />;
}
.<xsl:value-of select="$level404Class" /> {
  background-color: <xsl:value-of select="$level404BackgroundColor" />;
}

/* Legend */
.legend {
  float: right;
  margin-right: 2em;
  list-style-type: none;
}
.legend-color {
  width: 1em;
  height: 1em;
  border: 1px solid black;
  display: inline-block;
  margin-right: 0.5em;
  vertical-align: text-top;
  margin-bottom: 0.5em;
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

  <xsl:template mode="cell" match="sudoku:square[@value]">
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

  <xsl:template mode="cell" match="sudoku:square[not(@value)]">
    <td class="col{@col} row{@row} {$level404Class}">
      <table>
        <tr>
          <xsl:apply-templates mode="clue" select=".">
            <xsl:with-param name="symbol" select="1" />
          </xsl:apply-templates>
          <xsl:apply-templates mode="clue" select=".">
            <xsl:with-param name="symbol" select="2" />
          </xsl:apply-templates>
          <xsl:apply-templates mode="clue" select=".">
            <xsl:with-param name="symbol" select="3" />
          </xsl:apply-templates>
        </tr>
        <tr>
          <xsl:apply-templates mode="clue" select=".">
            <xsl:with-param name="symbol" select="4" />
          </xsl:apply-templates>
          <xsl:apply-templates mode="clue" select=".">
            <xsl:with-param name="symbol" select="5" />
          </xsl:apply-templates>
          <xsl:apply-templates mode="clue" select=".">
            <xsl:with-param name="symbol" select="6" />
          </xsl:apply-templates>
        </tr>
        <tr>
          <xsl:apply-templates mode="clue" select=".">
            <xsl:with-param name="symbol" select="7" />
          </xsl:apply-templates>
          <xsl:apply-templates mode="clue" select=".">
            <xsl:with-param name="symbol" select="8" />
          </xsl:apply-templates>
          <xsl:apply-templates mode="clue" select=".">
            <xsl:with-param name="symbol" select="9" />
          </xsl:apply-templates>
        </tr>
      </table>
    </td>
  </xsl:template>

  <xsl:template mode="clue" match="sudoku:square">
    <xsl:param name="symbol" />
    <td>
      <xsl:choose>
        <xsl:when test="sudoku:allowed/sudoku:symbol[. = $symbol]">
          <xsl:value-of select="$symbol" />
        </xsl:when>
        <xsl:when test="sudoku:forbidden/sudoku:symbol[. = $symbol]">
          <xsl:text>X</xsl:text>
        </xsl:when>
        <xsl:otherwise>
          <xsl:text>x</xsl:text>
        </xsl:otherwise>
      </xsl:choose>
    </td>
  </xsl:template>

</xsl:stylesheet>
