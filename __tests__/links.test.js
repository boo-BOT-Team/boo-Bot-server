const pool = require('../lib/utils/pool');
const setup = require('../data/setup');
const request = require('supertest');
const app = require('../lib/app');

describe('user routes', () => {
  beforeEach(() => {
    return setup(pool);
  });
  afterAll(() => {
    pool.end();
  });

  it('#GET /api/v1/links/:id should return a link by id', async () => {
    const res = await request(app).get('/api/v1/links/1');
    expect(res.status).toBe(200);
    expect(res.body).toEqual({
      id: '1',
      url: 'https://en.wikipedia.org/wiki/Ghost',
      themeId: expect.any(String),
    });
  });
});
