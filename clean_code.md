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

## Code Formatting And Style Guides

Consistent code style is important because it makes a codebase easier to scan, review, and maintain. When everyone follows the same formatting and naming conventions, developers do not need to spend energy interpreting different personal styles in every file. This also reduces small formatting debates during code review, because automated tools can handle style decisions.

The Airbnb JavaScript Style Guide is a detailed JavaScript convention guide. It recommends patterns such as using object literals, meaningful structure, modules, strict equality, semicolons, consistent whitespace, and clear function formatting. One useful takeaway from reviewing it is that style guides are not just about appearance. Many rules also protect readability and reduce common mistakes, such as using `===` instead of `==`.

For this repository, I installed and configured ESLint and Prettier:

- ESLint checks JavaScript files in `src/**/*.js`.
- The ESLint setup extends `airbnb-base` and `prettier`.
- Prettier formats JavaScript, JSON, and Markdown files.
- `node_modules/` is ignored so installed dependencies are not committed.

The configured commands are:

```bash
npm run lint
npm run lint:fix
npm run format
```

### Why Is Code Formatting Important?

Code formatting is important because it makes code easier to read and compare. Consistent indentation, spacing, line breaks, quotes, and semicolons help developers understand the structure of the code quickly. Formatting also improves teamwork because pull requests become focused on logic and behavior instead of personal style preferences.

Formatting tools are useful because they apply rules automatically. This makes the codebase more consistent and removes the need for developers to manually fix every small spacing or line-length issue.

### What Issues Did The Linter Detect?

The linter detected four issues in the initial JavaScript example:

- `no-var`: The code used `var` instead of `let` or `const`.
- `no-plusplus`: The code used the unary `++` operator in a loop.
- `eqeqeq`: The code used `==` instead of strict equality `===`.
- `operator-assignment`: The code used `total = total + value` instead of a shorter assignment pattern.

These issues showed that the code worked, but it did not fully follow the configured JavaScript style guide. I fixed the code by rewriting the calculation with `filter` and `reduce`, using clearer function naming, avoiding `var`, and removing the loose equality comparison.

### Did Formatting The Code Make It Easier To Read?

Yes. Formatting made the code easier to read because the layout became more predictable. Prettier added consistent semicolons, spacing, and trailing commas where appropriate. After linting and cleanup, the JavaScript example became shorter and clearer because the main logic now reads as a direct sequence: filter active items, then calculate the total.

Formatting also improved the Markdown files by making spacing and line wrapping more consistent. This makes the learning notes easier to scan, especially when reviewing headings, bullet points, and longer paragraphs.

## Naming Variables And Functions

Good names are one of the simplest ways to make code easier to understand. A variable or function name should explain its purpose clearly enough that another developer can understand the code without needing extra comments. Naming conventions also matter because they make a project predictable. For example, JavaScript commonly uses `camelCase` for variables and functions, and many style guides recommend avoiding unclear abbreviations.

From reviewing naming best practices, the main ideas are:

- Use intention-revealing names that explain what the value or function represents.
- Prefer clarity over extreme shortness.
- Avoid vague names like `data`, `temp`, `x`, or `item` when the context is not obvious.
- Avoid confusing abbreviations that only one person or team understands.
- Use verbs for functions when the function performs an action, such as `calculate`, `get`, `validate`, or `format`.
- Keep names consistent with the language and project style guide.

### Unclear Naming Example

In the existing JavaScript example, the function was already working, but some names were still more general than necessary:

```js
function getActiveCartTotal(items) {
  return items
    .filter((item) => item.active)
    .reduce((total, item) => total + item.price * item.quantity, 0);
}
```

The names `items`, `item`, and `total` are understandable in a small example, but they are still broad. In a larger codebase, `items` could mean cart items, menu items, order items, or inventory items. The function name `getActiveCartTotal` is also slightly less precise because the function is calculating a value, not retrieving a stored value.

### Refactored Version

```js
function calculateActiveCartTotal(cartItems) {
  return cartItems
    .filter((cartItem) => cartItem.active)
    .reduce((runningTotal, cartItem) => runningTotal + cartItem.price * cartItem.quantity, 0);
}
```

