<?xml version="1.0" encoding='utf-8'?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:output method="html" doctype-system="about:legacy-compat" />
<xsl:template match='/reservaeventos'>
<html lang="es">
  <head>
    <link href="../css/estilo.css" rel="stylesheet" type="text/css" />
    <meta name="description" content="Página principal" />
    <title>titulo de la web</title>
  </head>
  <body>
    <header>
      <img src= "../img/logotipo.png" alt= "Reservas" />
      <a href="teatro.xml">Teatro</a>
      <a href="restaurante.xml">Restaurante</a>
      <a href="festival.xml">Festival</a>
    </header>
    <main class="principal">
      <section class="teatro">
        <h1>PROXIMAS OBRAS DE TEATRO</h1>
	<ul>
          <xsl:apply-templates select="teatro[substring(fechahora/@dia,1,7)='2023-01']">
            <xsl:sort select="fechahora/@dia"></xsl:sort>
          </xsl:apply-templates>
	</ul>
      </section>
    </main>
    <footer>
      <address>&#169; 2020 desarrollado por info@birt.eus</address>
    </footer>
  </body>
</html>
</xsl:template>
<xsl:template match="teatro">
  <xsl:choose>
    <xsl:when test="precio>20">
      <li><u><xsl:value-of select='fechahora/@dia'/>: <xsl:value-of select='obra'/></u></li>                                
    </xsl:when>
    <xsl:otherwise>
      <li><xsl:value-of select='fechahora/@dia'/>: <xsl:value-of select='obra'/></li>                                 
    </xsl:otherwise>
  </xsl:choose>
</xsl:template>
</xsl:stylesheet>
