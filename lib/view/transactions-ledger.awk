/"folder"/ {
	if (id++) print ""
	description = str("description")
	datetime = str("when_recorded_local")
	date = substr(datetime, 1, index(datetime, " ")-1)
	gsub(/-/, "/", date)
	sign = str("bookkeeping_type") == "debit" ? 1 : -1

	if (match(description, /^Transfer (to|from) /)) {
		name = substr(description, RLENGTH+1)
		account = "Assets:Checking:" name

	} else {
		account1 = str("folder")
		if (account1 == "Income")
			account = account1
		else {
			account = sign < 0 ? "Income" : "Expenses"
			if (account1 && account1 != "Uncategorized")
				account = account ":" account1
		}
		account2 = str("name")
		if (account2 &&\
			account2 != "Other" &&\
			account2 != "Unknown")
			account = account ":" account2
		gsub(/\\u0026/, "\\&", account)
	}

	print date " " description
	printf "    %-38s  %8s\n", account,\
		sprintf("$%.2f", amount("amount") * sign)
	print "    Assets:Checking:Simple"
}
