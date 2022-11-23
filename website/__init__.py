from flask import Flask, render_template,redirect, url_for, request, flash, session
from passlib.hash import sha256_crypt
from flask_mysqldb import MySQL
from functools import wraps
from os import path
import re

#from flask_login import LoginManager, login_required, login_user
#import MySQLdb.cursors
#import bcrypt
#import mysql.connector
#from flask_sqlalchemy import SQLAlchemy
#rom warnings import catch_warnings


def create_app():
    app = Flask(__name__)
    app.config['SECRET_KEY'] = 'CSSE490'
    app.config['MYSQL_HOST'] = 'localhost'
    app.config['MYSQL_USER'] = 'root'
    app.config['MYSQL_PASSWORD'] = ''
    app.config['MYSQL_DB'] = 'TickKingProject'
 
    mysql = MySQL(app)

    #Using . for relative import since we are in a package
    from .views import views
    from .auth import auth

    #registering blueprints
    app.register_blueprint(views, url_prefix = "/")
    #app.register_blueprint(auth, url_prefix = "/")

    def login_required(f):
        @wraps(f)
        def wrap(*args, **kwargs):
            if 'loggedin' in session:
                return f(*args, **kwargs)
            else:
                flash("You need to login first")
                return redirect(url_for('login'))

        return wrap

    @app.route("/logout")
    @login_required
    def logout():
        session.clear()
        flash("You have been logged out", category='success')
        return redirect(url_for('login'))

    @app.route("/signup", methods=['GET', 'POST'])
    def signup():    

        if request.method == "POST":    
            ifirstname = request.form.get("ifirstname")
            ilastname = request.form.get("ilastname")
            iemail = request.form.get("iemail")
            iusername = request.form.get("iusername")
            ipassword = request.form.get("ipassword")
            iconfirmpassword = request.form.get("iconfirmpassword")

            cursor = mysql.connection.cursor()

            cursor.execute('SELECT * FROM Users WHERE Email = % s', (iemail, ))
            email_exists = cursor.fetchone()

            cursor.execute('SELECT * FROM Users WHERE UserName = % s', (iusername, ))
            iusername_exists = cursor.fetchone()

            if email_exists:
                flash('Email already in use', category='error')
                print("email exists")
            elif not re.match(r'[^@]+@[^@]+\.[^@]+', iemail):
                flash('Not a valid email', category='error')
                print("invalid email")
            elif iusername_exists:
                flash('username already in user', category='error')
                print("username exists")
            elif not re.match(r'[A-Za-z0-9]+', iusername):
                flash('username should only contain letters and numbers', category='error')
                print("invalid username")
            elif ipassword != iconfirmpassword:
                flash('Make sure passwords match', category='error')
                print("passwords dont match")
            else:
                
                ipassword = sha256_crypt.encrypt(ipassword)
                print('----------------------PASSWORD STORED-------------------------------------')
                print(ipassword)
                cursor.execute('INSERT INTO Users VALUES (NULL, % s, % s, % s, % s, % s, NULL)', (
                    iusername, 
                    iemail, 
                    ipassword, 
                    ifirstname, 
                    ilastname))

                mysql.connection.commit()
                flash('user created sucessfully')
                print('User created')
                return redirect(url_for('login'))

        return render_template("signup.html")

    @app.route("/login", methods=['GET', 'POST'])
    def login():
        if request.method == 'POST':
            username = request.form.get("username")
            password = request.form.get("password")

            cursor = mysql.connection.cursor()

            cursor.execute('SELECT * FROM Users WHERE UserName = % s', (username, ))
            account_info = cursor.fetchone() 

            print(account_info)           

            if account_info:
                
                cursor.execute('SELECT Passcode FROM Users WHERE UserName = % s', (username, ) )
                db_password = cursor.fetchone()                

                print(password)
                print(db_password[0])                

                #sha256_crypt.verify(str(password), str(db_password[0]))
                if sha256_crypt.verify(str(password), str(db_password[0])):
                    print('db_password == password')

                    session['loggedin'] = True
                    session['id'] = account_info[0]
                    session['username'] = account_info[4]
                    
                    flash('You are logged in!')
                    print('Loggin sucessful')
                    return redirect(url_for('dashboard'))

                else:
                    flash('Incorrect password', category='error')
                    print('Incorrect password')
            else:
                flash('username does not exist', category='error')
                print('Username does not exists')

        return render_template("login.html")
    
    @app.route('/dashboard', methods=['GET', 'POST'])
    @login_required
    def dashboard():
        try:
            user_id = session['id']
            username = session['username']
            return render_template("dashboard.html", username = session['username'])
        except:
            flash("Login required", category='error')
            return redirect(url_for('login'))
        
    @app.route('/mylibrary', methods=['GET', 'POST'])
    @login_required
    def myLibrary():
        try:
            user_id = session['id']
            username = session['username']
            #Query to fetch all user's decks
            #This is a test
            listTest = createList()
            return render_template("deckslibrary.html", 
                username = session['username'], 
                user_id = session['id'], 
                ToSendList = listTest)
        except:
            flash("Something went wrong!", category='error')
            return redirect(url_for('dashboard'))

    @app.route('/decks', methods=['GET', 'POST'])
    @login_required
    def decks():
        try:
            user_id = session['id']
            username = session['username']
            #query
            return render_template("decks.html", username = session['username'], user_id = session['id'])
        except:
            flash("Something went wrong!", category='error')
            return redirect(url_for('dashboard'))

    @app.route('/recoverpasswd', methods=['GET', 'POST'])
    def recoverpasswd():
        return render_template("recoverpasswd.html")
    
    return app
