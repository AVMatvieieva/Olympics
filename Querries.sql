##########################################################################################################
# Finden wir heraus, welche Länder und in welchen Disziplinen seit 1984 die meisten Medaillen gewonnen haben
##########################################################################################################
SELECT ae.NOC, e.Sport, COUNT(ae.Medal)
FROM athletes_events ae
left join events e ON e.ID_event = ae.ID_event
WHERE ae.Medal != "" and ae.Year > 1984
group by ae.NOC, e.Sport
order by COUNT(ae.Medal) DESC;

##########################################################################################################
# Lassen Sie uns herausfinden, in welchem ​​Jahr wie viele Länder teilgenommen haben
##########################################################################################################
SELECT year, COUNT(DISTINCT NOC) AS NOC_count
FROM athletes_events
GROUP BY year
ORDER BY NOC_count DESC;       

##########################################################################################################
# Lassen Sie uns herausfinden, wie viele Athleten(Athleten werden wir nicht einzigartige Athleten nehmen, 
# da ein Athlet in mehreren Disziplinen teilnehmen könnte) jedes Jahr teilgenommen haben, 
# und den Prozentsatz der Teilnehmer aus dem maximal möglichen Wert ermitteln.
##########################################################################################################
WITH athlete_counts AS (
    SELECT 
        year, 
        COUNT(ID_athlet) AS athlet_count
    FROM athletes_events
    GROUP BY year
),
max_athlets AS (
    SELECT MAX(athlet_count) AS max_athlet_count FROM athlete_counts
)
SELECT 
    a.year, 
    a.athlet_count, 
    ROUND((a.athlet_count / m.max_athlet_count) * 100, 2) AS percent
FROM athlete_counts a
JOIN max_athlets m
ORDER BY year DESC;

##########################################################################################################
# Ermitteln die 10 Länder, die gemessen an der Gesamtzahl der Medaillen am häufigsten gewinnen nach 1984
##########################################################################################################
SELECT NOC, COUNT(Medal)
FROM athletes_events
WHERE Medal != "" and Year >= 1984
GROUP BY NOC
ORDER BY COUNT(Medal) DESC
LIMIT 10;

##########################################################################################################
#Finden auch die zehn führenden Sportarten in der Gesamtwertung
##########################################################################################################
SELECT e.Sport, COUNT(a.Medal)
FROM athletes_events a
left JOIN events e ON e.ID_event = a.ID_event
WHERE a.Medal != "" and a.Year >= 1984
GROUP BY e.Sport
ORDER BY COUNT(a.Medal) DESC
LIMIT 10;

##########################################################################################################
# Finden wir die durchschnittliche Größe und das durchschnittliche Gewicht 
# für Männer und Frauen in verschiedenen Disziplinen für Athleten, die gewonnen haben
##########################################################################################################
SELECT 
    e.Sport,
    AVG(CASE WHEN a.Sex = 'F' AND ae.Year > 1984 AND ae.Medal IS NOT NULL THEN a.Height END) AS Frau_Height,
    AVG(CASE WHEN a.Sex = 'F' AND ae.Year > 1984 AND ae.Medal IS NOT NULL THEN a.Weight END) AS Frau_Weight,
    AVG(CASE WHEN a.Sex = 'M' AND ae.Year > 1984 AND ae.Medal IS NOT NULL THEN a.Height END) AS Mann_Height,
    AVG(CASE WHEN a.Sex = 'M' AND ae.Year > 1984 AND ae.Medal IS NOT NULL THEN a.Weight END) AS Mann_Weight
FROM athletes_events ae
LEFT JOIN athletes a ON a.ID_athlet = ae.ID_athlet
LEFT JOIN events e ON e.ID_event = ae.ID_event
WHERE ae.Year >= 1984 AND ae.Medal IS NOT NULL
GROUP BY e.Sport
ORDER BY Frau_Height DESC, Frau_Weight DESC, Mann_Height DESC, Mann_Weight DESC;

##########################################################################################################
# Finden wir das Durchschnittsalter der Athleten, die in verschiedenen Disziplinen nach 1984 gewinnen 
##########################################################################################################
SELECT Sport, 
AVG(CASE WHEN a.Sex = 'F' AND ae.Year > 1984 AND ae.Medal IS NOT NULL THEN Age END) AS Frau_AVG_Age,
AVG(CASE WHEN a.Sex = 'M' AND ae.Year > 1984 AND ae.Medal IS NOT NULL THEN Age END) AS Mann_AVG_Age
FROM athletes_events ae LEFT JOIN events e ON e.ID_event = ae.ID_event
LEFT JOIN athletes a ON a.ID_athlet = ae.ID_athlet
GROUP BY Sport
Having Frau_AVG_Age IS NOT NULL OR Mann_AVG_Age IS NOT NULL
Order by AVG(Age) DESC

