const axios = require('axios');
const config = require('./config');

const muni = require('./agencies/muni/muni');
const marin = require('./agencies/marin/marin');
const ttc = require('./agencies/ttc/ttc');

while (Date.now() % 15000) {} // spin until the first second multiple fo 15
setInterval(updateVehicles, 15000);

function updateVehicles() {
  return Promise.all([muni, marin, ttc].map((agency) => {
    return new agency().updateCassandraVehicles();
  })).catch((err) => {
    console.log(err);
  });
}
