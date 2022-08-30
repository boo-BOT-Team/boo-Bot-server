const pool = require('../utils/pool');

module.exports = class Link {
  id;
  url;
  theme_id;

  constructor(row) {
    this.id = row.id;
    this.url = row.url;
    this.themeId = row.theme_id;
  }

  static async getLinkById(id) {
    const { rows } = await pool.query(
      `SELECT * FROM boo_links
        WHERE id = $1`,
      [id]
    );
    return new Link(rows[0]);
  }

  static async getRandomLink() {
    const { rows } = await pool.query(
      `SELECT * FROM boo_links
        ORDER BY RANDOM()
        LIMIT 1`
    );
    return new Link(rows[0]);
  }
};
