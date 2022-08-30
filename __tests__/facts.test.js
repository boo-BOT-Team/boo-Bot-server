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

  it('#GET /api/v1/facts/:id should return a fact by id', async () => {
    const res = await request(app).get('/api/v1/facts/1');
    expect(res.status).toBe(200);
    expect(res.body).toEqual({
      id: '1',
      content: 'Spooky',
      themeId: expect.any(String),
    });
  });

  it('#GET /api/v1/facts/random should return a random fact', async () => {
    const res = await request(app).get('/api/v1/facts/random');
    expect(res.status).toBe(200);
    expect(res.body).toEqual(
      expect.objectContaining({
        id: expect.any(String),
        content: expect.any(String),
        themeId: expect.any(String),
      })
    );
  });
});
