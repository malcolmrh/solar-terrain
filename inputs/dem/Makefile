all: filled.tif

48_10_2_1_5m_v2.0.tar:
	curl -o $@ 'http://data.pgc.umn.edu/elev/dem/setsm/ArcticDEM/mosaic/v2.0/48_10/48_10_2_1_5m_v2.0.tar'

48_10_2_2_5m_v2.0.tar:
	curl -o $@ 'http://data.pgc.umn.edu/elev/dem/setsm/ArcticDEM/mosaic/v2.0/48_10/48_10_2_2_5m_v2.0.tar'

48_10_2_1_5m_v2.0_reg_dem.tif: 48_10_2_1_5m_v2.0.tar
	tar -xvf $^ $@
	touch $@

48_10_2_2_5m_v2.0_reg_dem.tif: 48_10_2_2_5m_v2.0.tar
	tar -xvf $^ $@
	touch $@

merged.tif: 48_10_2_1_5m_v2.0_reg_dem.tif 48_10_2_2_5m_v2.0_reg_dem.tif
	gdal_merge.py -o $@ $^
	rm $^

nodata.tif: merged.tif
	gdal_translate -of GTiff -a_nodata 0 $^ $@

filled.tif: nodata.tif
	gdal_fillnodata.py -md 100 -si 1 $^ -nomask $@

clean:
	rm *.tif
	rm *.aux.xml
