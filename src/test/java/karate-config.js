function fn() {    
  var env = karate.env; // get system property 'karate.env'
  karate.log('karate.env system property was:', env);
  if (!env) {
    env = 'dev';
  }
  var config = {
    env: env,
	amBaseUrl: 'https://localhost:9443',
	amUsername: 'admin',
	amPassword: 'admin',
	accessTokenUrl: 'https://localhost:8243',
	targetApiUrl: 'https://10.0.2.15:8243'
  }
  if (env == 'dev') {
    // customize
    // e.g. config.foo = 'bar';
  } else if (env == 'e2e') {
    // customize
  }
  return config;
}