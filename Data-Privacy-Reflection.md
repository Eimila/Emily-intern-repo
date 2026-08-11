# Data Privacy & Confidentiality — Reflection

## Key Takeaways from Focus Bear's Privacy Policy

- Focus Bear is the **data Controller** and follows the EU GDPR, even though the company is based in Australia. 'by Data' acts as its EU representative and Data Protection Officer.
- Focus Bear only collects data that is necessary for a clear purpose, and handles it fairly and transparently.
- **Sensitive data gets extra protection**: habit data is double-encrypted and only viewed if a user reports a problem and asks the team to look; survey data (e.g. whether a user has ADHD or autism) is anonymised and only analysed in aggregate.
- **Payment data is never stored by Focus Bear directly** — card details are handled by Stripe.
- Crash and error logs are captured **without personal information**.
- Users have strong rights under GDPR (access, rectification, erasure, objection, portability, etc.), and the service is only for users aged 16 and over.

## What types of data are considered confidential at Focus Bear?

Confidential data includes anything that can identify or reveal something private about a user, for example:

- Identification data (email, phone number, login credentials)
- Health-related and special-category data (e.g. ADHD/autism survey responses, habits that imply a health condition or religion)
- Lifestyle and habit data
- Financial data (card/payment details)
- Technical data tied to a user (device, logs that could contain personal info)
- Internal company information that isn't public

The most sensitive of these — health, religious hints, and financial data — require the greatest care.

## Best practices for handling confidential data

- Only access the data I actually need for a task, and nothing more (data minimisation).
- Never expose personal or sensitive data in logs, error reports, analytics, or test output.
- Keep payment data out of my hands entirely — rely on trusted processors like Stripe.
- Respect the encryption and anonymisation the app already applies; don't build features that quietly bypass them.
- Use secure, approved tools and channels for anything involving user data, rather than copying it somewhere convenient but unsafe.

## How should you respond to a suspected data breach or accidental disclosure?

- Don't try to hide it or fix it silently. Report it promptly to my supervisor and the appropriate contact (Focus Bear has a breach-management process and a DPO / privacy contact at privacy@focusbear.io).
- Act quickly, since GDPR requires breaches to be assessed and, where necessary, reported to the Supervisory Authority within tight timeframes.
- Document what happened, what data was involved, and what I did, so the team can respond properly.

## Reflection

### What steps can you take to ensure you handle data securely in your daily tasks?

- Follow the principle of least privilege — only touch the data a task genuinely requires.
- Never paste real user data into logs, commits, screenshots, or third-party tools (including AI tools) when I don't need to.
- Use test/dummy data instead of real user data when developing and debugging.
- Keep my accounts and devices secure with strong authentication.
- Ask before doing anything I'm unsure about with sensitive data, rather than guessing.

### How should you store, share, and dispose of sensitive information safely?

- **Store**: keep sensitive data only in approved, secure systems, and rely on the encryption the app already uses rather than making local copies.
- **Share**: only share on a need-to-know basis, through secure channels, and only with people who are supposed to have access.
- **Dispose**: delete data I no longer need (including temporary files, exports, and debug logs) so it doesn't linger somewhere unprotected.

### What are some common mistakes that lead to data privacy issues, and how can they be avoided?

- Logging or printing personal data during debugging → strip personal info from logs and use anonymised or dummy data.
- Committing secrets, credentials, or real user data into a repository → use environment variables and check diffs before committing.
- Sharing data through insecure or convenient-but-wrong channels → always use approved, secure tools.
- Keeping unnecessary copies of data lying around → clean up after myself and minimise what I retain.
- Pasting sensitive user data into external services (including AI assistants) without thinking → never put real user data where it doesn't belong.

## Task

### One habit I will adopt to improve data security in my role

**I will always use dummy/test data instead of real user data when developing and debugging, and I will make a habit of checking that no personal information ends up in logs, error reports, or commits before I push anything.**

### One key learning / security measure I will implement

My key takeaway is that at Focus Bear, sensitive data (like health-related habit data) is deliberately double-encrypted and only ever viewed with the user's consent. As a developer, my responsibility is to respect and preserve that protection — so a concrete measure I'll implement is to keep personal and sensitive data out of logs and analytics entirely, and to raise any suspected breach immediately rather than trying to quietly fix it.
