import start from './index';

test('server is listening 3000', () => {
  expect(start()).toBe(true);
});
