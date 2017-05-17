nan = ['-3.4028234663852886e+38']

with open('horizon_dem.xyz', 'r') as oldfile, open('horizon_dem_trim.xyz', 'w+') as newfile:
    for line in oldfile:
        if nan[0] not in line:
            newfile.write(line)
