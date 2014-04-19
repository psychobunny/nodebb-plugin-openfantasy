"use strict";

var async = require('async'),
	app = {};

function buildHeader(req, res, next) {
	async.parallel({
		header: function(next) {
			app.render('rpg/header', {}, next);
		},
		footer: function(next) {
			app.render('rpg/footer', {}, next);
		}
	}, function(err, data) {
		res.locals.postHeader = data.header;
		res.locals.preFooter = data.footer;

		next(err);
	});
}

module.exports = function(expressApp, middleware) {
	app = expressApp;

	middleware.openfantasy = {};
	middleware.openfantasy.buildHeader = buildHeader;

	return middleware;
};