This version uses `calculateActiveCartTotal` to describe the action more accurately. It also renames `items` to `cartItems`, `item` to `cartItem`, and `total` to `runningTotal`, which makes the purpose of each value clearer.

### What Makes A Good Variable Or Function Name?

A good variable or function name is clear, specific, and honest about what it represents. It should reveal intent, not just type. For example, `cartItems` is better than `items` because it explains what kind of items are being used. `calculateActiveCartTotal` is better than a vague name like `getTotal` because it explains the action and the result.

Good names also match the level of detail needed for the scope. A short name like `i` can be acceptable for a tiny loop counter, but important business values should have more descriptive names. A good function name should usually describe the action being performed and the result or object it affects.

### What Issues Can Arise From Poorly Named Variables?

Poorly named variables can make code feel like a puzzle. Developers may need to read the whole function, inspect surrounding files, or run the code just to understand what a value means. This slows down debugging and code review.

Bad names can also cause incorrect changes. If a name is too vague or misleading, a developer might assume it contains different data than it actually does. For example, `items` could be mistaken for all products instead of only cart items, or `total` could mean subtotal, discounted total, tax total, or running total. These misunderstandings can lead to bugs.

### How Did Refactoring Improve Code Readability?

Refactoring improved readability by making the code explain itself more clearly. The new function name, `calculateActiveCartTotal`, tells the reader that the function computes a cart total from active items. The parameter `cartItems` gives stronger context than `items`, and `cartItem` makes each callback easier to follow.

The name `runningTotal` also helps inside the `reduce` call because it explains that the value is accumulating as the array is processed. After the rename, the reader can understand the purpose of the function more quickly without relying on comments.

## Writing Small, Focused Functions

Small, focused functions are easier to understand because each function has one clear reason to exist. A good function should usually do one thing at one level of abstraction. If a function starts filtering data, calculating subtotals, applying discounts, calculating tax, and building a response object all in one place, it becomes harder to test and harder to change safely.

From researching best practices for small functions, the main ideas are:

- Keep each function focused on one responsibility.
- Use function names to describe the purpose of each step.
- Extract repeated or complicated logic into helper functions.
- Avoid mixing different levels of detail in one function.
- Prefer small behavior-preserving refactors, such as extracting a function, instead of rewriting everything at once.
- Treat loops, conditionals, and long blocks as signs that part of the function may deserve its own name.

### Long Function Example

This example calculates a cart summary, but it does too many things in one function:

```js
function calculateActiveCartSummary(cartItems, discountRate, taxRate) {
  const activeCartItems = cartItems.filter((cartItem) => cartItem.active);

  const subtotal = activeCartItems.reduce(
    (runningSubtotal, cartItem) => runningSubtotal + cartItem.price * cartItem.quantity,
    0
  );

  const discountAmount = subtotal * discountRate;
  const taxableAmount = subtotal - discountAmount;
  const taxAmount = taxableAmount * taxRate;

  return {
    subtotal,
    discountAmount,
    taxAmount,
    total: taxableAmount + taxAmount,
  };
}
```

This function is not terrible, but it already combines several responsibilities: selecting active items, calculating item totals, applying a discount, calculating tax, and building the final summary. If more business rules were added later, such as coupons, shipping, or rounding rules, the function would quickly become harder to follow.

### Refactored Into Smaller Functions

```js
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

function calculateDiscountAmount(subtotal, discountRate) {
  return subtotal * discountRate;
}

function calculateTaxAmount(taxableAmount, taxRate) {
  return taxableAmount * taxRate;
}

function calculateActiveCartSummary(cartItems, discountRate, taxRate) {
  const activeCartItems = getActiveCartItems(cartItems);
  const subtotal = calculateCartSubtotal(activeCartItems);
  const discountAmount = calculateDiscountAmount(subtotal, discountRate);
  const taxableAmount = subtotal - discountAmount;
  const taxAmount = calculateTaxAmount(taxableAmount, taxRate);

  return {
    subtotal,
    discountAmount,
    taxAmount,
    total: taxableAmount + taxAmount,
  };
}
```

