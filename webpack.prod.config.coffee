webpack = require('webpack')
HtmlWebpackPlugin = require('html-webpack-plugin')
ExtractTextPlugin = require('extract-text-webpack-plugin')

module.exports =
    entry: __dirname + "/app/app.js"
    output:
        path: __dirname + "/build"
        filename: "[name]-[hash].js"
    module:
        loaders: [
            test: /\.json$/, loader: 'json'
        ,
            test: /(\.coffee|\.cson)$/, loader: 'coffee-loader'
        ,
            test: /\.jsx?$/, loader: 'babel', exclude: /node_modules/
        ,
        # test: /\.css$/, loader: 'style!css?modules!postcss'
            test: /\.css$/, loader: ExtractTextPlugin.extract('style','css?modules!postcss')
        ]
    postcss: [
        require('autoprefixer')
    ]
    plugins: [
        new HtmlWebpackPlugin({
            template: __dirname + "/app/index.tmpl.html"
        })
        new webpack.optimize.OccurenceOrderPlugin()
        new webpack.optimize.UglifyJsPlugin()
        new ExtractTextPlugin("[name]-[hash].css")
    ]
