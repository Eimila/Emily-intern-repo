# Understanding Clean Code Principles

## Goal

Clean code is code that is easy for humans to read, understand, change, and trust. It still needs to work correctly, but the main idea is that software is maintained by people over time, not just executed by computers once.

In real-world development, clean code matters because teams often need to debug issues, add features, review pull requests, onboard new developers, and return to old code months later. Code that is simple and clear reduces mistakes, saves time, and makes collaboration easier.

## Core Principles

### Simplicity

Simplicity means solving the problem with the least necessary complexity. Simple code avoids clever tricks, unnecessary abstractions, and confusing shortcuts. It should be possible to follow the logic from top to bottom without holding too many details in your head.

Simple code matters because complex code is harder to test, debug, and change. A solution should be complete, but it should not be more complicated than the problem requires.

### Readability

Readability means code should clearly communicate what it does. Good variable names, function names, spacing, and structure help other developers understand the purpose of the code quickly.

Readable code matters because developers spend more time reading code than writing it. If the code is easy to read, reviews are faster, bugs are easier to find, and new team members can contribute sooner.

### Maintainability

Maintainability means future developers should be able to safely modify the code. Maintainable code is usually organized into focused functions, avoids duplication, and keeps related logic together.

Maintainability matters because software keeps changing. New requirements, bug fixes, and refactoring are normal parts of development. If code is hard to maintain, every future change becomes slower and riskier.

### Consistency

Consistency means following the same style, patterns, naming conventions, and project rules throughout the codebase. This includes formatting, file organization, error handling, and how similar problems are solved.

Consistency matters because it makes a project feel predictable. When code follows established conventions, developers can focus on the logic instead of trying to understand a new style in every file.

### Efficiency

Efficiency means writing code that performs well enough for the situation. Efficient code avoids obvious waste, such as unnecessary repeated work or expensive operations inside loops.

However, efficiency should not mean premature over-engineering. The best approach is usually to write clear code first, measure performance when needed, and optimize the parts that actually create problems.

## Messy Code Example

This is an example of messy JavaScript code for calculating the total price of active cart items after applying a discount:

```js
function x(a, d) {
  let z = 0;
  for (let i = 0; i < a.length; i++) {
    if (a[i].active == true) {
      if (a[i].price != null) {
        z = z + a[i].price * a[i].qty;
      }
    }
  }
  if (d > 0) {
    z = z - z * d;
  }
  return z;
}
```

## Why This Code Is Difficult To Read

The code works, but it is harder to understand than it needs to be.

- The function name `x` does not explain what the function does.
- The parameter names `a` and `d` are too short and unclear.
- The variable name `z` does not describe what value it stores.
- The comparison `a[i].active == true` is unnecessary.
- The function mixes several ideas together: checking active items, calculating item totals, and applying a discount.
- It is not obvious whether `d` should be written as `0.1`, `10`, or something else.
- The code does not clearly handle missing quantity values.

## Cleaner Rewrite

```js
function calculateDiscountedCartTotal(cartItems, discountRate) {
  const activeItems = cartItems.filter((item) => item.active);

  const subtotal = activeItems.reduce((total, item) => {
    const quantity = item.quantity ?? 1;
    return total + item.price * quantity;
  }, 0);

  return subtotal - subtotal * discountRate;
}
```

## Why The Rewrite Is Cleaner

The rewritten version is cleaner because the names explain the purpose of the code. `calculateDiscountedCartTotal`, `cartItems`, `discountRate`, `activeItems`, and `subtotal` all describe what they represent.

The code is also easier to maintain because each step has a clear responsibility. First it filters active items, then it calculates the subtotal, then it applies the discount. If a future developer needs to change the discount logic or item calculation, they can find the right part quickly.

The rewrite is still efficient for normal cart data because it uses simple array operations and avoids unnecessary complexity. If performance became a real issue for very large carts, the code could be optimized later based on measurement.

## Conclusion

Clean code is not about making code look fancy. It is about making code easier to understand, safer to change, and better for teamwork. Simplicity, readability, maintainability, consistency, and efficiency all help reduce confusion and make software easier to improve over time.

## References

- National Cyber Security Centre, ["Produce clean & maintainable code"](https://www.ncsc.gov.uk/collection/developers-collection/principles/produce-clean-maintainable-code)
- Google Go Style Guide, ["Style principles"](https://google.github.io/styleguide/go/guide.html)
- SonarSource, ["Clean Code definition"](https://docs.sonarsource.com/sonarqube-server/10.6/user-guide/clean-code/definition)
