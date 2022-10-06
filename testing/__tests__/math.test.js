const math = require('../app/math.js');

describe('matematica', () => {
    test('multi 2 * 1 = 2', () => {
        expect(math.multiplicar(2, 1)).toBe(2);
    });
});
describe('matematica', () => {
    test('sumar 1 + 2 = 3', () => {
        expect(math.sumar(1, 2)).toBe(3);
    });
});
describe('matematica', () => {
    test('restar 1 - 2 = -1', () => {
        expect(math.restar(1, 2)).toBe(-1);
    });
});
describe('matematica', () => {
    test('dividir 2 / 2 = 1', () => {
        expect(math.dividir(2, 2)).toBe(1);
    });
});