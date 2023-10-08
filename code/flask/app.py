from flask import Flask, render_template, request
from sqlalchemy import create_engine, text 
import os
from dotenv import load_dotenv

# Load the environment variables from the .env file
load_dotenv()

# Database connection settings from environment variables
DB_HOST = os.getenv("DB_HOST")
DB_DATABASE = os.getenv("DB_DATABASE")
DB_USERNAME = os.getenv("DB_USERNAME")
DB_PASSWORD = os.getenv("DB_PASSWORD")
#DB_PORT = int(os.getenv("DB_PORT", 3306))
#DB_CHARSET = os.getenv("DB_CHARSET", "utf8mb4")

connect_args={'ssl':{'fake_flag_to_enable_tls': True}}
connection_string = f'mysql+pymysql://{DB_USERNAME}:{DB_PASSWORD}@{DB_HOST}/{DB_DATABASE}'
engine = create_engine(
        connection_string,
        connect_args=connect_args)

app = Flask(__name__)

@app.route('/')
def index():
    return render_template('index.html')


@app.route('/patients')
def patients():
    # Establish a database connection
    with engine.connect() as connection:
        # Execute an SQL query to fetch data (replace this with your query)
        query1 = text('SELECT * FROM patients')

        result1 = connection.execute(query1)

        # Fetch all rows of data
        db_data1 = result1.fetchall()

    return render_template('patients.html', data1=db_data1)

@app.route('/doctors')
def doctors():
    # Establish a database connection
    with engine.connect() as connection:
        # Execute an SQL query to fetch data (replace this with your query)
        query2 = text('SELECT * FROM doctors')

        result2 = connection.execute(query2)

        # Fetch all rows of data
        db_data2 = result2.fetchall()

    return render_template('doctors.html', data2=db_data2)


if __name__ == '__main__':
    app.run(debug=True)