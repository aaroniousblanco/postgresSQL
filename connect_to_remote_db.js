var pgp = require('pg-promise')();
var connect_vars = require('/Users/AAWhite/digicrafts/private/config.js');

var db = pgp({
  host: connect_vars.host,
  database: 'restaurant_db',
  user: connect_vars.user,
  password: connect_vars.password
});

db.any("select * from restaurant")
  .then(function(result) {
    console.log(result);
    pgp.end();
  })
  .catch(function(err) {
    console.log(err.message);
  });

// DON'T commit the config file. git ignore it
