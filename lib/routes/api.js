"use strict";

module.exports = function(app, middleware, controllers) {
	app.post('/api/openfantasy/character/create', middleware.authenticate, controllers.character.create);
	app.post('/api/openfantasy/character/delete', middleware.authenticate, controllers.character.delete);
	app.post('/api/openfantasy/shops/buy', middleware.authenticate, controllers.shops.buy);




	// temp debug routes
	app.get('/api/openfantasy/debug/cash/add', middleware.authenticate, function(req, res, next) {
		require('../nodebb').user.incrementUserFieldBy(req.user.uid, 'currency', '1000', function(err) {
			res.json(err || {});
		});
	});
};