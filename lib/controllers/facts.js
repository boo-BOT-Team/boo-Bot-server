const { Router } = require('express');
const Fact = require('../models/Fact');

module.exports = Router()
  .get('/:id', async (req, res, next) => {
    try {
      const fact = await Fact.getFactById(req.params.id);
      res.json(fact);
    } catch (e) {
      next(e);
    }
  });
