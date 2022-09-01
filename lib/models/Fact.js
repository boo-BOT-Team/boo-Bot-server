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

  static async getFactById(id) {
    const { rows } = await pool.query(
      `SELECT * FROM boo_facts
        WHERE id = $1`,
      [id]
    );
    return new Fact(rows[0]);
  }

  static async getRandomFact() {
    const { rows } = await pool.query(
      `SELECT * FROM boo_facts
        ORDER BY RANDOM()
        LIMIT 1`
    );
    return new Fact(rows[0]);
  }

  static async getAllFacts() {
    const { rows } = await pool.query(
      'SELECT * FROM boo_facts'
    );

    return rows.map((row) => new Fact(row));
  }
};
