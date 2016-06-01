# Archivo make para saltar varios comandos.
#
# El target ALL: invoca  a commands,
# commands: contiene los comandos de interes
# para ejecutar los scripts y generar archivos 
# de extencion: *.c , *.h y *.h que su vez mediante el:
# ejecutable.bat toma el VBA.bas con la sintaxis de 
# Visual Basic for Application  a un archivo PSScript.psm1 
# con la sintaxis de PowerShell 
all : commands

commands :	 
			flex VBAcompilador.l
			bison -dy VBAcompilador.y
			gcc lex.yy.c y.tab.c  -o Compilador







			

