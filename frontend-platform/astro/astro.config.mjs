// Astro config for LedgerX content-heavy public pages (marketing, docs, search)
import { defineConfig } from "astro/config";
import react from "@astrojs/react";
import sitemap from "@astrojs/sitemap";
export default defineConfig({
  site: "https://www.ledgerx.internal",
  integrations: [react(), sitemap()],
  output: "hybrid",
  prefetch: { defaultStrategy: "viewport" },
});
