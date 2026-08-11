const assert = require('node:assert/strict');
const test = require('node:test');

const { calculateActiveCartSummary, calculateActiveCartTotal } = require('../src/cartSummary');

test('calculateActiveCartTotal totals only active cart items', () => {
  const cartItems = [
    { active: true, price: 10, quantity: 2 },
    { active: false, price: 100, quantity: 1 },
    { active: true, price: 5, quantity: 3 },
  ];

  assert.equal(calculateActiveCartTotal(cartItems), 35);
});

test('calculateActiveCartSummary applies discount and tax to active cart items', () => {
  const cartItems = [
    { active: true, price: 100, quantity: 2 },
    { active: true, price: 50, quantity: 1 },
    { active: false, price: 1000, quantity: 1 },
  ];

  assert.deepEqual(calculateActiveCartSummary(cartItems, 0.1, 0.2), {
    subtotal: 250,
    discountAmount: 25,
    taxAmount: 45,
    total: 270,
  });
});

test('calculateActiveCartSummary returns zero totals for an empty cart', () => {
  assert.deepEqual(calculateActiveCartSummary([], 0, 0), {
    subtotal: 0,
    discountAmount: 0,
    taxAmount: 0,
    total: 0,
  });
});

test('calculateActiveCartSummary rejects invalid cart items', () => {
  assert.throws(
    () => calculateActiveCartSummary([{ active: true, price: -1, quantity: 1 }], 0, 0),
    {
      name: 'RangeError',
      message: 'Each cart item price must be a non-negative number.',
    }
  );
});

test('calculateActiveCartSummary rejects invalid rates', () => {
  assert.throws(
    () => calculateActiveCartSummary([{ active: true, price: 10, quantity: 1 }], 1.5, 0),
    {
      name: 'RangeError',
      message: 'discountRate must be a number between 0 and 1.',
    }
  );
});
