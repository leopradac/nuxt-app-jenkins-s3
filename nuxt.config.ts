// https://nuxt.com/docs/api/configuration/nuxt-config
export default defineNuxtConfig({
  compatibilityDate: "2024-04-03",
  devtools: { enabled: true },
  ssr: false,
  runtimeConfig: {
    public: {
      TEST_PUBLIC: "safe value",
    },
    app: {
      NR_KEY: process.env.NR_KEY,
      NR_APP_ID: process.env.NR_APP_ID,
    },
  },
});
