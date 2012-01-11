#!/bin/sh -ex

mkdir -p tmp
mkdir -p out/13/w out/13/e

curl -Rs -o tmp/georgia.osm.pbf -L http://download.geofabrik.de/osm/north-america/us/georgia.osm.pbf

osmosis --rb tmp/georgia.osm.pbf \
    --tf accept-ways "highway=motorway,motorway_link,trunk,trunk_link,primary,primary_link,secondary,secondary_link,tertiary,tertiary_link,residential,unclassified,road,service,minor,footpath,track,footway,steps,pedestrian,path,cycleway" \
    --used-node --tee outputCount=2 \
        --tf reject-relations --wb tmp/georgia-roads.osm.pbf \
        --tf accept-relations "network=*" --used-way --used-node \
        --tee outputCount=4 \
            --tf accept-relations "network=US:I" --used-way --used-node --wb omitmetadata=true tmp/georgia-routes-A.osm.pbf \
            --tf accept-relations "network=US:US" --used-way --used-node --wb omitmetadata=true tmp/georgia-routes-B.osm.pbf \
            --tf accept-relations "network=US:GA" --used-way --used-node --wb omitmetadata=true tmp/georgia-routes-C.osm.pbf \
            --tf accept-relations "network=US:GA:CR" --used-way --used-node --wb omitmetadata=true tmp/georgia-routes-D.osm.pbf \

osmosis \
    --rb tmp/georgia-routes-A.osm.pbf \
    --rb tmp/georgia-routes-B.osm.pbf \
    --rb tmp/georgia-routes-C.osm.pbf \
    --rb tmp/georgia-routes-D.osm.pbf \
    --merge --merge --merge \
    --wx tmp/georgia-routes.osm.bz2

