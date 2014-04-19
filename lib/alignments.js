"use strict";


var alignments = {
	data: {}
};

alignments.init = function(alignments) {
	for (var a in alignments) {
		if (alignments.hasOwnProperty(a)) {
			alignments.data[alignments[a].alignment_id] = alignments[a];
		}
	}
};

alignments.getAlignmentByID = function(alignment_id) {
	return alignments.data[alignment_id];
};

module.exports = function(data) {
	alignments.init(data);
	return alignments;
};