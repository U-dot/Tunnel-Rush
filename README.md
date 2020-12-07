<p align="right"><img src="https://seeklogo.com/images/U/Universidad_Nacional_de_Colombia_-_Sede_Bogot_and__225_-logo-A05EAD6D0F-seeklogo.com.png" width="30%"></p>

**Nombres:** María Sol Botello y Juan José Figueroa

**Fecha de publicación:** 7 de diciembre de 2020

# Tunnel Rush in Processing
Versión propia del juego llamado [TUNNEL RUSH](https://www.1001juegos.com/juego/color-tunnel)
en programación orientada a objetos en [processing](https://processing.org/). Para su uso, descargar la carpeta [**driver**](https://github.com/U-dot/Tunnel-Rush/tree/main/Driver) y correr todos los archivos `.pde` de manera simultánea.

## Objetivo del juego
  El objetivo de este juego es que el o los jugadores lleguen al final de un túnel lleno de obstáculos girando para esquivarlos mientras avanzan a una alta         velocidad.

## Controles
  #### &larr; &rarr;
  El jugador (1) rota hacia la izquierda o derecha dentro del túnel, respectivamente.

  #### `mousePressed`
  El jugador (2) rota hacia la izquierda o derecha dentro del túnel, respectivamente.

## Modos de juego
  Para este proyecto contamos con el modo de 1 y de 2 jugadores en un mismo túnel.

## Páginas
  En la pestaña `Driver.pde` se encuentran un grupo de funciones `Pages()`, las cuales están divididas en `introPage()`, `gamePage()`, `gameOverPage()`,  `victoryPage()`, `helpPage()` y `controlPage()`, entre las cuales se dividen las diferentes pantallas del juego.

  En cuál de estas página se encuentre el jugador es controlado por la función `pageSelector()`, la cual posee un caso de un `switch` por cada función antes         mencionada y el uso de `keys` especificadas en `introPage()` pasar de una página a otra.

  La función `controlPage()` es la encargada del manejo de los controles y modos de juego, junto con la opción de cambiar el color de los jugadores.

## Representación del túnel

  En este juego se representa el túnel utilizando la función `drawTunnel()`.

  Para lograrlo, esta función dibuja cada `distaceTunnel` pixeles un n-polígono regular con profundidad en el eje z llamando a la función `polygon3D(...)`, que a   su vez usa la función `polygon(...)` para crear dichos n-polígonos regulares.
  Dicha función fue creada a partir del ejemplo de Processing  de [polígonos regulares](https://processing.org/examples/regularpolygon.html).

## Clase `Player`
  Esta clase es la encargada de crear a cada jugador y colocarlos dentro del túnel. Cada jugador tiene 3 atributos:

   + Color `c`.

   + Distancia al origen `radius`.

   + Coordenada theta respecto al eje x `angle`.

  Y tiene 3 métodos:

   + `drawP()` Dibuja el jugador en el túnel

   + `keyPressed1()` Rota al jugador 1

   + `Mouse()` Rota al jugador 2

  Para graficar el jugador se utiliza un círculo que rota a una distancia `radius` del origen.

## Clase `Obstacle`
  Esta clase es la encargada de crear cada obstáculo y colocarlo y distribuirlo dentro del túnel. Cada obstáculo tiene 9 atributos:

   + Color `c`.

   + Distancia al origen `radius`.

   + Coordenada theta respecto al eje x `angle`.

   + Posición en lo largo del túnel `posZ`

   + Número de lados del polígono `type`

   + Número de polígonos `number`

   + Tamaño `size`

   + Profundidad `deepness`

   + Ángulos de cada uno de los sub-obstáculos `[] oba`

   Y un método:

   + `display()` Dibuja el obstáculo en el túnel

   Para dibujar el obstáculo se grafican `number` polígonos de `type` lados con profundidad o extensión usando la función `polygon3D(...)`.
   
   En la imagen se puede ver la construcción de un obstáculo de 4 polígonos de 4 lados.
   
   ![Construcción obstáculos](https://user-images.githubusercontent.com/71671790/101383343-00cb5c80-3887-11eb-832e-8426b8b6b7c9.png)
   
## Manejo de colisiones
  El manejo de las colisiones es controlado mediante la función `wreck(...)`, la cual recibe de parámetros un objeto `Obstacles` y un objeto `Player`.

  Esta función compara los ángulos de cada uno de los objetos y determina mediante su resta si existe una colision entre ellos o no. En caso positivo, aparecerá     en pantalla la `gameOverPage()`, y en caso negativo el o los jugadores seguirán jugando, y el objeto dejado atrás será borrado y procederá a realizar el mismo     proceso con el siguiente obstáculo.

## Trabajo a futuro

   Para un trabajo futuro se podría pensar en implementar:

   + Un modo PVP manejando 2 cámaras a media pantalla, donde estas se muevan junto con el jugador.

   + Rotación aleatoria de los obstáculos.

   + Trayectoria no lineal del túnel.

   + Poder jugar en el lado exterior del túnel.

## Conclusiones

  En este proyecto, el uso de la Programación Orientada a Objetos fue clave para la representación de todos los obstáculos en el túnel al mismo tiempo.

  Además, permite que el jugador sea manipulado con mayor facilidad y menor peligro de corromper su información.
  
  Todo esto junto con la facilidad que brinda el poder extraer los valores de los ángulos y la posición en z tanto del jugador como de los objetos, lo cual, a su   vez, permite encontrar una forma muy efectiva e intuitiva de verificar la colisión cada vez que se pueda presentar.

  Realizar un juego es una manera de entretenida de aplicar el paradigma de Programación Orientada a Objetos.


 ## Bibliografía
   + https://processing.org/examples/regularpolygon.html
   + https://www.aprenderaprogramar.com/index.php?option=com_content&view=article&id=646:documentar-proyectos-java-con-javadoc-comentarios-simbolos-tags-deprecated-param-etc-cu00680b&catid=68&Itemid=188
   + https://gist.github.com/Villanuevand/6386899f70346d4580c723232524d35a
   + https://discourse.processing.org/t/keypressed-for-multiple-keys-pressed-at-the-same-time/18892
   + https://forum.processing.org/two/discussion/16594/can-multiple-keys-be-pressed-on-the-keyboard
