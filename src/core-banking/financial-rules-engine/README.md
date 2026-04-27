# financial-rules-engine

Haskell â€” pure functional core for financial calculation:
interest accrual, IFRS 17 cashflow projection, day-count conventions
(ACT/360, ACT/365, 30/360), holiday calendars.

Pure functions: same input â†’ same output. No side effects. Used by `interest-service`,
`amortisation-engine`, `ifrs17-engine`, `valuation-engine`.

Money: `Data.Decimal.Decimal` â€” never `Float`/`Double`.

Domain: `core-banking` Â· Language: haskell Â· Port: 60026
