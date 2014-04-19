"use strict";

/*
* There really isn't any standard with regards to how best to interact with NodeBB modules.
* I'm going to try storing references here - hopefully it's clean and practical.
*/

var NodeBB = {};

(function(parent) {
	NodeBB = {
		db: parent.require('../src/database'),
		user: parent.require('../src/user')
	};
}(module.parent.parent));

module.exports = NodeBB;