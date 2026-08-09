CREATE DATABASE indian_election_analysis;

USE indian_election_analysis;
SELECT DATABASE();
CREATE TABLE constituency_results_2024 (
    state VARCHAR(100),
    pc_no INT,
    pc_name VARCHAR(150),
    candidate VARCHAR(150),
    party VARCHAR(150),
    total_votes BIGINT,
    vote_share DECIMAL(6,2),
    winning_margin BIGINT
);

CREATE TABLE state_party_results_2024 (
    state VARCHAR(100),
    party VARCHAR(150),
    seats_won INT,
    total_votes BIGINT
);

CREATE TABLE national_party_results_2024 (
    party VARCHAR(150),
    seats_won INT
);

CREATE TABLE state_winning_party_2024 (
    state VARCHAR(100),
    leading_party VARCHAR(150),
    leading_party_seats INT
);



CREATE TABLE national_party_votes_2024 (
    party VARCHAR(150),
    total_votes BIGINT,
    national_vote_share DECIMAL(6,2)
);


CREATE TABLE india_turnout_summary (
    election_year INT,
    voter_turnout_percentage DECIMAL(6,2),
    change_from_previous DECIMAL(6,2)
);



CREATE TABLE constituency_results_2024 (
    state VARCHAR(100),
    pc_no INT,
    pc_name VARCHAR(150),
    candidate VARCHAR(150),
    party VARCHAR(150),
    total_votes BIGINT,
    vote_share DECIMAL(6,2),
    winning_margin BIGINT
);

SELECT COUNT(*) AS total_rows
FROM constituency_results_2024;
SELECT *
FROM constituency_results_2024
LIMIT 10;


SELECT COUNT(*) AS total_states
FROM state_winning_party_2024;

SELECT COUNT(*) AS total_parties
FROM national_party_results_2024;

SELECT
    SUM(state IS NULL) AS missing_state,
    SUM(pc_name IS NULL) AS missing_constituency,
    SUM(candidate IS NULL) AS missing_candidate,
    SUM(party IS NULL) AS missing_party,
    SUM(total_votes IS NULL) AS missing_votes,
    SUM(vote_share IS NULL) AS missing_vote_share,
    SUM(winning_margin IS NULL) AS missing_margin
FROM constituency_results_2024;


SELECT
    state,
    pc_no,
    pc_name,
    COUNT(*) AS duplicate_count
FROM constituency_results_2024
GROUP BY state, pc_no, pc_name
HAVING COUNT(*) > 1;

SELECT COUNT(*) AS total_seats
FROM constituency_results_2024;


SELECT
    state,
    COUNT(*) AS seats
FROM constituency_results_2024
GROUP BY state
ORDER BY seats DESC;

SELECT
    SUM(seats) AS total_seats
FROM (
    SELECT
        state,
        COUNT(*) AS seats
    FROM constituency_results_2024
    GROUP BY state
) AS state_seats;


SELECT
    party,
    seats_won
FROM national_party_results_2024
ORDER BY seats_won DESC;


SELECT
    party,
    total_votes,
    national_vote_share
FROM national_party_votes_2024
ORDER BY national_vote_share DESC;


SELECT
    state,
    party,
    seats_won
FROM state_party_results_2024
ORDER BY
    state,
    seats_won DESC;
    
    
 SELECT
    party,
    seats_won,
    total_votes
FROM state_party_results_2024
WHERE state = 'Andhra Pradesh'
ORDER BY seats_won DESC;   

SELECT
    state,
    leading_party,
    leading_party_seats
FROM state_winning_party_2024
ORDER BY leading_party_seats DESC;


SELECT
    pc_no,
    pc_name,
    candidate,
    party,
    total_votes,
    vote_share,
    winning_margin
FROM constituency_results_2024
WHERE state = 'Andhra Pradesh'
ORDER BY pc_no;


SELECT
    state,
    pc_name,
    candidate,
    party,
    winning_margin
FROM constituency_results_2024
ORDER BY winning_margin DESC
LIMIT 10;


SELECT
    state,
    pc_name,
    candidate,
    party,
    winning_margin
FROM constituency_results_2024
ORDER BY winning_margin ASC
LIMIT 10;


SELECT
    state,
    pc_name,
    candidate,
    party,
    vote_share
FROM constituency_results_2024
ORDER BY vote_share DESC
LIMIT 10;


SELECT
    party,
    seats_won,
    ROUND((seats_won / 543) * 100, 2) AS seat_percentage
FROM national_party_results_2024
ORDER BY seats_won DESC;


SELECT
    election_year,
    voter_turnout_percentage,
    change_from_previous
FROM india_turnout_summary
ORDER BY election_year;

CREATE VIEW vw_constituency_analysis AS
SELECT
    state,
    pc_no,
    pc_name,
    candidate,
    party,
    total_votes,
    vote_share,
    winning_margin
FROM constituency_results_2024;

SELECT *
FROM vw_constituency_analysis
LIMIT 10;

CREATE VIEW vw_national_party_performance AS
SELECT
    party,
    seats_won
FROM national_party_results_2024
ORDER BY seats_won DESC;


CREATE VIEW vw_state_party_performance AS
SELECT
    state,
    party,
    seats_won,
    total_votes
FROM state_party_results_2024;


CREATE VIEW vw_india_turnout AS
SELECT
    election_year,
    voter_turnout_percentage,
    change_from_previous
FROM india_turnout_summary;


