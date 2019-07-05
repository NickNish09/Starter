const { environment } = require('@rails/webpacker');
const datatables = require('./loaders/datatables');

const webpack = require('webpack');
environment.plugins.append(
    'Provide',
    new webpack.ProvidePlugin({
        $: 'jquery',
        jQuery: 'jquery',
        jquery: 'jquery',
        Popper: ['popper.js', 'default']
    })
);
environment.loaders.append('datatables', datatables);
module.exports = environment;