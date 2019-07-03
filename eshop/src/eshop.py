from flask import *
from flask_mysqldb import MySQL
from base64 import *
app = Flask(__name__)
app.secret_key = 'A0Zr98j/3yX R~XHH!jmN]LWX/,?RT'

#MySQL configurations
app.config['MYSQL_USER'] = 'root'
app.config['MYSQL_DB'] = 'project_e_shop'
app.config['MYSQL_HOST'] = 'localhost'
mysql = MySQL(app)

def check_password(username,password):                                          #checks password
    cursor = mysql.connection.cursor()
    cursor.execute("SELECT pword FROM user where uname = '%s'" %request.form['username'])
    rv = cursor.fetchall()
    if len(rv) == 1:
        if rv[0][0] == request.form['password']:
            return True
        
def product_list():
    cursor = mysql.connection.cursor()
    cursor.execute("SELECT picture, name, price, stock FROM products")
    rv = cursor.fetchall()
    #rv[0] = b64encode(rv[0])
    return rv
@app.route('/', methods=['GET', 'POST'])                                        #Login/Home
def login():
    message = ''
    if request.method == 'POST':
        session['uname'] = request.form['username']
        
        if check_password(request.form['username'],request.form['password']):
            session['logged_in'] = True
            return redirect(url_for('loggedIn'))
    return render_template('homepage.html', message=message, rv = product_list())

@app.route('/loggedIn', methods=['GET', 'POST'])
def loggedIn():
    if not session.get('logged_in'):
        return redirect(url_for('login'))
    return render_template('logged_in.html', rv = product_list())

@app.route('/shopping_cart', methods=['GET', 'POST'])
def shopping_cart():
    return render_template('shopping_cart.html')

if __name__ == "__main__":
    app.run(debug=True)