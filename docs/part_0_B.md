## Parte 0 (B): Preparación: implementar en Heroku

Si ya se ha desplegado en Heroku, simplemente crear un nuevo contenedor de aplicaciones con `heroku create`. Si esta es la primera vez que se despliega en Heroku, tendrás que hacer dos cosas. Primero, regístrarte para obtener una cuenta gratuita de Heroku  (http://heroku.com). A continuación, configura las claves `ssh` para comunicarse de forma segura con Heroku para implementar aplicaciones. Los tres comandos básicos que necesitas son los siguientes, pero consula la página de Heroku: (https://devcenter.heroku.com/articles/heroku-cli) para obtener más detalles.


```sh
$ ssh-keygen -t rsa
$ heroku login
$ heroku keys:add
```
Una vez que las claves estén configuradas (un proceso único), debería poder crear un "contenedor de aplicaciones" en Heroku en el que desplegará RottenPotatoes:



```sh
$ heroku create
```

Heroku le asignará a tu aplicación un nombre caprichoso como `luminous-coco-237`; una vez que se implemente tu aplicación, podrás acceder a ella en `http: // luminous-coco-237.herokuapp.com`. Puedes iniciar sesión en el sitio web de Heroku si deseas cambiar el nombre de tu aplicación.


Finalmente, implementamos nuestra aplicación en Heroku:



```sh
$ git push heroku master
```


(Podrías ver la siguiente advertencia la primera vez - está bien --- contesta con un
"sí", y en el futuro no deberías verlo más :)

     La autenticidad del servidor 'heroku.com (50.19.85.132)' no se puede establecer.
     La huella dactilar de la clave RSA es 8b: 48: 5e: 67: 0e: c9: 16: 47: 32: f2: 87: 0c: 1f: c8: 60: ad.
     ¿Estás seguro de que quieres continuar conectando (sí / no)?
     Por favor, escriba 'sí' o 'no':

¿La aplicación se está ejecutando en Heroku? Si navegas a la URL heroku que se imprime al final de los resultados de `git push heroku master`, obtendrá un mensaje" Lo sentimos, pero algo salió mal ". error en el navegador.

Podemos obtener una pista de por qué ejecutando el siguiente comando:



```sh
$ heroku logs
```

which will show an error like:

```
ActionView::Template::Error (PG::UndefinedTable: ERROR:  relation "movies" does not exist
```

Just as we ran `rake db:migrate` and `rake db:seed` to do first-time database creation locally, we must also cause a database to be created on the Heroku side:

```sh
$ heroku run rake db:migrate
```

and

```sh
$ heroku run rake db:seed
```

Now you should be able to navigate to your app's URL.  `heroku open` opens your browser to that URL in case you forgot it, however this command does not work on c9, where you will need to navigate to the relevant URL.

**Note:** don't proceed past this point until you are able to complete the above successfully, or you won't be able to receive a grade for this assignment!

Next: [Part 1: Sort the list of movies](part_1.md)
