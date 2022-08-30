# ProductApp-Challenge


El objetivo de esta etapa de la entrevista es desarrollar una app utilizando una API, que le permita a un usuario ver los detalles de un producto.

-

La app debería contar con tres funcionalidades:

 - Búsqueda
 - Visualización de resultados de la búsqueda
 - Detalle del resultado 


#### Requerimientos:

- Test unitarios de la lógica del proyecto.
- Entrega del proyecto: Repositorio de código (GitHub público o similar).
- Fundamentos de elección de dependencias de terceros en caso de usarlas.
- Una breve explicación en el Readme de cada una de las dependencias de terceros.
- Manejo de casos de error desde el punto de vista del developer.
- Cómo se gestionan los casos de error inesperados, la consistencia a lo largo de toda la app, uso
de logs, etc.
- Manejo de casos de error desde el punto de vista del usuario.
- Priorizar una experiencia fluida dando feedback al usuario adecuadamente.



##### Gestor de dependencias: 
- CocoaPods

##### Dependencias Utilizadas:

- __Kingfisher:__
Esta librería se utiliza para la descarga de imagenes desde el servidor desde una url de descarga y con cache, así no se deberá descargar la imágen cada vez que llamemos a esa url.


- __SkeletonView:__
Librería utilizada para crear animaciones de carga de datos. Para generar una mejor experiencia de usuario mientras transcurre el tiempo en el que la app realiza la llamada a una api y carga esos datos solicitados.

- __Firebase:__ 
Este framework permite agregar y utilizar muchas funcionalidades a nuestra app. Algunas de ellas son: login, bases de datos, analiticas, notificaciones push, y más. En este caso, utilizada para realizar login en la app y autentificación.


