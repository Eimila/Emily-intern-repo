const assert = require('node:assert/strict');
const test = require('node:test');

const { summarizeOrder } = require('../src/orderSummary');

test('summarizeOrder calculates a standard order summary', () => {
  const order = {
    customer: { name: ' Emily ', isVip: false },
    shippingMethod: 'standard',
    items: [
      { price: 20, quantity: 2 },
      { price: 15, quantity: 1 },
    ],
  };

  assert.deepEqual(summarizeOrder(order), {
    customerName: 'EMILY',
    subtotal: 55,
    discountAmount: 0,
    taxAmount: 5.5,
    shippingFee: 10,
    total: 70.5,
  });
});

test('summarizeOrder applies VIP discount and free standard shipping', () => {
  const order = {
    customer: { name: 'Keyan', isVip: true },
    shippingMethod: 'standard',
    items: [{ price: 100, quantity: 2 }],
  };

  assert.deepEqual(summarizeOrder(order), {
    customerName: 'KEYAN',
    subtotal: 200,
    discountAmount: 30,
    taxAmount: 17,
    shippingFee: 0,
    total: 187,
  });
});

test('summarizeOrder charges priority shipping even above free shipping threshold', () => {
  const order = {
    customer: { name: 'Priority Customer', isVip: false },
    shippingMethod: 'priority',
    items: [{ price: 150, quantity: 1 }],
  };

  assert.equal(summarizeOrder(order).shippingFee, 25);
});

test('summarizeOrder rejects invalid order item quantities', () => {
  const order = {
    customer: { name: 'Emily', isVip: false },
    shippingMethod: 'standard',
    items: [{ price: 10, quantity: 0 }],
  };

  assert.throws(() => summarizeOrder(order), {
    name: 'RangeError',
    message: 'Each order item quantity must be a positive integer.',
  });
});
