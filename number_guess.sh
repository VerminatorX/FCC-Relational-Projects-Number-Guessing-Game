#!/bin/bash
PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align -c"

ENTER_NAME() {
  echo "Enter your username:"
  read USERNAME
  GAMES_PLAYED=$($PSQL "SELECT games_played FROM player_data WHERE username='$USERNAME'")
  LAST_SCORE=$($PSQL "SELECT best_game FROM player_data WHERE username='$USERNAME'")

  USERNAME_CHECK=$($PSQL "SELECT username FROM player_data WHERE username='$USERNAME'")
  if [[ -z $USERNAME_CHECK ]]
  then
    echo "Welcome, $USERNAME! It looks like this is your first time here."
    PLAY
  else
    echo "Welcome back, $USERNAME! You have played $GAMES_PLAYED games, and your best game took $LAST_SCORE guesses."
    PLAY
  fi
}

### ADD NEW PLAYER
ADD_PLAYER() {
  INSERT_PLAYER_DATA=$($PSQL "INSERT INTO player_data(username, games_played, best_game) VALUES('$USERNAME', 1, $NUMBER_OF_GUESSES)")
}

### UPDATE SCORE FOR EXISTING PLAYERS
UPDATE_SCORE() {
  if (( $LAST_SCORE > $NUMBER_OF_GUESSES ))
  then
    SET_NEW_SCORE=$($PSQL "UPDATE player_data SET best_game=$NUMBER_OF_GUESSES, games_played = games_played + 1 WHERE username='$USERNAME'")
  fi
}

PLAY() {
  NUMBER_OF_GUESSES=1
  echo "Guess the secret number between 1 and 1000:"
  SECRET_NUMBER=$(( $RANDOM % 1000 + 1 ))
  echo $SECRET_NUMBER
  read GUESS
  
  while [[ "$GUESS" != "$SECRET_NUMBER" ]]
  do
    if ! [[ "$GUESS" =~ ^[0-9]+$ ]]
    then
      echo "That is not an integer, guess again:"
      read GUESS
      NUMBER_OF_GUESSES=$((NUMBER_OF_GUESSES + 1))
    elif (( "$GUESS" > "$SECRET_NUMBER" ))
    then
      echo "It's lower than that, guess again:"
      read GUESS
      NUMBER_OF_GUESSES=$((NUMBER_OF_GUESSES + 1))
    elif (( "$GUESS" < "$SECRET_NUMBER" ))
    then
      echo "It's higher than that, guess again:"
      read GUESS
      NUMBER_OF_GUESSES=$((NUMBER_OF_GUESSES + 1))
    fi
  done

  echo "You guessed it in $NUMBER_OF_GUESSES tries. The secret number was $SECRET_NUMBER. Nice job!"

  if [[ -z $USERNAME_CHECK ]]
  then
    ADD_PLAYER
  else
    UPDATE_SCORE
  fi
}

ENTER_NAME