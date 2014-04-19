"use strict";

var shops = {};

shops.render = function(req, res, callback) {
	var content = templates.prepare(OF.templates['shops.tpl']),
		mode = req.params.mode,
		mid = req.params.mid;
	
	if (req.user && req.user.uid) {
		Character.getCharacterField(req.user.uid, 'character_id', function(err, data) {
			if (data) {
				if (!mode) {
					var store_data = OF.data.stores;

					for (var s in store_data) {
						if (store_data.hasOwnProperty(s)) {
							var store = store_data[s];

							if (store.sale && store.store_status) {
								store.store_status = "[[of:store_sale]]";
							} else {
								store.store_status = store.store_status ? "[[of:store_open]]" : "[[of:store_closed]]";
							}
						}
					}

					content = content.parse({
						view_store_list: true,
						store: store_data
					});

					translator.translate(content, function(content) {
						callback({content: content});
					});
				} else if (mode === 'store') {
					var shops_items = OF.data.shops_items, items = [];

					for (var i in shops_items) {
						if (shops_items.hasOwnProperty(i)) {
							var item = shops_items[i];
							if (item.item_store_id === mid) {
								items.push(item);
							}
						}
					}
					content = content.parse({
						view_store: true,
						items: items
					});

					translator.translate(content, function(content) {
						callback({content: content});
					});
				}
				
			} else {
				return res.redirect('/rpg/character');
			}
		});
	}
	else
	{
		return res.redirect('/login');
	}
};

module.exports = shops;