const { Pool } = require('pg');
module.exports = new Pool({
  host: 'localhost',
  user: 'postgres',
  password: 'Gladyspuerto65',
  database: 'approval_db',
  port: 5432
});
