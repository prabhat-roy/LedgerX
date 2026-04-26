// Module Federation across LedgerX frontends (storefront / admin / partner / mobile-web)
const { ModuleFederationPlugin } = require("@module-federation/enhanced/webpack");
module.exports = {
  plugins: [
    new ModuleFederationPlugin({
      name: "ledgerx_shell",
      remotes: {
        admin: "admin@https://admin.ledgerx.internal/remoteEntry.js",
        partner: "partner@https://partner.ledgerx.internal/remoteEntry.js",
      },
      shared: { react: { singleton: true }, "react-dom": { singleton: true } },
    }),
  ],
};
