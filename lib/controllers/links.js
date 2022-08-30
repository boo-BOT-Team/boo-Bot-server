const { Router } = require('express');
const Link = require('../models/Link');

module.exports = Router().get('/:id', async (req, res, next) => {
  try {
    const link = await Link.getLinkById(req.params.id);
    res.json(link);
  } catch (e) {
    next(e);
  }
});
