from flask import *
from flask_mysqldb import MySQL
app = Flask(__name__)
app.secret_key = 'A0Zr98j/3yX R~XHH!jmN]LWX/,?RT'

#MySQL configurations
app.config['MYSQL_USER'] = 'root'
app.config['MYSQL_DB'] = 'project_e_shop'
app.config['MYSQL_HOST'] = 'localhost'
mysql = MySQL(app)

def check_password(username,password):
    cursor = mysql.connection.cursor()
    cursor.execute("SELECT pword FROM user where uname = '%s'" %request.form['username'])
    rv = cursor.fetchall()
    if len(rv) == 1:
        if rv[0][0] == request.form['password']:
            return True

@app.route('/', methods=['GET', 'POST'])         #Login/Home
def login():
    message = ''
    if request.method == 'POST':
        session['uname'] = request.form['username']
        
        if check_password(request.form['username'],request.form['password']):
            session['logged_in'] = True
            return redirect(url_for('loggedIn'))
    return render_template('homepage.html', message=message)

@app.route('/loggedIn', methods=['GET', 'POST'])
def loggedIn():
    if not session.get('logged_in'):
        return redirect(url_for('login'))
    return render_template('logged_in.html')

if __name__ == "__main__":
    app.run(debug=True)