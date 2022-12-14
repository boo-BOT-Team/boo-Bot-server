const { Router } = require('express');
const Theme = require('../models/Theme');

module.exports = Router()
  .get('/', async (req, res, next) => {
    try {
      const theme = await Theme.getAllThemes();
      res.json(theme);
    } catch (e) {
      next(e);
    }
  })
  .get('/:id', async (req, res, next) => {
    try {
      const theme = await Theme.getThemeById(req.params.id);
      res.json(theme);
    } catch (e) {
      next(e);
    }
  });
