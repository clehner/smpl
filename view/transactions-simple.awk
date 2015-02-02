/"raw_description"/ {
	if (id++) print ""
	print str("when_recorded_local")
	print str("description")
	sign = str("bookkeeping_type") == "debit" ? -1 : 1
	printf "%8.2f Amount\n", amount("amount") * sign
	printf "%8.2f Balance\n", amount("running_balance")
}
