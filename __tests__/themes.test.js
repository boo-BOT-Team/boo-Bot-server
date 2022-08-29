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

  const mockUser = {
    email: 'testUser@user.com',
    password: '123456'
  };

  const newTheme = {
    name: 'Mummy'
  };

  const registerAndLogin = async (agent, user) => {
    const res = await agent.post('/api/v1/users').send(user);
    expect(res.status).toBe(200);
    return res.body;
  };


  it('#GET /api/v1/themes should get all themes', async () => {
    const res = await request(app).get('/api/v1/themes');
    expect(res.status).toBe(200);
    expect(res.body).toEqual(expect.arrayContaining([
      {
        id: expect.any(String),
        name: expect.any(String)
      }
    ]));
  });

  it('#POST /api/v1/themes should post a new theme', async() => {
    const agent = request.agent(app);
    await registerAndLogin(agent, mockUser);
    const res = await agent.post('/api/v1/themes').send(newTheme);
    
    expect(res.status).toBe(200);
    expect(res.body).toEqual({
      id: expect.any(String),
      name: 'Mummy'
    });

  });

});
