## San Juan County WA Auxilliary Communications Frequency List

### Purpose
San Juan County WA is a group of islands that operate multuple EMCOMM Stations as well as individual stations, fixed mobile and portable. It is important that the stations have a common list of frequencies on all bands that are consistent in naming convention thus we use a master list that contains that information. Further we support a variety of different radios and need a way to generate programming files for each supported radio make/model.

### Formats Used
* All files associated with the project shall be in plain text
* Documentation shall be in Mark Down
* Data files shall be in csv format
* Scripts shall be in python
* Chirp, available from http://chirp.danplanet.com/projects/chirp/wiki/Home will be used for test and verification
  * Chirp is written in python and uses csv files
* Manufacturer specific formats will be on an as needed basis and archived

### Radio Support
The "Master to Radio" m2r.py script will read the master.csv file and generate radio.csv files for all supported radios. It is understood that radios may need manufacturer supported programming for initial configuration and changes not supported by Chirp.
#### White Box Radios
* Kenwood TMV71 Dual Band Mobile
* Alinco DR-135T,235T,435T Monoband Mobile
#### MERT Radios
* Kenwood TM281 2m Mobile
#### User Radios
* Kenwood THF6 Tri Band HT
* Icom IC-92AD Dual Band HT w/D-STAR
* Yaesu 8800 Dual Band Mobile



