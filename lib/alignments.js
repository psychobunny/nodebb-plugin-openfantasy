"use strict";


var alignments = {
	data: {}
};

alignments.getAlignmentByID = function(alignment_id) {
	return alignments.data[alignment_id];
};

module.exports = function(data) {
	for (var a in data) {
		if (data.hasOwnProperty(a)) {
			alignments.data[data[a].alignment_id] = data[a];
		}
	}

	return alignments;
};