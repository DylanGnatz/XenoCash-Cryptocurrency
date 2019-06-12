# XenoBase CryptoCurrency Exchange 
## Installation Instructions

### 1. Import the XenoBase Database
Make sure you have installed MySQLWorkbench and the MySQL Community Server
Import the XenoBase.SQL dump file into your MySQLWorkbench by using the import tool
and creating a new schema entitled "XenoBase".

### 2. Prepare your Python Environment 
Download a Python IDE, preferably the Anaconda platform. (https://www.anaconda.com/)

You will need the following packages (pip installation scripts are provided below):

Flask 0.12.2:
pip install Flask==0.12.2

Requests 2.18.4:
pip install requests==2.18.4

MySQL Connector:
pip install mysql-connector

### 3. Open XenoBase.py 
Open the Spyder IDE from within the Anaconda-Navigator app, and in Spyder open the XenoCash.py file.

### 4. Update xenobase_mysql_connector()
Find the function xenobase_mysql_connector().
On line 27, update the mysql.connector.connect() function call with the login credentials for your MySQL connection. Save the file.

### 5. Download Postman
We will communicate with the blockchain and database via HTTP requests created in Postman. Download the Postman HTTP client (https://www.getpostman.com/)

### 6. Import Postman XenoBase Collections
Once Postman is up and running, click 'import' and select XenoBase.postman_collection.json.

### 7. Run the XenoCash blockchain
Open an IPython console in Spyder and run XenoCash_port5001.py to start the blockchain.
If you would like to run multiple nodes, run both  XenoCash_port5001.py and  XenoCash_port5002.py in separate iPython consoles. Make sure to run the connect_port5001 and connect_port5002 requests in Postman to allow the nodes to communicate across the blockchain. 

### 8. Communicate with the blockchain in Postman
Once the blockchain is running, you can submit requests from the XenoBase collection in Postman. Select a request from the collection and click 'send'. If the request accepts params, feel free to edit the values under the 'params' tab. Have fun with XenoCash!