The refactored version gives each step its own name. The main function now reads more like a summary of the process, while the helper functions contain the smaller details.

### Why Is Breaking Down Functions Beneficial?

Breaking down functions is beneficial because it reduces mental load. A developer can understand one small piece at a time instead of trying to understand every detail at once. Smaller functions are also easier to test because each function has a clear input and output.

This approach also makes future changes safer. For example, if the tax calculation changes, a developer can update `calculateTaxAmount` without touching the filtering or subtotal logic. If the item subtotal rule changes, the update belongs in `calculateCartItemSubtotal`. Clear boundaries make the code easier to maintain.

### How Did Refactoring Improve The Structure Of The Code?

Refactoring improved the structure by separating the calculation into clear stages. The code now has one function for active cart item filtering, one for item subtotal calculation, one for cart subtotal calculation, one for discounts, one for tax, and one coordinating function that builds the final summary.

The main function is easier to scan because it no longer hides every detail inside one block. It shows the workflow at a higher level: get active items, calculate subtotal, calculate discount, calculate tax, and return the final summary. This makes the code easier to read, test, and extend.

## Avoiding Code Duplication

The DRY principle means "Don't Repeat Yourself." The core idea is that the same piece of knowledge should have one clear place in the system. DRY is not only about removing lines that look the same. It is about avoiding repeated business rules, repeated calculations, and repeated logic that would need to be updated in multiple places later.

Duplicated code is risky because it is easy to fix one copy and forget another. Over time, the copies can drift apart, which makes bugs harder to find. Refactoring duplicated code often means extracting the shared logic into a function with a clear name.

### Duplicated Code Example

In the cart summary code, these two functions repeated the same calculation pattern:

```js
function calculateDiscountAmount(subtotal, discountRate) {
  return subtotal * discountRate;
}

function calculateTaxAmount(taxableAmount, taxRate) {
  return taxableAmount * taxRate;
}
```

The names are useful, but both functions repeat the same formula: multiply a base amount by a rate. If that calculation later needed rounding or validation, the change would have to be made in both places.

### Refactored Version

```js
function calculateRateAmount(baseAmount, rate) {
  return baseAmount * rate;
}

function calculateDiscountAmount(subtotal, discountRate) {
  return calculateRateAmount(subtotal, discountRate);
}

function calculateTaxAmount(taxableAmount, taxRate) {
  return calculateRateAmount(taxableAmount, taxRate);
}
```

The refactored version keeps the meaningful business names `calculateDiscountAmount` and `calculateTaxAmount`, but moves the shared rate calculation into `calculateRateAmount`. This keeps the code readable while giving the repeated logic one clear home.

### What Were The Issues With Duplicated Code?

The duplicated code made the same calculation appear in more than one place. That is a maintainability issue because any future change to rate-based calculations, such as rounding to two decimal places or checking for invalid rates, could easily be applied to one function but missed in the other.

Duplication also makes code harder to scan because the reader has to decide whether two similar lines are intentionally different or accidentally repeated. In this case, both functions were doing the same kind of work, so the shared logic deserved one name.

### How Did Refactoring Improve Maintainability?

Refactoring improved maintainability by creating one source of truth for rate-based amount calculations. Now `calculateRateAmount` owns the shared formula, while the discount and tax functions keep their domain-specific names.

This means future changes are safer and smaller. If the project later needs rounding, validation, or logging for percentage-based calculations, the change can happen inside `calculateRateAmount` instead of being repeated across multiple functions. The code is also easier to extend because new rate-based calculations can reuse the same helper.

## Refactoring Code For Simplicity

Refactoring means improving the internal structure of code without changing what the code does from the user's point of view. Common refactoring techniques include extracting functions, inlining functions, renaming variables or functions, extracting variables, consolidating conditionals, replacing nested conditionals with guard clauses, and removing unnecessary abstraction.

