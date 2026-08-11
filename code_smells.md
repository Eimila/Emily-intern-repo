# Identifying & Fixing Code Smells

## Goal

Code smells are warning signs that code may be harder to understand, maintain, test, or extend than it needs to be. A smell does not always prove the code is broken, but it is a useful signal that the design should be inspected.

Researching common code smells showed that the biggest risk is usually future change. Smelly code can work today, but it often makes the next bug fix or feature slower because the logic is hidden, duplicated, tightly coupled, or difficult to test.

## Common Code Smells

- **Magic Numbers & Strings**: Hardcoded values such as `100`, `10`, or `"priority"` appear without names that explain their purpose.
- **Long Functions**: One function handles many steps, making the normal flow harder to scan.
- **Duplicate Code**: The same calculation or condition appears in multiple places.
- **Large Classes (God Objects)**: One object handles validation, pricing, formatting, shipping, and reporting instead of separating responsibilities.
- **Deeply Nested Conditionals**: Multiple nested `if`/`else` blocks make edge cases and normal flow hard to follow.
- **Commented-Out Code**: Old unused code remains in the file and distracts from the real implementation.
- **Inconsistent Naming**: Names like `o`, `x`, `sum`, or `cust` do not clearly explain what they represent.

## Smelly Code Example

This example was written to demonstrate multiple smells at once:

```js
class OrderManager {
  process(o) {
    let sum = 0;

    // old discount logic
    // if (o.cust.vip) sum = sum * 0.8;

    for (let i = 0; i < o.items.length; i++) {
      sum += o.items[i].price * o.items[i].qty;
    }

    let ship = 0;
    if (o.type === 'priority') {
      ship = 25;
    } else {
      if (sum > 100) {
        ship = 0;
      } else {
        ship = 10;
      }
    }

    let discount = 0;
    if (o.cust.vip === true) {
      discount = sum * 0.15;
    }

    const tax = (sum - discount) * 0.1;

    return {
      name: o.cust.name.trim().toUpperCase(),
      sum,
      discount,
      tax,
      ship,
      total: sum - discount + tax + ship,
    };
  }
}
```

## Refactored Code

The refactored version in `src/orderSummary.js` removes those smells:

```js
const FREE_SHIPPING_THRESHOLD = 100;
const STANDARD_SHIPPING_FEE = 10;
const PRIORITY_SHIPPING_FEE = 25;
const TAX_RATE = 0.1;
const VIP_DISCOUNT_RATE = 0.15;

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
```

The final `summarizeOrder` function coordinates the workflow, while smaller helper functions own validation, subtotal calculation, discount calculation, shipping logic, and formatting.

## What Code Smells Did You Find In Your Code?

I found examples of all the requested code smells in the intentionally smelly order-processing example:

- Magic numbers and strings: values like `25`, `100`, `10`, `0.15`, `0.1`, and `"priority"` were hardcoded.
- Long function: `process` handled validation assumptions, subtotal calculation, shipping, discount, tax, formatting, and return-object creation.
- Duplicate code: pricing-style calculations were repeated directly instead of being named and reused.
- Large class / God Object: `OrderManager` was responsible for too many unrelated tasks.
- Deeply nested conditionals: shipping logic used nested `if`/`else` blocks.
- Commented-out code: old discount logic remained in the method.
- Inconsistent naming: names like `o`, `sum`, `ship`, `cust`, and `qty` were less clear than `order`, `subtotal`, `shippingFee`, `customer`, and `quantity`.

## How Did Refactoring Improve The Readability And Maintainability Of The Code?

Refactoring improved readability by giving important concepts clear names. Constants explain the meaning of business values, and function names explain each step of the calculation. The main order summary flow is now easier to read because it is not buried inside one long method.

Refactoring also improved maintainability by separating responsibilities. If the VIP discount changes, the update belongs in `calculateVipDiscount`. If shipping rules change, the update belongs in `calculateShippingFee`. This reduces the chance of accidentally changing unrelated behavior.

## How Can Avoiding Code Smells Make Future Debugging Easier?

Avoiding code smells makes debugging easier because problems are easier to isolate. Small functions, clear names, and named constants make it faster to find the part of the code responsible for a bug.

Removing duplication also prevents inconsistent fixes. If a calculation exists in one place, a bug can be fixed once instead of being hunted down across several copied versions. Avoiding deep nesting and commented-out code keeps the real execution path visible, which makes debugging less confusing.

## References

- Martin Fowler, ["Code Smell"](https://martinfowler.com/bliki/CodeSmell.html)
- Martin Fowler, ["Refactoring"](https://www.martinfowler.com/books/refactoring.html)
- Refactoring.Guru, ["Code Smells"](https://refactoring.guru/refactoring/smells)
- Refactoring.Guru, ["Long Method"](https://refactoring.guru/smells/long-method)
- Refactoring.Guru, ["Duplicate Code"](https://refactoring.guru/smells/duplicate-code)
- Refactoring.Guru, ["Large Class"](https://refactoring.guru/smells/large-class)
- JetBrains Qodana, ["What is a Code Smell?"](https://www.jetbrains.com/pages/static-code-analysis-guide/code-smells/)
