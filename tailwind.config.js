const colors = require('tailwindcss/colors')

module.exports = {
  purge: [
    './index.html', 
    './src/**/*.{vue,js,ts,jsx,tsx}'
  ], // Modify to match the framework file structure (ex. nuxt is not the same as vite )
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
      minWidth: {
        '0': '0',
        '1/4': '25%',
        '1/2': '50%',
        '3/4': '75%',
        'full': '100%',
        'xl': '36rem',
        '2xl': '42rem',
        '3xl': '48rem',
        '4xl': '56rem',
        '5xl': '64rem',
        '6xl': '72rem',
        '7xl': '80rem',
        '8xl': '88rem',
        '9xl': '96rem'
      },
      maxWidth: {
        '1/4': '25%',
        '1/2': '50%',
        '3/4': '75%',
        '8xl': '88rem',
        '9xl': '96rem'
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
}
