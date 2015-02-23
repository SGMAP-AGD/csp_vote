#!/bin/sh

grep -v NA ../data/rp_secteur5.csv > ../data/rp_secteur6.csv
perl -pe 's/2A/20/' ../data/rp_secteur6.csv 
perl -pe 's/2B/20/' ../data/rp_secteur6.csv
