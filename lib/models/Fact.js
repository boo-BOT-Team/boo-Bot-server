const pool = require('../utils/pool');

module.exports = class Fact {
  id;
  content;
  theme_id;

  constructor(row) {
    this.id = row.id;
    this.content = row.content;
    this.themeId = row.theme_id;
  }

  // i would reduce the redundancy in your method calls
  // remember they are static so they will be called using the classname
  // Fact.getFactById can just become Fact.getById etc.
  static async getById(id) {
    const { rows } = await pool.query(
      `SELECT * FROM boo_facts
        WHERE id = $1`,
      [id]
    );
    return new Fact(rows[0]);
  }

  static async getRandom() {
    const { rows } = await pool.query(
      `SELECT * FROM boo_facts
        ORDER BY RANDOM()
        LIMIT 1`
    );
    return new Fact(rows[0]);
  }

  static async getAll() {
    const { rows } = await pool.query(
      'SELECT * FROM boo_facts'
    );

    return rows.map((row) => new Fact(row));
  }
};
