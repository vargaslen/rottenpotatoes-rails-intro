## Parte 2: filtrar la lista de películas por calificación

Mejora RottenPotatoes de la siguiente manera. En la parte superior de la lista de Todas las películas, agrega algunas casillas de verificación (checkboxes) que le permitan al usuario filtrar la lista para mostrar solo películas con ciertas clasificaciones (censuras):

(https://github.com/saasbook/hw-rails-intro/blob/master/filter-screenshot.png)

Cuando se presione el botón Actualizar (Refresh), se vuelve a mostrar la lista de películas con solo aquellas  cuyas clasificaciones fueron marcadas.

Esto requerirá un par de piezas de código. Proporcionamos el código que genera el formulario de casillas de verificación (checkboxes), que puedes incluir en la plantilla index.html.haml:

```haml
= form_tag movies_path, :method => :get do
  Include:
  - @all_ratings.each do |rating|
    = rating
    = check_box_tag "ratings[#{rating}]"
  = submit_tag 'Refresh'
```

PERO, tienes que trabajar un poco para usar el código anterior: como puedes ver, se espera que la variable `@all_ratings` contenga una colección enumerable de todos los valores posibles para una clasificación de películas, tales como: ['G' , 'PG', 'PG-13', 'R'] . Un método del controlador necesita configurar esta variable. Y dado que los valores posibles de las clasificaciones de películas son realmente responsabilidad del modelo de película, es mejor si el controlador actualiza esta variable consultando el modelo. Por lo tanto, debes crear un método de clase: `Movie` que devuelva un valor apropiado para esta colección.

También necesitarás un código que sepa (i) cómo averiguar qué casillas ha marcado el usuario y (ii) cómo restringir la consulta de la base de datos en función de ese resultado.

Con respecto a (i), intenta ver la fuente(source) del listado de películas con el formulario de casillas de verificación (checkbox), y verás que las casillas de verificación tienen nombres de campo como `ratings[G]`, `ratings[PG]`,  etc. Este forma nombrar casillas, causará que Rails agrupe los valores en un solo hash llamado `ratings`, cuyas claves serán los nombres de las casillas marcadas solamente, y cuyos valores serán el atributo de valor de la casilla de verificación (que es" 1 "por default, y así lo dejamos al invocar al ayudante `check_box_tag`). Es decir, si el usuario marca los cuadros ** G ** y ** R **, `params` incluirá el siguiente hash como un elento del hash "params": `:ratings => {"G" => "1", "R" = > "1"} `. Consulta la documentación de 'Hash` para saber como obtener fácilmente las claves(keys) de un hash, ya que no nos importan los valores en este caso (las casillas de verificación que no se marcaron no aparecen en el hash `params` ).

Con respecto a (ii), probablemente termines reemplazando `Movie.all` en el método del controlador con` Movie.where`, que tiene varias opciones para ayudarte a restringir la consulta de la base de datos.



### Consejos y advertencias

¡Asegúrate de no romper la funcionalidad de ordenar por columna  que se agregó anteriormente! Es decir, el ordenar las películas  por encabezados de columna debería seguir funcionando, y si el usuario hace clic en el encabezado de la columna "Título de película" para ordenar por título de película, los resultados mostrados deben ordenarse pero no deben estar limitados por las calificaciones marcadas (aunque se Llegará a eso en la parte 3).

Si el usuario marca (digamos) ** G ** y ** PG ** y luego vuelve a mostrar la lista, las casillas de verificación que se utilizaron para filtrar la salida deberían aparecer marcadas cuando se vuelva a mostrar la lista. Esto requerirá que modifiques ligeramente la "forma" con la casilla de verificación (checkbox) de la versión que proporcionamos arriba.

La primera vez que el usuario visita la página, todas las casillas de verificación se deben marcar por defecto (para que el usuario vea todas las películas). Por ahora, ignora el caso cuando el usuario desactive todas las casillas de verificación; en la siguiente parte se llegará  a  esto.


Recordatorio: Sigue las recomendaciones del patron MVC y ¡No pongas mucho código en tus vistas! . Configura una variable de instancia en el controlador que recuerde qué clasificaciones se usaron realmente para hacer el filtrado, y pon esa variable a disposición de la vista para que los recuadros apropiados se puedan verificar previamente cuando se vuelva a cargar la vista del índice.

Puedes hacer commit de todos los cambios que hayas hecho hasta ahora en Git, implementarlos en Heroku y verificar que funcionen en Heroku antes de pasar a la siguiente sección:


```sh
$ git commit -am "part 2 complete"
$ git push heroku master
```
