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