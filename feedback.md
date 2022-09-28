# Boo Bot!

Love this extension -- so impressed that you all were able to learn something new during project week. Nothing major as far as feedback - code is clear and easy to read. Just a few notes about some possible refactors and naming conventions. Excellent work friends!

- Pay attention to naming conventions to try to avoid redundancy -- you have the model name like `Fact` so you don't need `fact` in the method call -- change `Fact.getFactById` to `Fact.getFact` for example
- Make sure you remove unused code -- you have some boilerplate in your extension as well as some commented out code -- i also don't think you're using your users models/controllers right now?
- I would think about trying to break up that extension file a bit -- I see a couple of functions that can be moved out -- I also simplified some unecessary wrapping functions
