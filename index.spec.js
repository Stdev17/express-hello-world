var start = require('./index');

test('server is listening 3000', () => {
  expect(start()).toBe(true);
});
