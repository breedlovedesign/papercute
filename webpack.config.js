const path = require('path');
const webpack = require('webpack');

module.exports = {
  devtool: 'eval-source-map',
  entry: './src/papercute/js/main_dialog.js',
  output: {
    path: path.resolve(__dirname, 'dist/papercute/js'),
    filename: 'main_dialog.bundle.js',
    clean: true,
  },
};
