const { calculateActiveCartSummary, calculateActiveCartTotal } = require('../src/cartSummary');
const { summarizeOrder } = require('../src/orderSummary');

function formatCurrency(amount) {
  return new Intl.NumberFormat('en-AU', {
    currency: 'AUD',
    style: 'currency',
  }).format(amount);
}

function printMoneySummary(title, summary) {
  console.log(`\n${title}`);
  console.log('-'.repeat(title.length));

  Object.entries(summary).forEach(([label, amount]) => {
    const displayValue = typeof amount === 'number' ? formatCurrency(amount) : amount;
    console.log(`${label.padEnd(16)} ${displayValue}`);
  });
}

const cartItems = [
  { active: true, name: 'Notebook', price: 8.5, quantity: 2 },
  { active: true, name: 'Desk lamp', price: 34, quantity: 1 },
  { active: false, name: 'Archived headphones', price: 79, quantity: 1 },
];

const order = {
  customer: { isVip: true, name: ' Emily ' },
  items: [
    { price: 49, quantity: 1 },
    { price: 32.5, quantity: 2 },
  ],
  shippingMethod: 'standard',
};

console.log('Intern repo playground demo');
console.log('===========================');
console.log(`Active cart total: ${formatCurrency(calculateActiveCartTotal(cartItems))}`);

printMoneySummary('Active cart summary', calculateActiveCartSummary(cartItems, 0.1, 0.1));
printMoneySummary('Order summary', summarizeOrder(order));
