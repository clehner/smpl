BEGIN {
	RS = "{\""
}

{
	len = split($0, items, /,"/)
	if (len > 1) {
		sub(/^{"/, "", items[1])
		sub(/}\s*$/, "", items[len])
	}
	for (i = 1; i <= len; i++) {
		item = items[i]
		j = index(item, "\":")
		key = substr(item, 1, j-1)
		value = substr(item, j+2)
		object[key] = value
	}
}

function amount(key) {
	return object[key]/10000
}

function str(key) {
	value = object[key]
	sub(/^"/, "", value)
	sub(/"[}\]]*$/, "", value)
	return value
}
