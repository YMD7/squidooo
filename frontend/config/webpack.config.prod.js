const path = require('path');
const webpack = require('webpack');
const UglifyJSPlugin = require('uglifyjs-webpack-plugin');
const ManifestPlugin = require('webpack-manifest-plugin');
const ExtractTextPlugin = require('extract-text-webpack-plugin');

module.exports = {
  entry: {
    bundle: './javascripts/app.js',
  },
  output: {
    path: __dirname + './../../public/dist',
    filename: '[name]-[hash].js',
  },
  module: {
    rules: [
      {
        test: /\.js$/,
        use: {
          loader: 'babel-loader',
          options: {
            presets: ['es2015', 'es2016', 'stage-1', 'react'],
          },
        },
      },
    ],
  },
  plugins: [
    new webpack.DefinePlugin({
      'process.env': {
        NODE_ENV: JSON.stringify(process.env.NODE_ENV),
      },
    }),
    new UglifyJSPlugin({
      sourceMap: true,
    }),
    new ManifestPlugin(),
    new ExtractTextPlugin('[name]-[hash].css', { allChunks: true }),
  ],
};
