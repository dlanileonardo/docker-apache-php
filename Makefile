# `adocker` is alias to `azk docker`
all:
	# latest
	adocker build -t dlani/apache-php           .

--no-cache:
	# latest
	adocker build --rm --no-cache -t dlani/apache-php           .