The key idea is to make small, safe improvements. Refactoring for simplicity does not mean deleting useful structure. It means removing complexity that no longer earns its place.

### Overly Complicated Code Example

After applying DRY, the cart summary code had a shared helper for rate-based calculations:

```js
function calculateRateAmount(baseAmount, rate) {
  return baseAmount * rate;
}

function calculateDiscountAmount(subtotal, discountRate) {
  return calculateRateAmount(subtotal, discountRate);
}

function calculateTaxAmount(taxableAmount, taxRate) {
  return calculateRateAmount(taxableAmount, taxRate);
}

function calculateActiveCartSummary(cartItems, discountRate, taxRate) {
  const activeCartItems = getActiveCartItems(cartItems);
  const subtotal = calculateCartSubtotal(activeCartItems);
  const discountAmount = calculateDiscountAmount(subtotal, discountRate);
  const taxableAmount = subtotal - discountAmount;
  const taxAmount = calculateTaxAmount(taxableAmount, taxRate);

  return {
    subtotal,
    discountAmount,
    taxAmount,
    total: taxableAmount + taxAmount,
  };
}
```

This code was not broken, but it was more complicated than necessary. The functions `calculateDiscountAmount` and `calculateTaxAmount` did not contain unique discount or tax rules. They only passed arguments to `calculateRateAmount`, so reading the code required extra jumps without adding much meaning.

### Simplified Version

```js
function calculateRateAmount(baseAmount, rate) {
  return baseAmount * rate;
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
```

This refactor used the inline function technique. The shared `calculateRateAmount` helper stayed because it represents the reusable formula, but the thin wrapper functions were removed because they did not add separate behavior.

### What Made The Original Code Complex?

The original code was complex because it had too many layers for a very small calculation. `calculateDiscountAmount` and `calculateTaxAmount` sounded like meaningful domain functions, but they only forwarded work to another helper. That made the reader move through extra function calls to understand a simple multiplication.

The complexity came from over-abstraction. The code had been split into small pieces, but not every small piece carried enough responsibility to justify existing on its own.

### How Did Refactoring Improve It?

Refactoring improved the code by reducing unnecessary indirection. Now the summary function shows the important steps directly: calculate the subtotal, calculate the discount as a rate amount, calculate the taxable amount, calculate the tax as a rate amount, and return the final total.

The code still avoids duplication because the formula remains in `calculateRateAmount`, but it is easier to read because there are fewer pass-through functions. This is a useful reminder that clean code needs balance: small functions are helpful when they clarify responsibility, but too many tiny wrappers can make simple logic harder to follow.

## Commenting And Documentation

Helpful comments and documentation explain context that the code alone cannot express clearly. Good comments usually explain why something exists, why a trade-off was made, or what important constraint future developers should know about. Good documentation helps people use, run, change, or understand a system without needing to reverse-engineer everything from the code.

From researching comment and documentation best practices, the main ideas are:

- Use comments to explain why, not to repeat what the code already says.
- Keep comments short, accurate, and close to the code they describe.
- Update comments and documentation when the related code changes.
- Avoid stale comments because outdated documentation can be worse than no documentation.
- Prefer clearer names and simpler structure before adding explanatory comments.
- Document public behavior, setup steps, important decisions, and unusual constraints.

### Poorly Commented Code Example

This is an example of a comment that does not add useful information:

```js
function calculateRateAmount(baseAmount, rate) {
  // Multiply baseAmount by rate.
  return baseAmount * rate;
}
```

The comment is poor because it only repeats what the code already says. A developer can see from the expression that the function multiplies two values. The comment adds noise without adding context.

### More Useful Comment

```js
function calculateRateAmount(baseAmount, rate) {
  // Keep full precision here so display or payment layers can apply their own rounding rules.
  return baseAmount * rate;
}
```

This comment is more useful because it explains a decision that is not obvious from the code. The multiplication is simple, but the reason for not rounding inside this helper matters. A future developer might otherwise add rounding here and accidentally create inconsistent totals in another part of the system.

### When Should You Add Comments?

