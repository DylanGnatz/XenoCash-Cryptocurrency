#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Sat Dec  1 17:41:43 2018

@author: dylangnatz
"""

# To be installed:
# Flask==0.12.2: pip install Flask==0.12.2
# Postman HTTP Client: https://www.getpostman.com/
# requests==2.18.4: pip install requests==2.18.4




import datetime
import mysql.connector
import hashlib
import json
from flask import Flask, jsonify, request
import requests
from uuid import uuid4
from urllib.parse import urlparse

#Connects to XenoBase MySQL database

def xenobase_mysql_connector():
    cnx = mysql.connector.connect(user='root', password='', host='127.0.0.1', database='XenoBase')
    return cnx


#Part 1 Building a blockchain

class Blockchain:
    
    def __init__(self):
        self.chain = []
        self.transactions = []
        self.mined_trans = []
        self.create_block(proof = 1, prev_hash = '0')
        self.nodes = set()
        
    def create_block(self, proof, prev_hash):
        block = {'index': len(self.chain) + 1,
                 'timestamp': str(datetime.datetime.now()),
                 'proof': proof,
                 'prev_hash': prev_hash,
                 'transactions': self.transactions
                }
        self.mined_trans = self.transactions
        self.transactions = []
        self.chain.append(block)
        return block
    
    def get_prev_block(self):
        return self.chain[-1]
    
    def proof_of_work(self, prev_proof):
        new_proof = 1
        check_proof = False
        while check_proof is False:
            hash_op = hashlib.sha256(str(new_proof**2 - prev_proof**2).encode()).hexdigest()
            if hash_op[:4] == '0000':
                check_proof = True
            else:
                new_proof += 1
        return new_proof
    
    def hash(self, block):
        encoded_block = json.dumps(block, sort_keys = True).encode()
        return hashlib.sha256(encoded_block).hexdigest()
    
    def is_chain_valid(self, chain):
        prev_block = chain[0]
        block_index = 1
        while block_index < len(chain):
            block = chain[block_index]
            if block['prev_hash'] != self.hash(prev_block):
                return False
            prev_proof = prev_block['proof']
            proof = block['proof']
            hash_op = hashlib.sha256(str(proof**2 - prev_proof**2).encode()).hexdigest()
            if hash_op[:4] != '0000':
                return False
            prev_block = block
            block_index += 1
        return True
    
    def add_transaction(self, trans_ID, sender, receiver, XENO, USD):
        self.transactions.append({ 'trans_ID': trans_ID,
                                 'sender': sender,
                                 'receiver': receiver,
                                 'XENO': XENO,
                                 'USD': USD})
        prev_block = self.get_prev_block()
        return prev_block['index'] + 1
    
    def add_node(self, address):
        parsed_url = urlparse(address)
        self.nodes.add(parsed_url.netloc)
    
    def replace_chain(self):
        network = self.nodes
        longest_chain = None
        max_length = len(self.chain)
        for node in network:
            response = requests.get(f'http://{node}/get_chain')
            if response.status_code == 200:
                length = response.json()['length']
                chain = response.json()['chain']
                if length > max_length and self.is_chain_valid(chain):
                    max_length = length
                    longest_chain = chain
        if longest_chain:
            self.chain = longest_chain
            return True
        return False
    

            

#Part 2 mining blockchain
    
#Create web app with flask 
app = Flask(__name__)

#Creating an address for the node on Port 5000
node_address = str(uuid4()).replace('-', '')

#Create blockchain
blockchain = Blockchain()




#SQL queries:
        
#INSERT -- Adds a new transaction -- returns the transaction ID
def insert_transaction(buy_Order_ID, sell_Order_ID, date):
    cnx = xenobase_mysql_connector()
    cursor = cnx.cursor(buffered = True)
    
    data_transaction = (buy_Order_ID, sell_Order_ID, date, 0)
    
    add_transaction = ("INSERT INTO Transactions "
                   "(BuyOrders_Buy_Order_ID, SellOrders_Sell_Order_ID, TransactionDate, Was_Mined) "
                   "VALUES (%s, %s, %s, %s)")
    
    
   
    
    # Insert new transaction
    cursor.execute(add_transaction, data_transaction)
    trans_ID = cursor.lastrowid
    
    cnx.commit()
    cursor.close()
    cnx.close()
    return trans_ID

#UPDATE -- Updates status of  transactions to mined once a block is added to the chain.
def update_mined(trans_ID):
    cnx = xenobase_mysql_connector()
    cursor = cnx.cursor(buffered = True)
    update_query = ("UPDATE Transactions SET Was_Mined = 1 WHERE Transaction_ID = {}".format(trans_ID))
    cursor.execute(update_query)
    cnx.commit()
    cursor.close()
    cnx.close()

#SELECT -- Returns the wallet associated with a sell order.
def get_wallet_from_sell_order(sell_ID):
    cnx = xenobase_mysql_connector()
    cursor = cnx.cursor(buffered = True)
    query = ("SELECT Wallet_ID FROM SellOrders WHERE Sell_Order_ID = {};".format(sell_ID))
    cursor.execute(query)
    wallet = cursor.fetchone()[0]
    cursor.close()
    cnx.close()
    return wallet

#SELECT -- Returns the wallet associated with a buy order.
def get_wallet_from_buy_order(buy_ID):
    cnx = xenobase_mysql_connector()
    cursor = cnx.cursor(buffered = True)
    query = ("SELECT Wallet_ID FROM BuyOrders WHERE Buy_Order_ID = {};".format(buy_ID))
    cursor.execute(query)
    wallet = cursor.fetchone()[0]
    cursor.close()
    cnx.close()
    return wallet

#SELECT -- Returns the XENO and USD amounts associated with a sell order.
def get_trans_amount(sell_ID):
    cnx = xenobase_mysql_connector()
    cursor = cnx.cursor(buffered = True)
    query = ("SELECT Amount, Price FROM SellOrders WHERE Sell_Order_ID = {};".format(sell_ID))
    cursor.execute(query)
    amounts = cursor.fetchall()
    cursor.close()
    cnx.close()
    return amounts

#SELECT -- Returns all unfulfilled buy orders where the XENO/USD price is under a certain amount.
def get_sell_order_by_price(price):
    cnx = xenobase_mysql_connector()
    cursor = cnx.cursor(buffered = True)
    query = ("SELECT Sell_Order_ID, Amount, Price FROM XenoBase.SellOrders WHERE (Price/Amount) < {} && Was_Fulfilled = 0;".format(price))
    cursor.execute(query)
    result = cursor.fetchall()

    clean_result = []
    for row in result:
        result_row = []
        result_row.append("Sell_Order_ID: " + str(row[0]))
        result_row.append("Amount: " + str(row[1]))
        result_row.append("Price: " + str(row[2]))
        clean_result.append(result_row)

    cursor.close()
    cnx.close()
    return clean_result

    
#SELECT -- Returns the average price per XENO of all unfulfilled sell orders.
def get_avg_price():
    cnx = xenobase_mysql_connector()
    cursor = cnx.cursor(buffered = True)
    query = ("SELECT AVG(Max_Price / Amount) AS Avg_Buy_Price FROM XenoBase.BuyOrders WHERE Was_Fulfilled = 0;")
    cursor.execute(query)
    result = cursor.fetchall()
    cursor.close()
    cnx.close()
    return "$" + str(round(result[0][0], 2))

#SELECT -- Returns all unmined transactions
def get_unmined_transactions():
    cnx = xenobase_mysql_connector()
    cursor = cnx.cursor(buffered = True)
    query = ("SELECT Transaction_ID, BuyOrders_Buy_Order_ID, "
          +  "SellOrders_Sell_Order_ID, TransactionDate FROM XenoBase.Transactions WHERE Was_Mined = 0;")

    cursor.execute(query)
    result = cursor.fetchall()

    clean_result = []
    for row in result:
        result_row = []
        result_row.append("Transaction_ID: " + str(row[0]))
        result_row.append("Buy_Order_ID: " + str(row[1]))
        result_row.append("Sell_Order_ID: " + str(row[2]))
        result_row.append("Transaction_Date: " + str(row[3]))
        clean_result.append(result_row)

    cursor.close()
    cnx.close()
    return clean_result

#SELECT -- Returns a list of buyers based upon the number of transactions they have participated in. 
def get_buyer_count():
    cnx = xenobase_mysql_connector()
    cursor = cnx.cursor(buffered = True)
    query = ("select User_ID, First_Name, Last_Name, count(*) as Total_Num_of_Buyer_Transactions " + 
         "from XenoBase.Transactions, XenoBase.BuyOrders, XenoBase.Wallets, XenoBase.Users " +
         "where XenoBase.Transactions.BuyOrders_Buy_Order_ID = XenoBase.BuyOrders.Buy_Order_ID and " + 
         "XenoBase.BuyOrders.Wallet_ID = XenoBase.Wallets.Wallet_ID and XenoBase.Wallets.Users_User_ID = XenoBase.Users.User_ID " + 
         "group by Users.User_ID " +
         "order by Total_Num_of_Buyer_Transactions desc")

    cursor.execute(query)
    result = cursor.fetchall()

    clean_result = []
    for row in result:
        result_row = []
        result_row.append("User_ID :" + str(row[0]))
        result_row.append("First_Name :" + str(row[1]))
        result_row.append("Last_Name: " + str(row[2]))
        result_row.append("Total_Num_of_Buyer_Transactions: " + str(row[3]))
        clean_result.append(result_row)

    cursor.close()
    cnx.close()
    return clean_result


#Flask app methods

#Mine new block on the blockchain
@app.route('/mine_block', methods = ['GET'])
def mine_block():
    prev_block = blockchain.get_prev_block()
    prev_proof = prev_block['proof']
    proof = blockchain.proof_of_work(prev_proof)
    prev_hash = blockchain.hash(prev_block)
   # blockchain.add_transaction(sender = node_address, receiver = '0', XENO = 10, USD = 0, )
    block = blockchain.create_block(proof, prev_hash)
    print("hello world!")
    print(blockchain.mined_trans)
    for transaction in blockchain.mined_trans:
        print(transaction['trans_ID'])
        update_mined(transaction['trans_ID'])
    response = {'message': 'Congratulations, you have mined a block!', 
                'transactions': block['transactions'],
                'index': block['index'],
                'timestamp': block['timestamp'],
                'proof': block['proof'],
                'prev_hash': block['prev_hash']}
    return jsonify(response), 200

#Getting the full Blockchain
@app.route('/get_chain', methods = ['GET'])
def get_chain():
    response = {'chain': blockchain.chain,
                'length': len(blockchain.chain)}
    return jsonify(response), 200

@app.route('/get_price', methods = ['GET'])
def get_price():
    response = {'price' : get_avg_price()}
    return jsonify(response), 200

@app.route('/count_buyers', methods = ['GET'])
def count_buyers():
    response = get_buyer_count()
    return jsonify(response), 200



@app.route('/get_unmined', methods = ['GET'])
def get_unmined():
    response = get_unmined_transactions()
    return jsonify(response), 200

@app.route('/get_sell_order_price', methods = ['GET'])
def get_sell_order_price():
    max_price = request.args.get('max_price')
    response = get_sell_order_by_price(max_price)
    return jsonify(response), 200


@app.route('/is_valid', methods = ['GET'])
def is_valid():
    is_valid = blockchain.is_chain_valid(blockchain.chain)
    if is_valid:
        response = {'message': 'The blockchain is valid!'}
    else:
        response = {'message': 'The blockchain is not valid!'}
    return jsonify(response), 200

#Adding a new transaction

@app.route('/add_transaction', methods = ['POST'])
def add_transaction():
    buy_ID = request.args.get('buy_ID')
    sell_ID = request.args.get('sell_ID')
    amounts = get_trans_amount(sell_ID)
    XENO = amounts[0][0]
    USD = (-1 * amounts[0][1])
    
    now = datetime.datetime.now()
    date = now.strftime("%Y-%m-%d")
    
    trans_ID = insert_transaction(buy_ID, sell_ID, date)

    sender = get_wallet_from_sell_order(sell_ID)
    receiver = get_wallet_from_buy_order(buy_ID)
    
    index = blockchain.add_transaction(trans_ID, sender, receiver, XENO, USD)
    response = {'message': f'Transaction will be added to Block {index}'}
    return jsonify(response), 201
    

#Part 3 decentralization 
    
#Connecting new nodes
@app.route('/connect_node', methods = ['POST'])
def connect_node():
    json = request.get_json()
    nodes = json.get('nodes')
    if nodes is None:
        return "No nodes to add", 400
    for node in nodes:
        blockchain.add_node(node)
    response = {'message': 'Nodes are now connected. The XenoCash blockchain now contains the following nodes:',
                'all_nodes': list(blockchain.nodes)}
    return jsonify(response), 201


#Replaces chain with longest chain
    
@app.route('/replace_chain', methods = ['GET'])
def replace_chain():
    is_replaced = blockchain.replace_chain()
    if is_replaced:
        response = {'message': 'The chain has been replaced by the longest chain:',
                    'new_chain': blockchain.chain }
    else:
        response = {'message': 'The chain is the largest:',
                    'chain': blockchain.chain}
    return jsonify(response), 200



        

#Running the app

app.run(host = '0.0.0.0', port = 5002)  

    
            
                
            
        
        
    
        
