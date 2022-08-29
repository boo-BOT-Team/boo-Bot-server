const pool = require('../utils/pool');

module.exports = class Theme {
  id;
  name;

  constructor(rows) {
    this.id = rows.id;
    this.name = rows.name;
  }

  static async getAllThemes() {
    const { rows } = await pool.query(
      'SELECT * FROM boo_themes'
    );
    return rows.map((row) => new Theme(row));
  }

};