You should add comments when the code needs context that cannot be made obvious through naming or structure. Good reasons to add a comment include explaining a business rule, a workaround, a performance trade-off, an external API limitation, a security requirement, or a decision that may look strange later.

Comments are also useful for documenting public functions, setup instructions, project conventions, and important edge cases. The goal is to help future developers understand the intent behind the code, especially when the reason is not visible from the code itself.

### When Should You Avoid Comments And Instead Improve The Code?

You should avoid comments when they only restate the code. Comments like "increment counter" or "filter active items" are usually unnecessary if the code and names are already clear. These comments can become clutter and may fall out of date when the code changes.

Instead of adding a comment to explain confusing code, first try to improve the code itself. Rename unclear variables, extract a function, simplify a conditional, or split a large block into smaller steps. If the code can be made self-explanatory, that is usually better than leaving confusing code behind with a comment attached.

## Handling Errors And Edge Cases

Robust code handles unexpected inputs clearly instead of assuming everything will always be valid. Common strategies include validating inputs early, using guard clauses for invalid cases, throwing useful error types, returning safe defaults only when that behavior is intentional, and testing edge cases such as empty arrays, missing values, invalid types, and boundary values.

Guard clauses are especially useful because they handle special cases at the top of a function. This keeps the normal flow of the function flatter and easier to read. Instead of deeply nesting the main logic inside several `if` statements, the function can reject invalid input early and then continue with the happy path.

### Original Code Without Proper Error Handling

The cart summary code originally assumed all input was valid:

```js
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
```

This version worked for normal input, but it did not handle invalid data. If `cartItems` was not an array, the code would fail later when `.filter()` was called. If a price, quantity, discount rate, or tax rate was invalid, the function could return `NaN` or an incorrect total.

### Refactored With Guard Clauses

```js
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
```

The refactored version checks invalid inputs before doing the main calculation. It uses `TypeError` for the wrong kind of value and `RangeError` for values outside the allowed range.

### What Was The Issue With The Original Code?

The issue with the original code was that it trusted all inputs. It assumed `cartItems` would always be an array, each cart item would always have a valid price and quantity, and the discount and tax rates would always be valid numbers between `0` and `1`.

That made the function fragile. Invalid input could cause a confusing runtime error, such as calling `.filter()` on a non-array, or it could quietly produce an incorrect result like `NaN`. The function did not fail early with a clear explanation.

### How Does Handling Errors Improve Reliability?

Handling errors improves reliability because the code responds predictably when something unexpected happens. Instead of letting invalid data flow through the calculation, guard clauses stop the function early and explain what went wrong.

Clear error handling also makes debugging easier. A specific message like `discountRate must be a number between 0 and 1` is much more helpful than discovering a bad total later. This protects the rest of the application from incorrect values and makes the code safer to reuse.

## Writing Unit Tests For Clean Code

Unit tests check small pieces of code in isolation. They are important because they confirm that individual functions behave correctly for normal inputs, edge cases, and error cases. Unit tests also make refactoring safer because developers can change the internal structure of code and quickly check whether the expected behavior still works.

For this repository, I chose Node.js's built-in `node:test` framework. It fits this project because the code is JavaScript, the project already uses Node, and the built-in test runner does not require adding another testing dependency. I used `node:assert/strict` for assertions.

The test command is:

```bash
npm test
```

### Unit Tests Added

I added unit tests for the cart summary functions:

```js
test('calculateActiveCartTotal totals only active cart items', () => {
  const cartItems = [
    { active: true, price: 10, quantity: 2 },
    { active: false, price: 100, quantity: 1 },
    { active: true, price: 5, quantity: 3 },
  ];

  assert.equal(calculateActiveCartTotal(cartItems), 35);
});
```

The full test file also checks:

- The summary calculation with discount and tax.
- Empty cart behavior.
- Invalid cart item validation.
- Invalid rate validation.

### How Do Unit Tests Help Keep Code Clean?

Unit tests help keep code clean by making expected behavior explicit. When a function has tests, future developers can see what the function is supposed to do without guessing from the implementation alone. Tests also encourage smaller, focused functions because small functions are easier to test.

