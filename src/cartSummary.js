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
  return calculateCartSubtotal(getActiveCartItems(cartItems));
}

function calculateActiveCartSummary(cartItems, discountRate, taxRate) {
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
