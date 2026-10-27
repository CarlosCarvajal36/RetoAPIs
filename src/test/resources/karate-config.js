function fn() {
  var env = karate.env; // Captura el entorno (ej: dev, qa, prod)
  if (!env) {
    env = 'dev';
  }

  var config = {
    env: env,
    baseUrl: 'https://reqres.in/api' // URL centralizada para reutilizar en los features
  };

  // Configuración de tiempos de espera para las peticiones HTTP (en milisegundos)
  karate.configure('connectTimeout', 5000);
  karate.configure('readTimeout', 5000);

  return config;
}