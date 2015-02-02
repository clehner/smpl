END {
	if (str("card_status") == "OPEN")
		print "✓ Activated"
	else
		print "✗ " str("card_status")
	print "**** **** **** " str("indent")
	print str("customer_name")
	print "good thru " str("expiration_date")
}
