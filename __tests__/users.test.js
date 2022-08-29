const pool = require('../lib/utils/pool');
const setup = require('../data/setup');
const request = require('supertest');
const app = require('../lib/app');

const booUser = {
  email: 'booemail@ghost.com',
  password: 'iamghost',
};

describe('user routes', () => {
  beforeEach(() => {
    return setup(pool);
  });
  afterAll(() => {
    pool.end();
  });

  //authorized or bust
  it('#POST /api/v1/users should create a new user', async () => {
    const res = await request(app).post('/api/v1/users').send(booUser);
    const { email } = booUser;
    expect(res.status).toEqual(200);
    expect(res.body).toEqual({
      message: 'Sign in successful',
      id: expect.any(String),
      email,
    });
  });
  
  it('#POST /api/v1/users/session logs in an existing user', async () => {
    await request(app).post('/api/v1/users').send(booUser);
    const res = await request(app)
      .post('/api/v1/users/sessions')
      .send({ email: 'booemail@ghost.com', password: 'iamghost' });
    expect(res.status).toBe(200);
    expect(res.body.message).toEqual('Sign in successful');
  });

  it('#DELETE signs out a user', async () => {
    await request(app).post('/api/v1/users').send(booUser);
    await request(app).post('/api/v1/users/sessions').send(booUser);
    const res = await request(app).delete('/api/v1/users/sessions');

    expect(res.status).toBe(200);
    expect(res.body).toEqual({
      success: true,
      message: 'Signed out successfully'
    });
  });

});
//what we want to happen: 
//admin is able to login and logout 
//admin is able toCRUD on all other routes !user 
//!admin users are not able to do anything lol sry!
//user type ot user table and default to admin
// we just need authenticated middleware, shut down create user,
