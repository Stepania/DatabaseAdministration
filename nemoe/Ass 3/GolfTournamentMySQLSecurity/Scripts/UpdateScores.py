# python -m install pip mysql-connector
import mysql.connector
from mysql.connector import errorcode

# configuration dictionary
# mySQL Reference manual section 5.1
config = {
    'user':'GolfDayRunner',
    'password':'Golf@2020',
    'host':'127.0.0.1',
    'database':'GolfTournament',
    'auth_plugin':'mysql_native_password',
    'raise_on_warnings' : True
}

# Open the connection
try:
    mySQLconnection = mysql.connector.connect(**config)
    print('Successful connection')

# Get some input data
# Multiple ways this could be achieved
# For demo, this is input

    team_number = 2
    player_number = 0
    score = 44


# Run teh stored procedure
    return_value = 0
    cursor = mySQLconnection.cursor()
    arguments = (team_number,player_number,score,return_value)
    return_value = cursor.callproc('updatescore',arguments)[3]
    print(f"The new value successfully entered was {return_value}")

# Check the data has been entered
    query_string = f"SELECT teamNumber, day1Score, day2Player1Score, day2Player2Score FROM TournamentDayDataView WHERE teamNumber = {team_number}"
    cursor.execute(query_string)
    for team in cursor:
        print(f"Team number {team[0]} has scores {team[1]}, {team[2]}, {team[3]}")

# exception handling
except mysql.connector.Error as err:
    if err.errno == errorcode.ER_ACCESS_DENIED_ERROR:
        print("Invalid username or password")
    elif err.errno == errorcode.ER_BAD_DB_ERROR:
        print("Unknown database")
    else:
        print(err)

# Close teh connection
if 'mySQLConnection' in locals() : mySQLconnection.close()