Unit tests also protect refactoring. Clean code often changes over time as names improve, duplication is removed, or complex logic is simplified. Tests make those changes safer because they quickly show whether the code still behaves the same after the internal structure changes.

### What Issues Did You Find While Testing?

Testing highlighted the important edge cases the cart code needs to support. The happy path was straightforward, but the tests made it clear that empty carts, inactive items, invalid prices, and invalid rates should be checked deliberately instead of left to chance.

The tests did not reveal a failing bug in the current implementation because the guard clauses from the previous refactor already handled invalid inputs. However, writing the tests confirmed that those guard clauses behave as intended and that invalid data fails with clear errors instead of producing incorrect totals like `NaN`.

## References

- National Cyber Security Centre, ["Produce clean & maintainable code"](https://www.ncsc.gov.uk/collection/developers-collection/principles/produce-clean-maintainable-code)
- Google Go Style Guide, ["Style principles"](https://google.github.io/styleguide/go/guide.html)
- SonarSource, ["Clean Code definition"](https://docs.sonarsource.com/sonarqube-server/10.6/user-guide/clean-code/definition)
- Airbnb, ["JavaScript Style Guide"](https://github.com/airbnb/javascript)
- ESLint, ["Find and fix problems in your JavaScript code"](https://eslint.org/)
- Prettier, ["Why Prettier?"](https://prettier.io/docs/why-prettier.html)
- Google JavaScript Style Guide, ["Naming"](https://google.github.io/styleguide/jsguide.html#naming)
- Microsoft Learn, ["Code readability"](https://learn.microsoft.com/en-us/power-apps/guidance/coding-guidelines/code-readability)
- Microsoft Learn, ["General naming conventions"](https://learn.microsoft.com/et-ee/dotnet/standard/design-guidelines/general-naming-conventions)
- Refactoring.Guru, ["Long Method"](https://refactoring.guru/smells/long-method)
- Refactoring.Guru, ["Composing Methods"](https://refactoring.guru/refactoring/techniques/composing-methods)
- Bristol Composites Institute, ["Write small functions that do one thing, and do that one thing well"](https://bristolcompositesinstitute.github.io/RSE-Guide/best-practices/single-responsibility.html)
- Refactoring.Guru, ["Duplicate Code"](https://refactoring.guru/smells/duplicate-code)
- The Pragmatic Bookshelf, ["Pragmatic Programmer Tips"](https://pragprog.com/tips/)
- Microsoft Learn, ["Super-DRY Development for ASP.NET Core"](https://learn.microsoft.com/en-us/archive/msdn-magazine/2019/june/patterns-and-practices-super-dry-development-for-asp-net-core)
- Martin Fowler, ["Refactoring"](https://refactoring.com/)
- Refactoring.Guru, ["Simplifying Conditional Expressions"](https://refactoring.guru/refactoring/techniques/simplifying-conditional-expressions)
- Microsoft Learn, ["Extract and inline refactorings"](https://learn.microsoft.com/en-us/visualstudio/ide/reference/refactoring-extract-inline)
- Google Developer Documentation Style Guide, ["Documentation Best Practices"](https://google.github.io/styleguide/docguide/best_practices.html)
- Google for Developers, ["Highlights"](https://developers.google.com/style/highlights)
- TechTarget, ["Best practices for writing clean code comments"](https://www.techtarget.com/searchsoftwarequality/tip/Code-comment-best-practices-every-developer-should-know)
- Refactoring.Guru, ["Replace Nested Conditional with Guard Clauses"](https://refactoring.guru/replace-nested-conditional-with-guard-clauses)
- MDN Web Docs, ["Error"](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Error)
- MDN Web Docs, ["JavaScript error reference"](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Errors)
- Node.js, ["Test runner"](https://nodejs.org/api/test.html)
- TechTarget, ["Why is unit testing important for developers?"](https://www.techtarget.com/searchsoftwarequality/answer/Is-unit-testing-an-important-aspect-of-software-development)
