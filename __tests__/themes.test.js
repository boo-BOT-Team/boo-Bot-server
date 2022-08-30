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

  it('#GET /api/v1/themes should get all themes', async () => {
    const res = await request(app).get('/api/v1/themes');
    expect(res.status).toBe(200);
    expect(res.body).toEqual(
      expect.arrayContaining([
        {
          id: expect.any(String),
          name: expect.any(String),
        },
      ])
    );
  });

  it('#GET /api/v1/themes/:id should get a theme by id', async () => {
    const res = await request(app).get('/api/v1/themes/1');

    expect(res.status).toBe(200);
    expect(res.body).toEqual({
      id: expect.any(String),
      name: expect.any(String),
    });
  });
});
