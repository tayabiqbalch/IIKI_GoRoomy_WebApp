(function () {
	jQuery.validator.addMethod("email", function (value, element) {
		var pattern = /^([a-z\d\-\/=?^_`{|}~\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF]+(\.[a-z\d\-\/=?^_`{|}~\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF]+)*|"((([ \t]*\r\n)?[ \t]+)?([\x01-\x08\x0b\x0c\x0e-\x1f\x7f\x21\x23-\x5b\x5d-\x7e\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF]|\\[\x01-\x09\x0b\x0c\x0d-\x7f\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF]))*(([ \t]*\r\n)?[ \t]+)?")@(([a-z\d\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF]|[a-z\d\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF][a-z\d\-._~\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF]*[a-z\d\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])\.)+([a-z\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF]|[a-z\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF][a-z\d\-._~\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF]*[a-z\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])\.?$/i;
		return pattern.test(value);
	}, "(Please enter a valid Email)");

	jQuery.validator.addMethod("emailallowplus", function (value, element) {
		var pattern = /^[a-zA-Z0-9_\-\.]+(\.[a-zA-Z0-9_\-\.]+)*(\+[a-zA-Z0-9_\-\.]+)?@([a-zA-Z0-9_\-\.]+)\.([a-zA-Z0-9]{1,15})$/i;
		return pattern.test(value);
	}, "(Please enter a valid Email)");

	jQuery.validator.addMethod("emailvalid", function (value, element) {
		var pattern = /^[a-zA-Z0-9_\-\.]+(\.[a-zA-Z0-9_\-\.]+)?@([a-zA-Z0-9_\-\.]+)\.([a-zA-Z0-9]{1,15})$/i;
		return pattern.test(value);
	}, "(Please enter a valid Email)");

	jQuery.validator.addMethod("UploadProfileImage", function (value, element) {
	    var size = element.files[0].size;
	    console.log(size);

	    if (size > 1048576)// checks the file more than 1 MB
	    {
	        //console.log("returning false");
	        return false;
	    } else {
	        //console.log("returning true");
	        return true;
	    }
	}, "(Please image upto 1 MB)");

	jQuery.validator.addMethod("requiredif", function (value, element) {
		if (value != null)
			return true;
	}, "(Please enter a valid Email)");
});