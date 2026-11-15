SELECT VIDEO_CONTENT.*
FROM VIDEO_CONTENT LEFT JOIN ARCHIVE
ON VIDEO_CONTENT.VIDEO_ID = ARCHIVE.VIDEO_ID
WHERE 1=1
-- Need to filter out as new CMS cannot process archive video formats:
AND archive.video_id IS NULL;

-- USING:
SELECT *
FROM ALBUM INNER JOIN ARTIST 
USING (ARTIST_ID);

-- Traditional ON clause:
SELECT *
FROM ALBUM INNER JOIN ARTIST
ON ALBUM.ARTIST_ID = ARTIST.ARTIST_ID;

--- A benefit of USING is that the column in common between the two tables is deduplicated, 
--- with only one column returned in the result set.

--- Be aware of how NOT IN behaves with NULL values
-- NOT IN doesn't work if NULL is present in the values being checked against. 
-- As NULL represents Unknown the SQL engine can't verify that the value being checked is not present in the list.

INSERT INTO departments (id)
VALUES (1), (2), (NULL);

SELECT *
FROM EMPLOYEES
WHERE DEPARTMENT_ID NOT IN (SELECT DISTINCT ID FROM DEPARTMENTS); -- Doesn't work due to NULL

-- Use NOT EXISTS instead.
SELECT *
FROM EMPLOYEES e
WHERE NOT EXISTS(
	SELECT 1 
    FROM DEPARTMENTS d 
    WHERE d.id = e.department_id);










