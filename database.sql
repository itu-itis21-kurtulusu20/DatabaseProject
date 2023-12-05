-- Table: appearance
CREATE TABLE appearance (
    appearance_id INT PRIMARY KEY,
    game_id INT REFERENCES games(game_id),
    player_id INT REFERENCES players(player_id),
    player_club_id INT,
    player_current_club_id INT,
    date DATE,
    player_name VARCHAR(255),
    competition_id INT,
    yellow_cards INT,
    red_cards INT,
    goals INT,
    assists INT,
    minutes_played INT
);

-- Table: club_games
CREATE TABLE club_games (
    game_id INT REFERENCES games(game_id),
    club_id INT REFERENCES clubs(club_id),
    own_goals INT,
    own_position INT,
    own_manager_name VARCHAR(255),
    opponent_id INT,
    opponent_goals INT,
    opponent_position INT,
    opponent_manager_name VARCHAR(255),
    hosting BOOLEAN,
    is_win BOOLEAN
);

-- Table: competitions
CREATE TABLE competitions (
    competition_id INT PRIMARY KEY,
    competition_code VARCHAR(10),
    name VARCHAR(255),
    sub_type VARCHAR(50),
    type VARCHAR(50),
    country_id INT,
    country_name VARCHAR(255),
    domestic_league_code VARCHAR(10),
    confederation VARCHAR(50),
    url VARCHAR(255)
);

-- Table: games
CREATE TABLE games (
    game_id INT PRIMARY KEY,
    competition_id INT REFERENCES competitions(competition_id),
    season VARCHAR(10),
    round VARCHAR(50),
    date DATE,
    home_club_id INT REFERENCES clubs(club_id),
    away_club_id INT REFERENCES clubs(club_id),
    home_club_goals INT,
    away_club_goals INT,
    home_club_position INT,
    away_club_position INT,
    home_club_manager_name VARCHAR(255),
    away_club_manager_name VARCHAR(255),
    stadium VARCHAR(255),
    attendance INT,
    referee VARCHAR(255),
    url VARCHAR(255),
    home_club_formation VARCHAR(50),
    away_club_formation VARCHAR(50),
    home_club_name VARCHAR(255),
    away_club_name VARCHAR(255),
    aggregate BOOLEAN,
    competition_type VARCHAR(50)
);

-- Table: game_events
CREATE TABLE game_events (
    game_event_id INT PRIMARY KEY,
    date DATE,
    game_id INT REFERENCES games(game_id),
    minute INT,
    type VARCHAR(50),
    club_id INT REFERENCES clubs(club_id),
    player_id INT REFERENCES players(player_id),
    description VARCHAR(255),
    player_in_id INT REFERENCES players(player_id),
    player_assist_id INT REFERENCES players(player_id)
);

-- Table: game_lineups
CREATE TABLE game_lineups (
    game_lineups_id INT PRIMARY KEY,
    game_id INT REFERENCES games(game_id),
    club_id INT REFERENCES clubs(club_id),
    type VARCHAR(50),
    number INT,
    player_id INT REFERENCES players(player_id),
    player_name VARCHAR(255),
    team_captain BOOLEAN,
    position VARCHAR(50)
);

-- Table: player_valuations
CREATE TABLE player_valuations (
    player_id INT PRIMARY KEY REFERENCES players(player_id),
    last_season VARCHAR(10),
    datetime DATETIME,
    date DATE,
    dateweek INT,
    market_value_in_eur DECIMAL(15, 2),
    n INT,
    current_club_id INT REFERENCES clubs(club_id),
    player_club_domestic_competition_id INT
);

-- Table: players
CREATE TABLE players (
    player_id INT PRIMARY KEY,
    first_name VARCHAR(255),
    last_name VARCHAR(255),
    name VARCHAR(255),
    last_season VARCHAR(10),
    current_club_id INT REFERENCES clubs(club_id),
    player_code VARCHAR(20),
    country_of_birth VARCHAR(255),
    city_of_birth VARCHAR(255),
    country_of_citizenship VARCHAR(255),
    date_of_birth DATE,
    sub_position VARCHAR(50),
    position VARCHAR(50),
    foot VARCHAR(10),
    height_in_cm INT,
    market_value_in_eur DECIMAL(15, 2),
    highest_market_value_in_eur DECIMAL(15, 2),
    contract_expiration_date DATE,
    agent_name VARCHAR(255),
    image_url VARCHAR(255),
    url VARCHAR(255),
    current_club_domestic_competition_id INT REFERENCES competitions(competition_id),
    current_club_name VARCHAR(255)
);
-- Table: clubs
CREATE TABLE clubs (
    club_id INT PRIMARY KEY,
    club_code VARCHAR(10),
    name VARCHAR(255),
    domestic_competition_id INT REFERENCES competitions(competition_id),
    total_market_value DECIMAL(15, 2),
    squad_size INT,
    average_age DECIMAL(5, 2),
    foreigners_number INT,
    foreigners_percentage DECIMAL(5, 2),
    national_team_players INT,
    stadium_name VARCHAR(255),
    stadium_seats INT,
    net_transfer_record DECIMAL(15, 2),
    coach_name VARCHAR(255),
    last_season VARCHAR(10),
    url VARCHAR(255)
);
