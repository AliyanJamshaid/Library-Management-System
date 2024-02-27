const { Pool } = require("pg");

const pool = new Pool({
  user: "postgres",
  host: "localhost",
  database: "library",
  password: "12152ask",
  port: 5432,
});

module.exports = pool;
