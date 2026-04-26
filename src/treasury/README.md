# treasury — LedgerX

FX, liquidity management, cash pooling, hedging, ALM.

| Service | Language | gRPC port | Description |
|---|---|---|---|
| fx-service | kotlin | 60180 | FX rate book + spot/forward dealing |
| liquidity-service | kotlin | 60181 | Liquidity management + LCR/NSFR |
| cash-pooling-service | kotlin | 60182 | Cash pooling for corporates |
| hedging-service | kotlin | 60183 | Hedging (IRS, FX forward) |
| money-market-service | kotlin | 60184 | Money-market book |
| nostro-service | kotlin | 60185 | Nostro/Vostro account manager |
| alm-service | kotlin | 60186 | ALM (asset-liability management) |
| valuation-engine | haskell | 60187 | Pure swap/forward valuation engine |
| cash-forecast-service | kotlin | 60188 | Cash forecast service |
| repo-service | kotlin | 60189 | Repo / securities lending |
| intraday-liquidity-service | kotlin | 60190 | Intraday liquidity monitoring |
| ftp-service | kotlin | 60191 | Funds-transfer pricing (FTP) |
