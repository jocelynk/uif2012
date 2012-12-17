// Use jQuery to hide items in the various index lists
$(function() {
	$('#query').focus().keyup(function() {

		// get rid of backspaces
		var txt = $(this).val().replace(/\\b/,"");

		if (txt.length == 0) {
			// if the txt sent is empty, show all
			$('#list tr').show();
		}
		else{
			// else show only what we want and hide the rest...
			$('#list tr:not(:contains("' + txt + '"))').hide();
			$('#list tr:contains("' + txt + '")').show();
		};
	});
});

