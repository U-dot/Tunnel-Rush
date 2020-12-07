# Tunnel Rush in Processing
Versión propia del juego llamado [TUNNEL RUSH](https://www.1001juegos.com/juego/color-tunnel)
en programación orientada a objetos.

## Objetivo del juego
  El objetivo del juego es llegar al final de un túnel lleno de obstáculos esquivandolos girando dentro de este último y, dependiendo del modo de juego,
  compitiendo contra otro jugador.

## Controles
Cuando se oprime:

  #### &larr; &rarr;
  El jugador (1) rota hacia la izquierda o derecha dentro del túnel, respectivamente.

  #### ´mousePressed´;
  El jugador (2) rota hacia la izquierda o derecha dentro del túnel, respectivamente.

## Páginas
  En la pestaña Driver.pde se encuentran un grupo de funciones `Pages()`, las cuales están divididas en `introPage()`, `gamePage()`, `gameOverPage()`,  `victoryPage()`, `helpPage()` y `controlPage()`. En cuál de estas página se encuentre el jugador es controlado por la función `pageSelector()`, la cual posee un   caso de un `switch` por cada función antes mencionada y el uso de `keys` especificadas en `introPage()` pasar de una página a otra. La función `controlPage()`     es la encargada del manejo de los controles y modos de juego, junto con la opción de cambiar el color de los jugadores.

## Representación del túnel

Este juego representa el túnel como una función y a los jugadores y los obstaculos mediante las clases Player y Obstacles, respectivamente.

La función que grafica el tunel es `drawTunnel()`.

Para lograrlo dibuja cada `distaceTunnel` pixeles en el eje z un polígono regular con profundidad usando la función `polygon3D(...)`.
Dicha función fue creada a partir del ejemplo de Processing  de [polígonos regulares](https://processing.org/examples/regularpolygon.html).


## Clase Player

Cada jugador tiene 3 atributos:

+ Color `c`.

+ Distancia al origen `radius`.

+ Coordenada theta respecto al eje x `angle`.


Y tiene 3 métodos:

+ `drawP()` Dibuja el jugador en el túnel

+ `keyPressed1()` Rota al jugador 1

+ `Mouse()` Rota al jugador 2

Para graficar el jugador se utiliza un círculo que rota a una distancia `radius` del origen.


## Clase Obstacle

Cada obstáculo tiene 9 atributos:

+ Color `c`.

+ Distancia al origen `radius`.

+ Coordenada theta respecto al eje x `angle`.

+ Posición en lo largo del túnel `posZ`

+ Número de lados del polígono `type`

+ Número de sub-obstáculos `number`

+ Tamaño `size`

+ Profundidad `deepness`

+ Ángulos de cada uno de los sub-obstáculos`[] oba`

El número de sub-obstáculos es el número de obstáculos en una misma posición en el tunel.

Y un método:

+ `display()` Dibuja el obstáculo en el túnel

Para dibujar el obstáculo se grafican `number` polígonos de `type` lados con profundidad usando la función `polygon3D(...)`.
