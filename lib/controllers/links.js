const { Router } = require('express');
const Link = require('../models/Link');

module.exports = Router()
  .get('/', async (req, res, next) => {
    try {
      const links = await Link.getAllLinks();
      res.json(links);
    } catch (e) {
      next(e);
    }
  })
  .get('/random', async (req, res, next) => {
    try {
      const randomLink = await Link.getRandomLink();
      res.json(randomLink);
    } catch (e) {
      next(e);
    }
  })
  .get('/:id', async (req, res, next) => {
    try {
      const link = await Link.getLinkById(req.params.id);
      res.json(link);
    } catch (e) {
      next(e);
    }
  });
