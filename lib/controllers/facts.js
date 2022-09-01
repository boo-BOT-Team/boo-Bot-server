const { Router } = require('express');
const Fact = require('../models/Fact');

module.exports = Router()
  .get('/', async (req, res, next) => {
    try {
      const facts = await Fact.getAllFacts();
      res.json(facts);
    } catch (e) {
      next(e);
    }
  })
  .get('/random', async (req, res, next) => {
    try {
      const randomFact = await Fact.getRandomFact();
      res.json(randomFact);
    } catch (e) {
      next(e);
    }
  })
  .get('/:id', async (req, res, next) => {
    try {
      const fact = await Fact.getFactById(req.params.id);
      res.json(fact);
    } catch (e) {
      next(e);
    }
  });
