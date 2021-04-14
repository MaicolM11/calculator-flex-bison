# CALCULADORA FLEX/BISON
Calculdora que realiza operaciones de suma, resta, division y multiplicacion teniendo en cuenta las operaciones con mayor precedencia

## Compilar

Primero se tiene que compilar los archivos, para esto se creó el archivo makefile que genera el ejecutable, make normalmente es descargado con el compilador gcc.

Corra al mismo nivel del Makefile

```
make
```

## Comenzar

Para correr el programa hay dos opciones

- Correrlo sin argumentos, lo que me permite n entradas, cada entrada se debe confirmar con un salto de linea

En linux
```
./calc
```

- Correrlo con archivo de entrada, para esto debe tener un archivo de entrada y envia la ruta como argumento al ejecutable.

En linux
```
./calc input.txt
```

Donde input.txt contiene las operaciones separadas por un salto de linea, no olvide el ultimo salto de linea.

## Resultado

Tendra por consola el resultado de las operaciones que solicitó.

## Autores

- Yenny Alexandra Sanchez
- Michael Alejandro Muñoz
