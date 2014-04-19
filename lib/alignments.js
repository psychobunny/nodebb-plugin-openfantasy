"use strict";


var alignments = {
	library: {}
};

alignments.init = function(data) {
	for (var a in data) {
		if (data.hasOwnProperty(a)) {
			alignments.library[data[a].alignment_id] = data[a];
		}
	}

	alignments.data = data;
	return alignments;
};

alignments.getAlignmentByID = function(alignment_id) {
	return alignments.data[alignment_id];
};

module.exports = alignments;