osmosis \
    --rb tmp/georgia-roads.osm.pbf \
    --tee outputCount=159 \
    --bp completeWays=yes file=polys/13/13007-Baker-County.txt         --wx out/13/w/13007-baker-county.osm.bz2 \
    --bp completeWays=yes file=polys/13/13011-Banks-County.txt         --wx out/13/w/13011-banks-county.osm.bz2 \
    --bp completeWays=yes file=polys/13/13013-Barrow-County.txt        --wx out/13/w/13013-barrow-county.osm.bz2 \
    --bp completeWays=yes file=polys/13/13015-Bartow-County.txt        --wx out/13/w/13015-bartow-county.osm.bz2 \
    --bp completeWays=yes file=polys/13/13017-Ben-Hill-County.txt      --wx out/13/w/13017-ben-hill-county.osm.bz2 \
    --bp completeWays=yes file=polys/13/13019-Berrien-County.txt       --wx out/13/w/13019-berrien-county.osm.bz2 \
    --bp completeWays=yes file=polys/13/13021-Bibb-County.txt          --wx out/13/w/13021-bibb-county.osm.bz2 \
    --bp completeWays=yes file=polys/13/13023-Bleckley-County.txt      --wx out/13/w/13023-bleckley-county.osm.bz2 \
    --bp completeWays=yes file=polys/13/13027-Brooks-County.txt        --wx out/13/w/13027-brooks-county.osm.bz2 \
    --bp completeWays=yes file=polys/13/13035-Butts-County.txt         --wx out/13/w/13035-butts-county.osm.bz2 \
    --bp completeWays=yes file=polys/13/13037-Calhoun-County.txt       --wx out/13/w/13037-calhoun-county.osm.bz2 \
    --bp completeWays=yes file=polys/13/13045-Carroll-County.txt       --wx out/13/w/13045-carroll-county.osm.bz2 \
    --bp completeWays=yes file=polys/13/13047-Catoosa-County.txt       --wx out/13/w/13047-catoosa-county.osm.bz2 \
    --bp completeWays=yes file=polys/13/13053-Chattahoochee-County.txt --wx out/13/w/13053-chattahoochee-county.osm.bz2 \
    --bp completeWays=yes file=polys/13/13055-Chattooga-County.txt     --wx out/13/w/13055-chattooga-county.osm.bz2 \
    --bp completeWays=yes file=polys/13/13057-Cherokee-County.txt      --wx out/13/w/13057-cherokee-county.osm.bz2 \
    --bp completeWays=yes file=polys/13/13059-Clarke-County.txt        --wx out/13/w/13059-clarke-county.osm.bz2 \
    --bp completeWays=yes file=polys/13/13061-Clay-County.txt          --wx out/13/w/13061-clay-county.osm.bz2 \
    --bp completeWays=yes file=polys/13/13063-Clayton-County.txt       --wx out/13/w/13063-clayton-county.osm.bz2 \
    --bp completeWays=yes file=polys/13/13067-Cobb-County.txt          --wx out/13/w/13067-cobb-county.osm.bz2 \
    --bp completeWays=yes file=polys/13/13071-Colquitt-County.txt      --wx out/13/w/13071-colquitt-county.osm.bz2 \
    --bp completeWays=yes file=polys/13/13075-Cook-County.txt          --wx out/13/w/13075-cook-county.osm.bz2 \
    --bp completeWays=yes file=polys/13/13077-Coweta-County.txt        --wx out/13/w/13077-coweta-county.osm.bz2 \
    --bp completeWays=yes file=polys/13/13079-Crawford-County.txt      --wx out/13/w/13079-crawford-county.osm.bz2 \
    --bp completeWays=yes file=polys/13/13081-Crisp-County.txt         --wx out/13/w/13081-crisp-county.osm.bz2 \
    --bp completeWays=yes file=polys/13/13083-Dade-County.txt          --wx out/13/w/13083-dade-county.osm.bz2 \
    --bp completeWays=yes file=polys/13/13085-Dawson-County.txt        --wx out/13/w/13085-dawson-county.osm.bz2 \
    --bp completeWays=yes file=polys/13/13087-Decatur-County.txt       --wx out/13/w/13087-decatur-county.osm.bz2 \
    --bp completeWays=yes file=polys/13/13089-DeKalb-County.txt        --wx out/13/w/13089-dekalb-county.osm.bz2 \
    --bp completeWays=yes file=polys/13/13093-Dooly-County.txt         --wx out/13/w/13093-dooly-county.osm.bz2 \
    --bp completeWays=yes file=polys/13/13095-Dougherty-County.txt     --wx out/13/w/13095-dougherty-county.osm.bz2 \
    --bp completeWays=yes file=polys/13/13097-Douglas-County.txt       --wx out/13/w/13097-douglas-county.osm.bz2 \
    --bp completeWays=yes file=polys/13/13099-Early-County.txt         --wx out/13/w/13099-early-county.osm.bz2 \
    --bp completeWays=yes file=polys/13/13111-Fannin-County.txt        --wx out/13/w/13111-fannin-county.osm.bz2 \
    --bp completeWays=yes file=polys/13/13113-Fayette-County.txt       --wx out/13/w/13113-fayette-county.osm.bz2 \
    --bp completeWays=yes file=polys/13/13115-Floyd-County.txt         --wx out/13/w/13115-floyd-county.osm.bz2 \
    --bp completeWays=yes file=polys/13/13117-Forsyth-County.txt       --wx out/13/w/13117-forsyth-county.osm.bz2 \
    --bp completeWays=yes file=polys/13/13121-Fulton-County.txt        --wx out/13/w/13121-fulton-county.osm.bz2 \
    --bp completeWays=yes file=polys/13/13123-Gilmer-County.txt        --wx out/13/w/13123-gilmer-county.osm.bz2 \
    --bp completeWays=yes file=polys/13/13129-Gordon-County.txt        --wx out/13/w/13129-gordon-county.osm.bz2 \
    --bp completeWays=yes file=polys/13/13131-Grady-County.txt         --wx out/13/w/13131-grady-county.osm.bz2 \
    --bp completeWays=yes file=polys/13/13135-Gwinnett-County.txt      --wx out/13/w/13135-gwinnett-county.osm.bz2 \
    --bp completeWays=yes file=polys/13/13137-Habersham-County.txt     --wx out/13/w/13137-habersham-county.osm.bz2 \
    --bp completeWays=yes file=polys/13/13139-Hall-County.txt          --wx out/13/w/13139-hall-county.osm.bz2 \
    --bp completeWays=yes file=polys/13/13143-Haralson-County.txt      --wx out/13/w/13143-haralson-county.osm.bz2 \
    --bp completeWays=yes file=polys/13/13145-Harris-County.txt        --wx out/13/w/13145-harris-county.osm.bz2 \
    --bp completeWays=yes file=polys/13/13149-Heard-County.txt         --wx out/13/w/13149-heard-county.osm.bz2 \
    --bp completeWays=yes file=polys/13/13151-Henry-County.txt         --wx out/13/w/13151-henry-county.osm.bz2 \
    --bp completeWays=yes file=polys/13/13153-Houston-County.txt       --wx out/13/w/13153-houston-county.osm.bz2 \
    --bp completeWays=yes file=polys/13/13155-Irwin-County.txt         --wx out/13/w/13155-irwin-county.osm.bz2 \
    --bp completeWays=yes file=polys/13/13157-Jackson-County.txt       --wx out/13/w/13157-jackson-county.osm.bz2 \
    --bp completeWays=yes file=polys/13/13159-Jasper-County.txt        --wx out/13/w/13159-jasper-county.osm.bz2 \
    --bp completeWays=yes file=polys/13/13169-Jones-County.txt         --wx out/13/w/13169-jones-county.osm.bz2 \
    --bp completeWays=yes file=polys/13/13171-Lamar-County.txt         --wx out/13/w/13171-lamar-county.osm.bz2 \
    --bp completeWays=yes file=polys/13/13173-Lanier-County.txt        --wx out/13/w/13173-lanier-county.osm.bz2 \
    --bp completeWays=yes file=polys/13/13177-Lee-County.txt           --wx out/13/w/13177-lee-county.osm.bz2 \
    --bp completeWays=yes file=polys/13/13185-Lowndes-County.txt       --wx out/13/w/13185-lowndes-county.osm.bz2 \
    --bp completeWays=yes file=polys/13/13187-Lumpkin-County.txt       --wx out/13/w/13187-lumpkin-county.osm.bz2 \
    --bp completeWays=yes file=polys/13/13193-Macon-County.txt         --wx out/13/w/13193-macon-county.osm.bz2 \
    --bp completeWays=yes file=polys/13/13197-Marion-County.txt        --wx out/13/w/13197-marion-county.osm.bz2 \
    --bp completeWays=yes file=polys/13/13199-Meriwether-County.txt    --wx out/13/w/13199-meriwether-county.osm.bz2 \
    --bp completeWays=yes file=polys/13/13201-Miller-County.txt        --wx out/13/w/13201-miller-county.osm.bz2 \
    --bp completeWays=yes file=polys/13/13205-Mitchell-County.txt      --wx out/13/w/13205-mitchell-county.osm.bz2 \
    --bp completeWays=yes file=polys/13/13207-Monroe-County.txt        --wx out/13/w/13207-monroe-county.osm.bz2 \
    --bp completeWays=yes file=polys/13/13211-Morgan-County.txt        --wx out/13/w/13211-morgan-county.osm.bz2 \
    --bp completeWays=yes file=polys/13/13213-Murray-County.txt        --wx out/13/w/13213-murray-county.osm.bz2 \
    --bp completeWays=yes file=polys/13/13215-Muscogee-County.txt      --wx out/13/w/13215-muscogee-county.osm.bz2 \
    --bp completeWays=yes file=polys/13/13217-Newton-County.txt        --wx out/13/w/13217-newton-county.osm.bz2 \
    --bp completeWays=yes file=polys/13/13219-Oconee-County.txt        --wx out/13/w/13219-oconee-county.osm.bz2 \
    --bp completeWays=yes file=polys/13/13223-Paulding-County.txt      --wx out/13/w/13223-paulding-county.osm.bz2 \
    --bp completeWays=yes file=polys/13/13225-Peach-County.txt         --wx out/13/w/13225-peach-county.osm.bz2 \
    --bp completeWays=yes file=polys/13/13227-Pickens-County.txt       --wx out/13/w/13227-pickens-county.osm.bz2 \
    --bp completeWays=yes file=polys/13/13231-Pike-County.txt          --wx out/13/w/13231-pike-county.osm.bz2 \
    --bp completeWays=yes file=polys/13/13233-Polk-County.txt          --wx out/13/w/13233-polk-county.osm.bz2 \
    --bp completeWays=yes file=polys/13/13235-Pulaski-County.txt       --wx out/13/w/13235-pulaski-county.osm.bz2 \
    --bp completeWays=yes file=polys/13/13237-Putnam-County.txt        --wx out/13/w/13237-putnam-county.osm.bz2 \
    --bp completeWays=yes file=polys/13/13239-Quitman-County.txt       --wx out/13/w/13239-quitman-county.osm.bz2 \
    --bp completeWays=yes file=polys/13/13241-Rabun-County.txt         --wx out/13/w/13241-rabun-county.osm.bz2 \
    --bp completeWays=yes file=polys/13/13243-Randolph-County.txt      --wx out/13/w/13243-randolph-county.osm.bz2 \
    --bp completeWays=yes file=polys/13/13247-Rockdale-County.txt      --wx out/13/w/13247-rockdale-county.osm.bz2 \
    --bp completeWays=yes file=polys/13/13249-Schley-County.txt        --wx out/13/w/13249-schley-county.osm.bz2 \
    --bp completeWays=yes file=polys/13/13253-Seminole-County.txt      --wx out/13/w/13253-seminole-county.osm.bz2 \
    --bp completeWays=yes file=polys/13/13255-Spalding-County.txt      --wx out/13/w/13255-spalding-county.osm.bz2 \
    --bp completeWays=yes file=polys/13/13259-Stewart-County.txt       --wx out/13/w/13259-stewart-county.osm.bz2 \
    --bp completeWays=yes file=polys/13/13261-Sumter-County.txt        --wx out/13/w/13261-sumter-county.osm.bz2 \
    --bp completeWays=yes file=polys/13/13263-Talbot-County.txt        --wx out/13/w/13263-talbot-county.osm.bz2 \
    --bp completeWays=yes file=polys/13/13269-Taylor-County.txt        --wx out/13/w/13269-taylor-county.osm.bz2 \
    --bp completeWays=yes file=polys/13/13273-Terrell-County.txt       --wx out/13/w/13273-terrell-county.osm.bz2 \
    --bp completeWays=yes file=polys/13/13275-Thomas-County.txt        --wx out/13/w/13275-thomas-county.osm.bz2 \
    --bp completeWays=yes file=polys/13/13277-Tift-County.txt          --wx out/13/w/13277-tift-county.osm.bz2 \
    --bp completeWays=yes file=polys/13/13281-Towns-County.txt         --wx out/13/w/13281-towns-county.osm.bz2 \
    --bp completeWays=yes file=polys/13/13285-Troup-County.txt         --wx out/13/w/13285-troup-county.osm.bz2 \
    --bp completeWays=yes file=polys/13/13287-Turner-County.txt        --wx out/13/w/13287-turner-county.osm.bz2 \
    --bp completeWays=yes file=polys/13/13289-Twiggs-County.txt        --wx out/13/w/13289-twiggs-county.osm.bz2 \
    --bp completeWays=yes file=polys/13/13291-Union-County.txt         --wx out/13/w/13291-union-county.osm.bz2 \
    --bp completeWays=yes file=polys/13/13293-Upson-County.txt         --wx out/13/w/13293-upson-county.osm.bz2 \
    --bp completeWays=yes file=polys/13/13295-Walker-County.txt        --wx out/13/w/13295-walker-county.osm.bz2 \
    --bp completeWays=yes file=polys/13/13297-Walton-County.txt        --wx out/13/w/13297-walton-county.osm.bz2 \
    --bp completeWays=yes file=polys/13/13307-Webster-County.txt       --wx out/13/w/13307-webster-county.osm.bz2 \
    --bp completeWays=yes file=polys/13/13311-White-County.txt         --wx out/13/w/13311-white-county.osm.bz2 \
    --bp completeWays=yes file=polys/13/13313-Whitfield-County.txt     --wx out/13/w/13313-whitfield-county.osm.bz2 \
    --bp completeWays=yes file=polys/13/13315-Wilcox-County.txt        --wx out/13/w/13315-wilcox-county.osm.bz2 \
    --bp completeWays=yes file=polys/13/13321-Worth-County.txt         --wx out/13/w/13321-worth-county.osm.bz2 \
    --bp completeWays=yes file=polys/13/13001-Appling-County.txt       --wx out/13/e/13001-appling-county.osm.bz2 \
    --bp completeWays=yes file=polys/13/13003-Atkinson-County.txt      --wx out/13/e/13003-atkinson-county.osm.bz2 \
    --bp completeWays=yes file=polys/13/13005-Bacon-County.txt         --wx out/13/e/13005-bacon-county.osm.bz2 \
    --bp completeWays=yes file=polys/13/13009-Baldwin-County.txt       --wx out/13/e/13009-baldwin-county.osm.bz2 \
    --bp completeWays=yes file=polys/13/13025-Brantley-County.txt      --wx out/13/e/13025-brantley-county.osm.bz2 \
    --bp completeWays=yes file=polys/13/13029-Bryan-County.txt         --wx out/13/e/13029-bryan-county.osm.bz2 \
    --bp completeWays=yes file=polys/13/13031-Bulloch-County.txt       --wx out/13/e/13031-bulloch-county.osm.bz2 \
    --bp completeWays=yes file=polys/13/13033-Burke-County.txt         --wx out/13/e/13033-burke-county.osm.bz2 \
    --bp completeWays=yes file=polys/13/13039-Camden-County.txt        --wx out/13/e/13039-camden-county.osm.bz2 \
    --bp completeWays=yes file=polys/13/13043-Candler-County.txt       --wx out/13/e/13043-candler-county.osm.bz2 \
    --bp completeWays=yes file=polys/13/13049-Charlton-County.txt      --wx out/13/e/13049-charlton-county.osm.bz2 \
    --bp completeWays=yes file=polys/13/13051-Chatham-County.txt       --wx out/13/e/13051-chatham-county.osm.bz2 \
    --bp completeWays=yes file=polys/13/13065-Clinch-County.txt        --wx out/13/e/13065-clinch-county.osm.bz2 \
    --bp completeWays=yes file=polys/13/13069-Coffee-County.txt        --wx out/13/e/13069-coffee-county.osm.bz2 \
    --bp completeWays=yes file=polys/13/13073-Columbia-County.txt      --wx out/13/e/13073-columbia-county.osm.bz2 \
    --bp completeWays=yes file=polys/13/13091-Dodge-County.txt         --wx out/13/e/13091-dodge-county.osm.bz2 \
    --bp completeWays=yes file=polys/13/13101-Echols-County.txt        --wx out/13/e/13101-echols-county.osm.bz2 \
    --bp completeWays=yes file=polys/13/13103-Effingham-County.txt     --wx out/13/e/13103-effingham-county.osm.bz2 \
    --bp completeWays=yes file=polys/13/13105-Elbert-County.txt        --wx out/13/e/13105-elbert-county.osm.bz2 \
    --bp completeWays=yes file=polys/13/13107-Emanuel-County.txt       --wx out/13/e/13107-emanuel-county.osm.bz2 \
    --bp completeWays=yes file=polys/13/13109-Evans-County.txt         --wx out/13/e/13109-evans-county.osm.bz2 \
    --bp completeWays=yes file=polys/13/13119-Franklin-County.txt      --wx out/13/e/13119-franklin-county.osm.bz2 \
    --bp completeWays=yes file=polys/13/13125-Glascock-County.txt      --wx out/13/e/13125-glascock-county.osm.bz2 \
    --bp completeWays=yes file=polys/13/13127-Glynn-County.txt         --wx out/13/e/13127-glynn-county.osm.bz2 \
    --bp completeWays=yes file=polys/13/13133-Greene-County.txt        --wx out/13/e/13133-greene-county.osm.bz2 \
    --bp completeWays=yes file=polys/13/13141-Hancock-County.txt       --wx out/13/e/13141-hancock-county.osm.bz2 \
    --bp completeWays=yes file=polys/13/13147-Hart-County.txt          --wx out/13/e/13147-hart-county.osm.bz2 \
    --bp completeWays=yes file=polys/13/13161-Jeff-Davis-County.txt    --wx out/13/e/13161-jeff-davis-county.osm.bz2 \
    --bp completeWays=yes file=polys/13/13163-Jefferson-County.txt     --wx out/13/e/13163-jefferson-county.osm.bz2 \
    --bp completeWays=yes file=polys/13/13165-Jenkins-County.txt       --wx out/13/e/13165-jenkins-county.osm.bz2 \
    --bp completeWays=yes file=polys/13/13167-Johnson-County.txt       --wx out/13/e/13167-johnson-county.osm.bz2 \
    --bp completeWays=yes file=polys/13/13175-Laurens-County.txt       --wx out/13/e/13175-laurens-county.osm.bz2 \
    --bp completeWays=yes file=polys/13/13179-Liberty-County.txt       --wx out/13/e/13179-liberty-county.osm.bz2 \
    --bp completeWays=yes file=polys/13/13181-Lincoln-County.txt       --wx out/13/e/13181-lincoln-county.osm.bz2 \
    --bp completeWays=yes file=polys/13/13183-Long-County.txt          --wx out/13/e/13183-long-county.osm.bz2 \
    --bp completeWays=yes file=polys/13/13189-McDuffie-County.txt      --wx out/13/e/13189-mcduffie-county.osm.bz2 \
    --bp completeWays=yes file=polys/13/13191-McIntosh-County.txt      --wx out/13/e/13191-mcintosh-county.osm.bz2 \
    --bp completeWays=yes file=polys/13/13195-Madison-County.txt       --wx out/13/e/13195-madison-county.osm.bz2 \
    --bp completeWays=yes file=polys/13/13209-Montgomery-County.txt    --wx out/13/e/13209-montgomery-county.osm.bz2 \
    --bp completeWays=yes file=polys/13/13221-Oglethorpe-County.txt    --wx out/13/e/13221-oglethorpe-county.osm.bz2 \
    --bp completeWays=yes file=polys/13/13229-Pierce-County.txt        --wx out/13/e/13229-pierce-county.osm.bz2 \
    --bp completeWays=yes file=polys/13/13245-Richmond-County.txt      --wx out/13/e/13245-richmond-county.osm.bz2 \
    --bp completeWays=yes file=polys/13/13251-Screven-County.txt       --wx out/13/e/13251-screven-county.osm.bz2 \
    --bp completeWays=yes file=polys/13/13257-Stephens-County.txt      --wx out/13/e/13257-stephens-county.osm.bz2 \
    --bp completeWays=yes file=polys/13/13265-Taliaferro-County.txt    --wx out/13/e/13265-taliaferro-county.osm.bz2 \
    --bp completeWays=yes file=polys/13/13267-Tattnall-County.txt      --wx out/13/e/13267-tattnall-county.osm.bz2 \
    --bp completeWays=yes file=polys/13/13271-Telfair-County.txt       --wx out/13/e/13271-telfair-county.osm.bz2 \
    --bp completeWays=yes file=polys/13/13279-Toombs-County.txt        --wx out/13/e/13279-toombs-county.osm.bz2 \
    --bp completeWays=yes file=polys/13/13283-Treutlen-County.txt      --wx out/13/e/13283-treutlen-county.osm.bz2 \
    --bp completeWays=yes file=polys/13/13299-Ware-County.txt          --wx out/13/e/13299-ware-county.osm.bz2 \
    --bp completeWays=yes file=polys/13/13301-Warren-County.txt        --wx out/13/e/13301-warren-county.osm.bz2 \
    --bp completeWays=yes file=polys/13/13303-Washington-County.txt    --wx out/13/e/13303-washington-county.osm.bz2 \
    --bp completeWays=yes file=polys/13/13305-Wayne-County.txt         --wx out/13/e/13305-wayne-county.osm.bz2 \
    --bp completeWays=yes file=polys/13/13309-Wheeler-County.txt       --wx out/13/e/13309-wheeler-county.osm.bz2 \
    --bp completeWays=yes file=polys/13/13317-Wilkes-County.txt        --wx out/13/e/13317-wilkes-county.osm.bz2 \
    --bp completeWays=yes file=polys/13/13319-Wilkinson-County.txt     --wx out/13/e/13319-wilkinson-county.osm.bz2 \

touch -r tmp/georgia.osm.pbf out/13/*/*.osm.???

./skeletron-roads.sh tmp/georgia-roads.osm.pbf out/13 georgia GA
./skeletron-routes.sh tmp/georgia-routes.osm.bz2 out/13 georgia GA
