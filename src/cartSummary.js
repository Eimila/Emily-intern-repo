function getActiveCartTotal(items) {
  return items
    .filter((item) => item.active)
    .reduce((total, item) => total + item.price * item.quantity, 0);
}

module.exports = {
  getActiveCartTotal,
};
