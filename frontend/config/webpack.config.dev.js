const path = require('path');
const webpack = require('webpack');

module.exports = {
  entry: {
    bundle: './javascripts/app.js',
  },
  output: {
    path: __dirname + '../public/dist',
    filename: '[name].js',
    publicPath: 'http://localhost:8080/',
  },
  module: {
    rules: [
      {
        test: /\.js$/,
        use: {
          loader: 'babel-loader',
          options: {
            presets: ['es2015', 'es2016', 'stage-1', 'react'],
            env: {
              development: {
                presets: ['react-hmre'],
              },
            },
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
  ],
  devServer: {
    contentBase: 'public/dist',
  },
};
