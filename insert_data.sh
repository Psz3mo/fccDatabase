#! /bin/bash

if [[ $1 == "test" ]]
then
  PSQL="psql --username=postgres --dbname=worldcuptest -t --no-align -c"
else
  PSQL="psql --username=freecodecamp --dbname=worldcup -t --no-align -c"
fi

# Do not change code above this line. Use the PSQL variable above to query your database.

echo -e "\n~~ Insert data to worldcup Database ~~"

echo "$($PSQL "TRUNCATE teams, games;")"

cat games.csv | while IFS="," read YEAR ROUND WINNER OPPONENT W_GOALS O_GOALS
do
  # insert teams
  if [[ $YEAR != year ]]
  then
    WINNER_ID="$($PSQL "SELECT team_id FROM teams WHERE name='$WINNER';")"
    if [[ -z $WINNER_ID ]]
    then
      INSERT_WINNER_ID="$($PSQL "INSERT INTO teams (name) VALUES ('$WINNER');")"
      echo Insert data to teams: $WINNER
    fi

    OPPONENT_ID="$($PSQL "SELECT team_id FROM teams WHERE name='$OPPONENT';")"
    if [[ -z $OPPONENT_ID ]]
    then
      INSERT_WINNER_ID="$($PSQL "INSERT INTO teams (name) VALUES ('$OPPONENT');")"
      echo Insert data to teams: $OPPONENT
    fi
  fi
done

cat games.csv | while IFS="," read YEAR ROUND WINNER OPPONENT W_GOALS O_GOALS
do

  if [[ $YEAR != year ]]
  then

    WINNER_ID="$($PSQL "SELECT team_id FROM teams WHERE name='$WINNER';")"
    OPPONENT_ID="$($PSQL "SELECT team_id FROM teams WHERE name='$OPPONENT';")"

    INSERT_QUERY="$($PSQL "INSERT INTO games (year, round, winner_id, opponent_id, 
    winner_goals, opponent_goals) VALUES ($YEAR, '$ROUND',$WINNER_ID,$OPPONENT_ID,$W_GOALS,$O_GOALS);")"
    echo Insert data to games: $YEAR, $ROUND, $WINNER, $OPPONENT, $W_GOALS, $O_GOALS

  fi

done
