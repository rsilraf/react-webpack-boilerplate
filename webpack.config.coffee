webpack = require('webpack')
HtmlWebpackPlugin = require('html-webpack-plugin')

module.exports =
    entry: __dirname + '/app/app.js'
    output:
        path: __dirname + '/build'
        filename: 'bundle.js'
    module:
        loaders: [
            test: /\.json$/, loader: 'json'
        ,
            test: /(\.coffee|\.cson)$/, loader: 'coffee-loader'
        ,
            test: /\.jsx?$/, loader: 'babel', exclude: /node_modules/
        ,
            test: /\.css$/ , loader: 'style!css?modules!postcss'
        ]
    postcss: [
        require('autoprefixer')
    ]

    plugins: [
        new webpack.BannerPlugin("Copyright Optimus Prime Inc.")
        new HtmlWebpackPlugin({
            template: __dirname + "/app/index.tmpl.html"
        })
        new webpack.HotModuleReplacementPlugin()
    ]

    devtool: 'eval-source-map'
    devServer:
        #contentBase: './public'
        colors: true
        historyApiFallback: true
        inline: true
        hot: true
