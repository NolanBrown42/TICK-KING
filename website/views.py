from flask import Blueprint, render_template
from flask_mysqldb import MySQL
import MySQLdb.cursors
#from . import mysql

views = Blueprint("views", __name__)

@views.route("/")
@views.route("/welcomepage")
def welcomePage():
    return render_template("WelcomePage.html")
