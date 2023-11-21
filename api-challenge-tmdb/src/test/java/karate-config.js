function fn() {
  var env = karate.env;

  if (!env) {
    env = 'dev';
  }

  var config = {
    env: env,
    baseUrl: 'https://api.themoviedb.org/4'
  }

  return config;
}