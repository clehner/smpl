END {
	printf "%8.2f Total\n", amount("total")
	printf "%8.2f Pending\n", -amount("pending")
	printf "%8.2f Available balance\n", amount("safe_to_spend")
}
