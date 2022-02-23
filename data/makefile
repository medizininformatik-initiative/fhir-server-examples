.PHONY: all clean

all: polar vhf

polar: POLAR_Testdaten_Original_UKB-UKB-0001-UKB-0015.json.zip POLAR_Testdaten_Original_UKE-UKE-0001-UKE-0020.json.zip POLAR_Testdaten_Original_UKFAU-UKFAU-0001-UKFAU-0011.json.zip POLAR_Testdaten_Original_UKFR-UKFR-0001-UKFR-0010.json.zip POLAR_Testdaten_Original_UKSH-UKSH-0001-UKSH-0005.json.zip
polar-url=https://github.com/medizininformatik-initiative/kerndatensatz-testdaten/raw/master/Test_Data/Polar

vhf: VHF-Testdaten_01-VHF00001-VHF01000.json.zip VHF-Testdaten_01-VHF01001-VHF02000.json.zip VHF-Testdaten_01-VHF02001-VHF03000.json.zip VHF-Testdaten_01-VHF03001-VHF04000.json.zip VHF-Testdaten_01-VHF04001-VHF05000.json.zip VHF-Testdaten_01-VHF05001-VHF06000.json.zip VHF-Testdaten_01-VHF06001-VHF07000.json.zip VHF-Testdaten_01-VHF07001-VHF08000.json.zip VHF-Testdaten_01-VHF08001-VHF09000.json.zip VHF-Testdaten_01-VHF09001-VHF10000.json.zip
vhf-url=https://github.com/medizininformatik-initiative/kerndatensatz-testdaten/raw/master/Test_Data/Vorhofflimmern

clean: 
	rm -f *.zip  *.json

POLAR_Testdaten_Original_UKSH-UKSH-0001-UKSH-0005.json.zip:
	wget $(polar-url)/$@
	unzip $@
POLAR_Testdaten_Original_UKB-UKB-0001-UKB-0015.json.zip: 
	wget $(polar-url)/$@
	unzip $@
POLAR_Testdaten_Original_UKE-UKE-0001-UKE-0020.json.zip: 
	wget $(polar-url)/$@
	unzip $@
POLAR_Testdaten_Original_UKFAU-UKFAU-0001-UKFAU-0011.json.zip:
	wget $(polar-url)/$@
	unzip $@
POLAR_Testdaten_Original_UKFR-UKFR-0001-UKFR-0010.json.zip:
	wget $(polar-url)/$@
	unzip $@
VHF-Testdaten_01-VHF00001-VHF01000.json.zip:
	wget $(vhf-url)/$@
	unzip $@
VHF-Testdaten_01-VHF01001-VHF02000.json.zip:
	wget $(vhf-url)/$@
	unzip $@
VHF-Testdaten_01-VHF02001-VHF03000.json.zip:
	wget $(vhf-url)/$@
	unzip $@
VHF-Testdaten_01-VHF03001-VHF04000.json.zip:
	wget $(vhf-url)/$@
	unzip $@
VHF-Testdaten_01-VHF04001-VHF05000.json.zip:
	wget $(vhf-url)/$@
	unzip $@
VHF-Testdaten_01-VHF05001-VHF06000.json.zip:
	wget $(vhf-url)/$@
	unzip $@
VHF-Testdaten_01-VHF06001-VHF07000.json.zip:
	wget $(vhf-url)/$@
	unzip $@
VHF-Testdaten_01-VHF07001-VHF08000.json.zip:
	wget $(vhf-url)/$@
	unzip $@
VHF-Testdaten_01-VHF09001-VHF10000.json.zip:
	wget $(vhf-url)/$@
	unzip $@
