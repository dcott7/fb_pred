select 
    -- p.start_id, 
    -- p.away_score, 
    -- p.home_score, 
    p.clock, 
    -- pse.team_id,
    CASE 
        WHEN comp.home_away = 'home' THEN p.home_score - p.away_score
        WHEN comp.home_away = 'away' THEN p.away_score - p.home_score
        ELSE NULL
    END AS score_diff,
    pse.down, 
    pse.distance, 
    -- pse.yard_line, 
    pse.yards_to_endzone, 
    pt.abbreviation
from plays p
left join drives d ON p.drive_id = d.id
left join competitions co ON d.competition_id = co.id
left join play_start_ends pse ON p.start_id = pse.id
left join competitors comp ON co.id = comp.competition_id AND pse.team_id = comp.team_id
left join play_types pt ON p.play_type_id = pt.id