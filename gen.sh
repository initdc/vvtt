#! /bin/sh

set -e

makedir() {
  mkdir -p src/assets/css
  mkdir -p src/layouts
  mkdir -p src/middleware
  mkdir -p src/pages
  mkdir -p src/plugins
  mkdir -p public/static
  mkdir -p src/store
  echo 'make nuxt style dir(s) done'
}

writefile() {
  echo >postcss.config.js 'module.exports = {
  plugins: [
    // require("postcss-import"),
    require("tailwindcss"),
    // require("postcss-nested"),
    // require("postcss-nesting"),
    require("autoprefixer"),
  ],
};'
  echo 'generate postcss.config.js done'

  yarn run tailwind init tailwind.base.js --full
  echo 'init postcss.base.js done, use offical templete to extand propety'

  echo >tailwind.config.js 'const colors = require("tailwindcss/colors")

module.exports = {
  // mode: "jit",
  content: [
    "./index.html",
    "./src/**/*.{vue,js,ts,jsx,tsx}"
  ], // Modify to match the framework file structure (eg. nuxt is not the same as vite )
  darkMode: "class", // or "media" or "class"
  theme: {
    extend: {
      colors: {
        transparent: "transparent",
        current: "currentColor",
        black: colors.black,
        white: colors.white,
        slate: colors.slate,
        gray: colors.gray,
        zinc: colors.zinc,
        neutral: colors.neutral,
        stone: colors.stone,
        red: colors.red,
        orange: colors.orange,
        amber: colors.amber,
        yellow: colors.yellow,
        lime: colors.lime,
        green: colors.green,
        emerald: colors.emerald,
        teal: colors.teal,
        cyan: colors.cyan,
        sky: colors.sky,
        blue: colors.blue,
        indigo: colors.indigo,
        violet: colors.violet,
        purple: colors.purple,
        fuchsia: colors.fuchsia,
        pink: colors.pink,
        rose: colors.rose,
      },
      screens: {
        "720p": "720px",
        "980p": "980px",
        "1080p": "1080px",
        "1440p": "1440px",
      },
      maxWidth: {
        "1/4": "25%",
        "1/2": "50%",
        "3/4": "75%",
      },
      minWidth: (theme, { breakpoints }) => ({
        "1/4": "25%",
        "1/2": "50%",
        "3/4": "75%",
        ...breakpoints(theme("screens")),
      }),
      // fontSize: {
      //   "px-0": "0rem",
      //   "px-1": "0.125rem",
      //   "px-2": "0.313rem",
      //   "px-3": "0.188rem",
      //   "px-4": "0.25rem",
      //   "px-5": "0.313rem",
      //   "px-6": "0.375rem",
      //   "px-7": "0.438rem",
      //   "px-8": "0.5rem",
      //   "px-9": "0.563rem",
      //   "px-10": "0.625rem",
      //   "px-11": "0.6875rem",
      //   "px-12": "0.75rem",
      //   "px-13": "0.8125rem",
      //   "px-14": "0.875rem",
      //   "px-15": "0.9375rem",
      //   "px-16": "1rem",
      //   "px-17": "1.0625rem",
      //   "px-18": "1.125rem",
      //   "px-19": "1.1875rem",
      //   "px-20": "1.25rem",
      //   "px-21": "1.3125rem",
      //   "px-22": "1.375rem",
      //   "px-23": "1.4375rem",
      //   "px-24": "1.5rem",
      //   "px-25": "1.5625rem",
      //   "px-26": "1.625rem",
      //   "px-27": "1.6875rem",
      //   "px-28": "1.75rem",
      //   "px-29": "1.8125rem",
      //   "px-30": "1.875rem",
      //   "px-31": "1.9375rem",
      //   "px-32": "2rem",
      //   "px-33": "2.0625rem",
      //   "px-34": "2.125rem",
      //   "px-35": "2.1875rem",
      //   "px-36": "2.25rem",
      //   "px-37": "2.3125rem",
      //   "px-38": "2.375rem",
      //   "px-39": "2.4375rem",
      //   "px-40": "2.5rem",
      //   "px-41": "2.5625rem",
      //   "px-42": "2.625rem",
      //   "px-43": "2.6875rem",
      //   "px-44": "2.75rem",
      //   "px-45": "2.8125rem",
      //   "px-46": "2.875rem",
      //   "px-47": "2.9375rem",
      //   "px-48": "3rem",
      //   "px-49": "3.0625rem",
      //   "px-50": "3.125rem",
      //   "px-51": "3.1875rem",
      //   "px-52": "3.25rem",
      //   "px-53": "3.3125rem",
      //   "px-54": "3.375rem",
      //   "px-55": "3.4375rem",
      //   "px-56": "3.5rem",
      //   "px-57": "3.5625rem",
      //   "px-58": "3.625rem",
      //   "px-59": "3.6875rem",
      //   "px-60": "3.75rem",
      //   "px-61": "3.8125rem",
      //   "px-62": "3.875rem",
      //   "px-63": "3.9375rem",
      //   "px-64": "4rem",
      // },
      // fontWeight: {
      //   "weight-100": 100,
      //   "weight-200": 200,
      //   "weight-300": 300,
      //   "weight-400": 400,
      //   "weight-500": 500,
      //   "weight-600": 600,
      //   "weight-700": 700,
      //   "weight-800": 800,
      //   "weight-900": 900,
      // },
      boxShadow: {
        "inner-sm": "inset 0 1px 2px 0 rgba(0, 0, 0, 0.05)",
        "inner-md": "inset 0 4px 6px -1px rgba(0, 0, 0, 0.1), inset 0 2px 4px -1px rgba(0, 0, 0, 0.06)",
        "inner-lg": "inset 0 10px 15px -3px rgba(0, 0, 0, 0.1), inset 0 4px 6px -2px rgba(0, 0, 0, 0.05)",
        "inner-xl": "inset 0 20px 25px -5px rgba(0, 0, 0, 0.1), inset 0 10px 10px -5px rgba(0, 0, 0, 0.04)",
        "inner-2xl": "inset 0 25px 50px -12px rgba(0, 0, 0, 0.25)",
        "inner-3xl": "inset 0 35px 60px -15px rgba(0, 0, 0, 0.3)",
      },
    },
  },
  variants: {
    extend: {
      backgroundColor: ["odd", "even", "active","group-focus","group-hover"],
      borderWidth: ["first", "last", "hover", "focus"],
      cursor: ["active"],
      opacity: ["disabled"],
      textColor: ["group-focus", "active","group-hover"],
      ringWidth: ["focus-visible"],
      ringOffsetWidth: ["focus-visible"],
      ringOffsetColor: ["focus-visible"],
      ringColor: ["focus-visible"],
      ringOpacity: ["focus-visible"],
      rotate: ["first", "last", "odd", "even"],
  },
  },
  plugins: [],
}
'

  echo 'generate tailwind.config.js done'

  echo >src/assets/css/tailwind.css "@tailwind base;
@tailwind components;
@tailwind utilities;"
  echo 'generate tailwind.css done'

  if [ -f "src/main.ts" ]; then
    echo >>src/main.ts "import './assets/css/tailwind.css'"
    echo 'import tailwind.css to main.ts done, change order in IDE by yourself'
  fi

  if [ -f "src/main.js" ]; then
    echo >>src/main.js "import './assets/css/tailwind.css'"
    echo 'import tailwind.css to main.js done, change order in IDE by yourself'
  fi
}

adddep() {
  yarn add -D tailwindcss@latest postcss@latest autoprefixer@latest
}

newvite() {
  yarn create vite $@
}

command_exists() {
  command -v "$@" >/dev/null
}

main() {

  if !(command_exists yarn); then
    echo "This script needs yarn installed to run."
    exit 1
  fi

  echo 'vite + vue3 + ts + tailwindcss generator (nuxt style)'

  if !(command_exists vite); then
    read -p 'no vite installed, any key to installing vite' a
    yarn global add vite
  fi

  if [ $# -eq 0 ]; then
    read -p '? Project name: › ' proj
  else
    proj=$@
  fi

  newvite $proj
  cd ${PWD}/$proj
  makedir
  adddep
  writefile
}

main $@
