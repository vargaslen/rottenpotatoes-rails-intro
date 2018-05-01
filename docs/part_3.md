
## Parte 3: Recordar la configuración de ordenamiento y filtrado

OK, entonces el usuario ahora puede hacer clic en los títulos "Título de la película" o "Fecha de lanzamiento" y ver las películas ordenadas por esas columnas, y además puede usar las casillas de verificación para restringir la inclusión de películas solo con ciertas clasificaciones (censuras). Y hemos conservado RESTfulness, porque el URI en sí mismo siempre contiene los parámetros que controlarán ordenamiento y el filtrado.

El último paso es recordar estas configuraciones. Es decir, si el usuario ha seleccionado cualquier combinación de ordenamiento de columnas y de restricción por clasificación, y luego que el usuario hace clic para ver los detalles de una de las películas (por ejemplo), cuando hace clic en Volver a la lista de películas desde la página de detalles, la lista de películas debería "recordar" su configuración de ordenamiento y filtrado de antes.

(Hacer clic fuera de la lista para ver los detalles de una película es solo un ejemplo; la configuración debe recordarse independientemente de las acciones que realice, de modo que cada vez que visite la página de índice, la configuración se restablezca correctamente).

La mejor manera de "recordar" será usando el hash `session[]`, session[] es como `flash[]`, excepto que una vez que se configura algo en `sesión[]` se recuerda "para siempre" hasta que borras la sesión con `session.clear` o eliminas cosas selectivamente de ella con `session.delete(:alguna_clave)`. De esta forma, en el método `index`, puedes aplicar selectivamente las configuraciones de session[]   incluso si el URI entrante no tiene el conjunto apropiado de params[] .

### Consejos y advertencias

Si el usuario incluye explícitamente nuevas configuraciones de ordenamiento/filtrado en `params[]`, la sesión no debe anularlas. En cambio, estas nuevas configuraciones deberían tomar precedencia y mantenerse en la sesión.

Si un usuario desmarca todas las casillas de verificación, usa la configuración almacenada en el hash `session[]`, ya que no tiene sentido que un usuario desmarque todas las casillas.

Para que sea "RESTful", queremos preservar la propiedad de que un URI que da como resultado una vista ordenada/filtrada siempre contiene los parámetros de ordenamiento/filtrado correspondientes. Por lo tanto, si encuentras que el URI entrante carece de los `params[]` correctos y estás obligado a rellenarlos desde la `sesión[]`, lo apropiado que debes hacer es un `redirect_to` al nuevo URI y que contenga los parámetros apropiados. Sin embargo, hay que tener en cuenta un importante caso extremo: si la acción anterior había colocado un mensaje en `flash[]` para mostrar después de un redireccionamiento a la página de películas, tu redirección adicional (redirect_to) eliminará ese mensaje y nunca aparecerá, ya que `flash[]` solo sobrevive a través de una sola redirección. Para arreglar esto, usa `flash.keep` justo antes de tu redireccionamiento adicional.



### Cuando hayas terminado con esta parte

Implementa en Heroku siguiendo el mismo proceso que antes:

```sh
$ git commit -am "part 3 complete"
$ git push heroku master
```
