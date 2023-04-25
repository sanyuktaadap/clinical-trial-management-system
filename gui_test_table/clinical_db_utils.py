import pyodbc

def connect_db(db_name='Final'):
    connection = pyodbc.connect(
        "Driver={ODBC Driver 17 for SQL Server};"
        "Server=Sanyukta;"
        f"Database={db_name};"
        "Trusted_Connection=yes;")
    
    return connection

def get_tests(connection, test_id=None):
    
    query = 'SELECT * FROM Test'
    
    if test_id is not None:
        query += f' WHERE TestId = {test_id}'
    
    cursor = connection.cursor()
    cursor.execute(query)
    
    results = []
    
    for row in cursor:
        results.append(row)
    
    return results    

def add_test(connection, id, name, threshold):
    
    query = f"INSERT INTO Test VALUES ('{id}','{name}','{threshold}');"
    
    cursor = connection.cursor()
    cursor.execute(query)
    
    connection.commit()
    
    print(f'Test - {id} added successfully!')
    
    
def update_test(connection, id, name, threshold):
    
    query = 'UPDATE Test ' + \
        f'SET Name = \'{name}\', Threshold = \'{threshold}\' ' + \
        f'WHERE TestId = \'{id}\''
        
    cursor = connection.cursor()
    cursor.execute(query)
    
    connection.commit()
    
    print(f'Test - {id} edited successfully!')
       

def delete_test(connection, id):
    
    query = f'DELETE FROM Test WHERE TestId = {id};'
        
    cursor = connection.cursor()
    cursor.execute(query)
    
    connection.commit()
    
    print(f'Test - {id} deleted successfully!')
    

    
    