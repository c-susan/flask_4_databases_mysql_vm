# flask_4_databases_mysql_vm
HHA504 / Cloud Computing / Assignment 4b / MySQL on VMs

This repo focus on setting up and running MySQL on a cloud Virtual Machine. A VM was set up using Microsoft Azure. Flask is then connected to the MySQL instance to display the data from the database. 

## This repo contains the following: 
+ A **code** folder contaning code of the MySQL database setup, python script for the facilitaing the connection between Flask and MySQL, script to diasplay the data.
+ A **screenshots** folder containing screenshots of the database tables, and entity relationship diagram (ERD) of the database, and a screenshot of the working Flask app.
+ A **README.md** containing an overview of the repo and assignment.

# Documentation
### Setting Up a MySQL Instance on an Azure VM
1. A virtual machine was set up on Microsoft Azure. After the VM is set up, in the networking tab, a MySQL port of ```3306`` was added.
2. Google's cloud shell environment is used in this assignment. In the terminal, login into the VM / UBUNTU (OS) server using ```ssh <username>@<IP address>```. ```<username>``` and ```<IP address>``` was replaced with the username and the public IP address of the VM.
3. After logging into the UBUNTU server, I updated it with ```sudo apt-get update``` and then installed MySQL using ```sudo apt isntall mysql-client mysql-server```.
4. I logged into MySQL using ```sudo mysql``` and created a new user to connect with using ```CREATE USER '<user>'@'%'IDENTIFIED BY '<password>'```. ```<user>``` and ```<password>``` was replace the name a password I will set for the new user. To confirm it was successfully created,I put ```select user from my.sql;``` in the terminal. After confirming the user was created, I used ```GRANT ALL PRIVEGES ON*.*TO'<user>'@'%'WITH GRANT OPTION;``` to grant priveleges to new user. 

### Connecting to MySQL Workbench
1. In order to connect to MySQL Workbench, the MySQL instance in Google Shell must be configured to allow external connections. To do this, I made sure I was in the UBUNTU and not the mysql environment. 
2. In the terminal, I ran the command ```sudo nano /etc/mysql/mysql.conf.d/mysqld.conf``` to enter the configuration file. In the file, I searched for ```bind-address``` and ```mysqlx-bind-address``` and changed those addresses to ```0.0.0.0```.
3. Restarted mysql for the changes to take place using the command ```/etc/init.d/mysql restart```.
4. In MySQL, I set up a new connection. In the setup window, I put the VM IP address as the **Hostname**, the user name of the new user set up in mysql as the **Username**, and the associated password. Clicked **OK** to create the new connection. 

### Database Schema
In MySQL workbench, I created a new database called ```database``` and created 2 tables called ```patient``` and ```doctors```. The ```doctors``` contained columns for the doctor ID, their first and last name, and department they work in. The ```patient``` table contained columns for the patient ID, first and last name, date of birth, and primary doctor ID, with patient ID as a primary key and primary doctor ID as a foreign key referencing the doctor ID in the doctors table. Sample data was added to the tables using ```INSERT INTO```. The doctors table has a one to many relationship the the patients table. 
 
### Flask Integration 
**1.** A Flask application was created to connect to the MySQL instance using SQLAlchemy. A ```.env``` file was also created contain the database credentials along with a ```.gitignore``` file. The script can be found in code/flask folder of the repo.
**2.** The Flask application was ran to connect to the MySQL instance, however an error message was returned:
```
Python-dotenv could not parse statement starting at line 1
Python-dotenv could not parse statement starting at line 2
Python-dotenv could not parse statement starting at line 3
Python-dotenv could not parse statement starting at line 4
Python-dotenv could not parse statement starting at line 5
Python-dotenv could not parse statement starting at line 6
```
**3.** With these first error message, I had to edit the ```.env``` file. The python file was ran again and was successful in connecting to MySQL, however a new error message was shown the the Flask application test environment:
```
sqlalchemy.exc.ObjectNotExecutableError: Not an executable object: 'SELECT * FROM patients'
```
<img width="600" alt="Screenshot 2023-10-06 at 6 02 55 PM" src="https://github.com/c-susan/flask_4_databases_mysql_vm/assets/123512714/915dd98c-5a00-4840-bbe3-97f57b08cb69">

**4.** To address the error message, I imported ```text``` from ```sqlalchemy``` and changed the queries by writing as a text object. For example: 
            ```
            query1 = text('SELECT * FROM patients')
            ```
**5**. The .py file was successfully ran, however, the tables from the database is not showing up on the Flask app: 

<img width="350" alt="Screenshot 2023-10-06 at 10 59 59 PM" src="https://github.com/c-susan/flask_4_databases_mysql_vm/assets/123512714/3c55334f-1abf-44e3-ae97-b7dc3e76baa3">

**6.** I edited the index.html file by changing the variable name to the correct variable and used ```<table>``` to put the database data in table format on the Flask application. 
