const { Router } = require('express');
const UserService = require('../services/UserService');
const auth = require('../middleware/auth');

const ONE_DAY_IN_MS = 1000 * 60 * 60 * 24;

module.exports = Router()
  .post('/sessions', async (req, res, next) => {
    try {
      const { email, password } = req.body;
      const token = await UserService.signIn({ email, password });
      res
        .cookie(process.env.COOKIE_NAME, token, {
          httpOnly: true,
          maxAge: ONE_DAY_IN_MS,
        })
        .json({ message: 'Sign in successful' });
    } catch (e) {
      next(e);
    }
  })

  .delete('/sessions', auth, async (req, res) => {
    res
      .clearCookie(process.env.COOKIE_NAME)
      .json({ success: true, message: 'Signed out successfully' });
  });

// .post('/', auth, async (req, res, next) => {
//   try {
//     const [user, token] = await UserService.create(req.body);
//     res
//       .cookie(process.env.COOKIE_NAME, token, {
//         httpOnly: true,
//         maxAge: ONE_DAY_IN_MS,
//       })
//       .json({ ...user, message: 'Sign in successful' });
//   } catch (e) {
//     next(e);
//   }
// })
