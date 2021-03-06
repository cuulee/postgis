﻿delete
FROM geocoder
WHERE gid IN
	(SELECT gid FROM 
		(SELECT gid, row_number() OVER (PARTITION BY location) AS rnum 
		FROM geocoder
		where provider = 'Bing'
		and city = 'toronto') as t
	WHERE rnum > 1
	)