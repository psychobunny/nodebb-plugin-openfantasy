"use strict";


var alignments = {};

alignments.init = function() {
	var alignments = OF.data.alignments,
		dictionary = {};

	for (var a in alignments) {
		if (alignments.hasOwnProperty(a)) {
			dictionary[alignments[a].alignment_id] = alignments[a];
		}
	}

	OF.data.alignments = dictionary;
};

alignments.getAlignmentByID = function(alignment_id) {
	return OF.data.alignments[alignment_id];
};

module.exports = alignments;