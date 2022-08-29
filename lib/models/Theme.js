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

  static async insertTheme({ name }) {
    const { rows } = await pool.query(
      `INSERT INTO boo_themes (name)
        VALUES ($1)
        RETURNING *`,
      [name]
    );
    return new Theme(rows[0]);
  }

  static async getThemeById(id) {
    const { rows } = await pool.query(
      `SELECT * FROM boo_themes 
        WHERE id=$1`,
      [id]
    );
    return new Theme(rows[0]);
  }
};
