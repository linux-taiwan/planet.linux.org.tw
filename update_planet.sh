#!/bin/sh

BASE=$PWD

UpdatePlanetAll()
{
	$BASE/planet.py $BASE/examples/fancy/config-all.ini
}

UpdatePlanet()
{
	if [ -f "$BASE/examples/fancy/config-${1}.ini" ]; then
		$BASE/planet.py -o $BASE/examples/fancy/config-${1}.ini
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

exit 0
