"use strict";

var calculations = {};

calculations.calculateModifier = function(skill_level) {
	var modifier;

	skill_level = parseInt(skill_level, 10);

	if(skill_level > 11) {
		// Must have at least 12 points in the skill/characteristic before positive modifier is applied
		// Gains +1 modifier for every 2 levels, ie. 12-13 (+1), 14-15 (+2), 16-17 (+3), etc, etc
		for(var p = 12; p < skill_level; p++)
		{
			modifier = Math.floor(((skill_level - 12) /2) + 1);
		}
	}
	else
	{
		// Less than 12 skill/characteristic points means no modifier to user
		modifier = 0;
	}

	return modifier;
};

calculations.calculateBaseAttack = function(str, con) {
	str = parseInt(str, 10);
	con = parseInt(con, 10);
	
	return Math.ceil((str + (str * 0.5)) + calculations.calculateModifier(con));
};

calculations.calculateBaseMagicAttack = function(ma) {
	ma = parseInt(ma, 10);

	return Math.ceil(ma + (ma * 0.75));
};

calculations.calculateBaseDefense = function(ac, dex) {
	ac = parseInt(ac, 10);
	dex = parseInt(dex, 10);

	return Math.ceil((ac + (ac * 0.5)) + calculations.calculateModifier(dex));
};

calculations.calculateBaseMagicResistance = function(wis) {
	wis = parseInt(wis, 10);

	return Math.ceil(wis + (wis * 0.75));
};

module.exports = calculations;