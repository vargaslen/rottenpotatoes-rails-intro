Parte 0 (A): Preparación: tener la app RottenPotatoes funcionando localmente.

La aplicación inicial de RottenPotatoes que utilizarás está en otro repositorio público (en github.com): vargaslen / rottenpotatoes-rails-intro. Haz fork de  ese repositorio en tu propia cuenta de GitHub, y luego clona tu repositorio:

$ git clone git@github.com:your_github_username/rottenpotatoes-rails-intro.git

Cada vez que comiences a trabajar en un proyecto de Rails, lo primero que debes hacer es ejecutar Bundler para asegurar de que estén instaladas todas las gemas de la aplicación. Cambia al directorio raíz de la aplicación (presumiblemente rottenpotatoes-rails-intro: cd rottenpotatoes-rails-intro) y ejecuta:

 bundle install --without production



Finalmente, creamos la base de datos local:

Primero prueba con: bundle exec rake db:setup

De no funcionar el setup, sigue los pasos que se dan a continiacin

$ rake db:migrate

Pregunta: ¿Cómo decide Rails dónde y cómo crear la base de datos de desarrollo? (Sugerencia: verifique los subdirectorios db y config)
El comando:  rake db:migrate ,crea una base de datos de desarrollo local (siguiendo las especificaciones en config / database.yml) y ejecuta las migraciones en db/migrate para crear el esquema(schema_migrations) de la aplicación. También crea / actualiza el archivo db/schema.rb para reflejar el último esquema(schema) de base de datos. Nota: es importante mantener este archivo bajo control de versiones.

Pregunta: ¿Qué tablas fueron creadas por las migraciones?
La tabla de movies en sí y la tabla interna de rails: schema_migrations  la cual registra qué migraciones se han ejecutado.


Ahora inserte los "datos de inicialización" en la base de datos: elementos de datos iniciales que la aplicación debe ejecutar:

$ rake db:seed

Pregunta: ¿Qué datos iniciales se insertaron y dónde se especificaron? (Sugerencia: rake -T db: seed explica la tarea de semilla; rake -T explica otras tareas de Rake disponibles)
Un conjunto de datos de película que se especifica en db/seeds.rb

Finalmente, deberías poder ejecutar la aplicación localmente (servidor de rails: rails server -p 3000) y navegar a http://localhost:3000 / movies en su navegador.
