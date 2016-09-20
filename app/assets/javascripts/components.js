//= require_tree ./components

// ES6 imports
// const ReactDOMServer = window.ReactDOMServer = global.ReactDOMServer = require('react-dom/server');

// Setup a global app scope
//noinspection JSAnnotator
const app = window.app = global.app = {};

import Commodities from './components/commodities/commodities.es6.jsx';
//
// // Expose components to global scope
app.Commodities = Commodities;