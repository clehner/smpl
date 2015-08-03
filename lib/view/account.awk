END {
	print str("isActive") == "true" ? "✓ Active account" : "✗ Inactive account"
	if (str("locked") == "true")
		print "✗ Account is locked"
	print "Name:",
		  str("given_name"),
		  str("additional_name"),
		  str("family_name")
	print "Username: " str("username")
	print "Email: " str("email")
	print "Birthdate: " str("date_of_birth")

	ext_addr = str("extended_address")
	print "Address: " str("street_address") \
		  (ext_addr ? "; " + ext_addr : "") "; " \
		  str("locality") ", " str("region"), str("postal_code") \
		  ", " str("country_code")
}
