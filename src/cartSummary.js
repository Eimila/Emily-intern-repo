function assertValidCartItems(cartItems) {
  if (!Array.isArray(cartItems)) {
    throw new TypeError('cartItems must be an array.');
  }

  cartItems.forEach((cartItem) => {
    if (cartItem === null || typeof cartItem !== 'object') {
      throw new TypeError('Each cart item must be an object.');
    }

    if (!Number.isFinite(cartItem.price) || cartItem.price < 0) {
      throw new RangeError('Each cart item price must be a non-negative number.');
    }

    if (!Number.isInteger(cartItem.quantity) || cartItem.quantity < 1) {
      throw new RangeError('Each cart item quantity must be a positive integer.');
    }
  });
}

function assertValidRate(rate, rateName) {
  if (!Number.isFinite(rate) || rate < 0 || rate > 1) {
    throw new RangeError(`${rateName} must be a number between 0 and 1.`);
  }
}

function getActiveCartItems(cartItems) {
  return cartItems.filter((cartItem) => cartItem.active);
}

function calculateCartItemSubtotal(cartItem) {
  return cartItem.price * cartItem.quantity;
}

function calculateCartSubtotal(cartItems) {
  return cartItems.reduce(
    (runningSubtotal, cartItem) => runningSubtotal + calculateCartItemSubtotal(cartItem),
    0
  );
}

function calculateRateAmount(baseAmount, rate) {
  // Keep full precision here so display or payment layers can apply their own rounding rules.
  return baseAmount * rate;
}

function calculateActiveCartTotal(cartItems) {
  assertValidCartItems(cartItems);

  return calculateCartSubtotal(getActiveCartItems(cartItems));
}

function calculateActiveCartSummary(cartItems, discountRate, taxRate) {
  assertValidCartItems(cartItems);
  assertValidRate(discountRate, 'discountRate');
  assertValidRate(taxRate, 'taxRate');

  const activeCartItems = getActiveCartItems(cartItems);
  const subtotal = calculateCartSubtotal(activeCartItems);
  const discountAmount = calculateRateAmount(subtotal, discountRate);
  const taxableAmount = subtotal - discountAmount;
  const taxAmount = calculateRateAmount(taxableAmount, taxRate);

  return {
    subtotal,
    discountAmount,
    taxAmount,
    total: taxableAmount + taxAmount,
  };
}

module.exports = {
  calculateActiveCartSummary,
  calculateActiveCartTotal,
};
