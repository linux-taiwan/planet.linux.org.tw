#!/bin/sh

UpdatePlanetAll()
{
	./script/planet.py ./script/examples/fancy/config-all.ini
}

UpdatePlanet()
{
	if [ -f "./script/examples/fancy/config-${1}.ini" ]; then
		./script/planet.py -o ./script/examples/fancy/config-${1}.ini
	fi
}

if [ -z "$*" ]; then
	UpdatePlanetAll
else
	for category in $@; do
		if [ "$category" = "all" ]; then
			UpdatePlanetAll
		else
			UpdatePlanet $category
		fi
	done
fi

rm -fr examples

exit 0
