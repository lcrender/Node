const callback = require('../app/callback.js');

describe('callbacks', () => {
    test('multi 2 * 1 = 2', () => {
        expect(math.multiplicar(2, 1)).toBe(2);
    });
});