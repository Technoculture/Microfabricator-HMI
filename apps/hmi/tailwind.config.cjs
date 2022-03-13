const config = {
  content: ["./src/**/*.{html,js,svelte,ts}"],

  theme: {
    extend: {},
  },

  plugins: [
    require('tailwind-scrollbar-hide')
  ],
};

module.exports = config;
