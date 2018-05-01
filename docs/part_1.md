## Parte 1: ordena la lista de películas

En la lista de todas las películas, haz que los títulos de las columnas "Título de película" y "Fecha de lanzamiento" se conviertan en "links". Al hacer clic en uno de ellos, la lista debe volver a cargarse, pero debe ordenarse en orden ascendente en esa columna. Por ejemplo, al hacer clic en el encabezado de la columna "fecha de publicación", primero debe volver a mostrar la lista de películas con las películas más antiguas; hacer clic en el encabezado "título" debería mostrar las películas alfabéticamente por título. (Para las películas cuyos nombres comienzan con letras que no son, el orden de clasificación debe coincidir con el comportamiento de `String # <=>`.)


Cuando la página de películas se vuelve a mostrar con "el orden por una columna" habilitado, el encabezado de columna que se seleccionó para ordenar debería aparecer con un fondo amarillo, como se muestra a continuación. Deberás hacer esto estableciendo variables de controlador que se usen para establecer condicionalmente la clase CSS del encabezado apropiado de la tabla  a `hilite`, y pegar este simple CSS en el archivo`app/assets/stylesheets/default.css` de RottenPotatoes:



```css
table#movies th.hilite {
  background-color: yellow;
}
```

El resultado debería verse más o menos así:

![](https://github.com/saasbook/hw-rails-intro/blob/master/table-header-screenshot.png)


### Sugerencias y advertencias:

* Las vistas actuales de "RottenPotatoes"  usan el "helper" de Rutas basadas en recursos provisto por Rails: `movies_path` para generar el URI correcto para la página de índice de películas. Puede que te resulte útil saber que si le pasas a este método auxiliar  un hash de parámetros adicionales, esos parámetros serán analizados por Rails y estarán disponibles en el hash `params[]`.

* Las bases de datos son bastante buenas para devolver colecciones de filas ordenadas de acuerdo con uno o más atributos. Antes de que te apresures a ordenar la colección devuelta desde la base de datos, mira la documentación para `ActiveRecord.order` en (http://api.rubyonrails.org/v4.2.6/)   y ve si puedes hacer que la base de datos  haga el trabajo para ti

* ¡No pongas mucho código en tus vistas! La vista no debería tener que ordenar la colección en sí; su trabajo es solo mostrar cosas. El controlador debería proveer a la vista exactamente con lo que se mostrará.

Por ahora, realiza todos los cambios que hayas realizado hasta el momento e impleméntalos para verificar que funcionen en Heroku antes de pasar a la siguiente sección:


```sh
$ git commit -am "part 1 complete"
$ git push heroku master
```
