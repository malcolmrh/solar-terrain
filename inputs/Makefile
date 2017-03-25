all: dem/filled.tif

dem/48_10_2_1_5m_v2.0.tar:
	mkdir -p dem
	curl -o $@ 'http://data.pgc.umn.edu/elev/dem/setsm/ArcticDEM/mosaic/v2.0/48_10/48_10_2_1_5m_v2.0.tar'

dem/48_10_2_2_5m_v2.0.tar:
	mkdir -p dem
	curl -o $@ 'http://data.pgc.umn.edu/elev/dem/setsm/ArcticDEM/mosaic/v2.0/48_10/48_10_2_2_5m_v2.0.tar'

dem/48_10_2_1_5m_v2.0_reg_dem.tif: dem/48_10_2_1_5m_v2.0.tar
	tar -xvf $^ $@
	touch $@

dem/48_10_2_2_5m_v2.0_reg_dem.tif: dem/48_10_2_2_5m_v2.0.tar
	tar -xvf $^ $@
	touch $@

dem/merged.tif: dem/48_10_2_1_5m_v2.0_reg_dem.tif dem/48_10_2_2_5m_v2.0_reg_dem.tif
	gdal_merge.py -o $@ $^
	rm $^

dem/nodata.tif: dem/merged.tif
	gdal_translate -of GTiff -a_nodata 0 $^ $@

dem/filled.tif: dem/nodata.tif
	gdal_fillnodata.py -md 100 -si 1 $^ -nomask $@

clean:
	rm dem/*.tif
	rm dem/*.aux.xml
