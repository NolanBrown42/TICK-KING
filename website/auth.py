from hashlib import sha256
from flask import Blueprint, render_template,redirect, url_for, request, flash
from flask_mysqldb import MySQL
import MySQLdb.cursors
import mysql.connector
#from . import mysql
import re
from werkzeug.security import generate_password_hash, check_password_hash

auth = Blueprint("auth", __name__)


@auth.route("/recoverpasswd", methods=['GET', 'POST'])
def recoverPasswd():
    return "Recover password page"

@auth.route("/logout")
def logout():
    return "logout"
