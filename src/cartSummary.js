function calculateActiveCartTotal(cartItems) {
  return cartItems
    .filter((cartItem) => cartItem.active)
    .reduce((runningTotal, cartItem) => runningTotal + cartItem.price * cartItem.quantity, 0);
}

module.exports = {
  calculateActiveCartTotal,
};
