function fn() {
  var env = karate.env;
  if (!env) {
    env = 'dev';
  }

  var config = {
    baseUrl: 'https://petstore.swagger.io/v2'
  };

  if (env == 'qa') {
    config.baseUrl = 'https://petstore.swagger.io/v2';
  }

  return config;
}