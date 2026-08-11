const FREE_SHIPPING_THRESHOLD = 100;
const STANDARD_SHIPPING_FEE = 10;
const PRIORITY_SHIPPING_FEE = 25;
const TAX_RATE = 0.1;
const VIP_DISCOUNT_RATE = 0.15;

function assertValidOrder(order) {
  if (order === null || typeof order !== 'object') {
    throw new TypeError('order must be an object.');
  }

  if (!Array.isArray(order.items)) {
    throw new TypeError('order.items must be an array.');
  }

  order.items.forEach((orderItem) => {
    if (!Number.isFinite(orderItem.price) || orderItem.price < 0) {
      throw new RangeError('Each order item price must be a non-negative number.');
    }

    if (!Number.isInteger(orderItem.quantity) || orderItem.quantity < 1) {
      throw new RangeError('Each order item quantity must be a positive integer.');
    }
  });
}

function calculateOrderItemSubtotal(orderItem) {
  return orderItem.price * orderItem.quantity;
}

function calculateOrderSubtotal(orderItems) {
  return orderItems.reduce(
    (runningSubtotal, orderItem) => runningSubtotal + calculateOrderItemSubtotal(orderItem),
    0
  );
}

function calculateVipDiscount(subtotal, isVipCustomer) {
  if (!isVipCustomer) {
    return 0;
  }

  return subtotal * VIP_DISCOUNT_RATE;
}

function calculateShippingFee(subtotal, shippingMethod) {
  if (shippingMethod === 'priority') {
    return PRIORITY_SHIPPING_FEE;
  }

  if (subtotal >= FREE_SHIPPING_THRESHOLD) {
    return 0;
  }

  return STANDARD_SHIPPING_FEE;
}

function formatCustomerName(customerName) {
  return customerName.trim().toUpperCase();
}

function summarizeOrder(order) {
  assertValidOrder(order);

  const subtotal = calculateOrderSubtotal(order.items);
  const discountAmount = calculateVipDiscount(subtotal, order.customer.isVip);
  const taxableAmount = subtotal - discountAmount;
  const taxAmount = taxableAmount * TAX_RATE;
  const shippingFee = calculateShippingFee(subtotal, order.shippingMethod);

  return {
    customerName: formatCustomerName(order.customer.name),
    subtotal,
    discountAmount,
    taxAmount,
    shippingFee,
    total: taxableAmount + taxAmount + shippingFee,
  };
}

module.exports = {
  summarizeOrder,
};
