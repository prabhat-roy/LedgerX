# wealth — LedgerX

Wealth management — portfolios, robo-advisor, market data, OMS, custody.

| Service | Language | gRPC port | Description |
|---|---|---|---|
| portfolio-service | kotlin | 60140 | Customer portfolio service |
| investment-service | kotlin | 60141 | Investment account + holdings |
| robo-advisor | python | 60142 | Robo-advisor (PyPortfolioOpt + MPT) |
| market-data-service | go | 60143 | Market-data fan-out (FIX) |
| order-management-service | kotlin | 60144 | Order management (FIX) |
| execution-service | kotlin | 60145 | Trade execution and routing |
| fund-service | kotlin | 60146 | Mutual fund / ETF service |
| portfolio-risk-service | python | 60147 | Portfolio risk + VaR analytics |
| custody-service | kotlin | 60148 | Custody and corporate actions |
| tax-lot-service | kotlin | 60149 | Tax-lot accounting (FIFO/LIFO/Avg) |
| advisor-service | kotlin | 60150 | Advisor recommendations + suitability |
| pricing-engine | haskell | 60151 | Pure pricing/yield engine (bond/option math) |
