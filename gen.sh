#! /bin/sh

set -e

makedir(){
  mkdir -p src/assets/css
  mkdir -p src/layouts
  mkdir -p src/middleware
  mkdir -p src/pages
  mkdir -p src/plugins
  mkdir -p public/static
  mkdir -p src/store
  echo 'make nuxt style dir done'
}

writefile() {
  echo > postcss.config.js "module.exports = {
  plugins: {
    tailwindcss: {},
    autoprefixer: {},
  },
}"
  echo 'generate postcss.config.js done'

  echo > tailwind.config.js "const colors = require('tailwindcss/colors')

module.exports = {
    purge: ['./index.html', './src/**/*.{vue,js,ts,jsx,tsx}'],
    darkMode: false, // or 'media' or 'class'
    theme: {
        extend: {
            colors: {
                transparent: 'transparent',
                current: 'currentColor',
                white: colors.white,
                black: colors.black,
                blueGray: colors.blueGray,
                coolGray: colors.coolGray,
                gray: colors.gray,
                trueGray: colors.trueGray,
                warmGray: colors.warmGray,
                red: colors.red,
                orange: colors.orange,
                amber: colors.amber,
                yellow: colors.yellow,
                lime: colors.lime,
                green: colors.green,
                emerald: colors.emerald,
                teal: colors.teal,
                cyan: colors.cyan,
                lightBlue: colors.lightBlue,
                blue: colors.blue,
                indigo: colors.indigo,
                violet: colors.violet,
                purple: colors.purple,
                fuchsia: colors.fuchsia,
                pink: colors.pink,
                rose: colors.rose,
            },
            spacing: {
                '13': '3.25rem',
                '15': '3.75rem',
                '17': '4.25rem',
                '18': '4.5rem',
                '19': '4.75rem',
                '19.5': '4.875rem',
            },
            boxShadow: {
                'inner-sm': 'inset 0 1px 2px 0 rgba(0, 0, 0, 0.05)',
                'inner-md': 'inset 0 4px 6px -1px rgba(0, 0, 0, 0.1), inset 0 2px 4px -1px rgba(0, 0, 0, 0.06)',
                'inner-lg': 'inset 0 10px 15px -3px rgba(0, 0, 0, 0.1), inset 0 4px 6px -2px rgba(0, 0, 0, 0.05)',
                'inner-xl': 'inset 0 20px 25px -5px rgba(0, 0, 0, 0.1), inset 0 10px 10px -5px rgba(0, 0, 0, 0.04)',
                'inner-2xl': 'inset 0 25px 50px -12px rgba(0, 0, 0, 0.25)',
                'inner-3xl': 'inset 0 35px 60px -15px rgba(0, 0, 0, 0.3)',
            },
        },
    },
    variants: {
        extend: {
            backgroundColor: ['odd', 'even', 'active','group-focus','group-hover'],
            borderWidth: ['first', 'last', 'hover', 'focus'],
            cursor: ['active'],
            opacity: ['disabled'],
            textColor: ['group-focus', 'active','group-hover'],
            ringWidth: ['focus-visible'],
            ringOffsetWidth: ['focus-visible'],
            ringOffsetColor: ['focus-visible'],
            ringColor: ['focus-visible'],
            ringOpacity: ['focus-visible'],
            rotate: ['first', 'last', 'odd', 'even'],
        },
    },
    plugins: [],
}"
  echo 'generate tailwind.config.js done'

  echo > src/assets/css/tailwind.css "@tailwind base;
@tailwind components;
@tailwind utilities;"
  echo 'generate tailwind.css done'

  if [ -f "src/main.ts" ]; then
    echo >> src/main.ts "import './assets/css/tailwind.css'"
    echo 'import tailwind.css to main.ts done, change order in IDE by yourself'
  fi


  if [ -f "src/main.js" ]; then
    echo >> src/main.js "import './assets/css/tailwind.css'"
    echo 'import tailwind.css to main.js done, change order in IDE by yourself'
  fi
}

adddep(){
  yarn add tailwindcss@latest postcss@latest autoprefixer@latest
}

newvite(){
  yarn create @vitejs/app $@
}

command_exists() {
  command -v "$@" > /dev/null
}

main(){

  if !(command_exists yarn); then
    echo "This script needs yarn installed to run."
    exit 1
  fi

  echo 'vite + vue + ts + tailwindcss generate tool (nuxt style)'

  if !(command_exists vite); then
    read -p 'no vite installed, will install vite' a
    yarn global add vite
  fi

  if [ $# -eq 0 ] ; then
    read -p '? Project name: › ' proj
  else
    proj=$@
  fi

  newvite $proj
  cd ${PWD}/$proj
  adddep
  makedir
  writefile
}

main $@