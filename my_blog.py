from flask import Flask,redirect,url_for,render_template,request
from datetime import datetime
from flask_sqlalchemy import SQLAlchemy
import json
import math

with open('config.json','r') as c:
    parameter = json.load(c)["parameter"]
local_server = True
app = Flask(__name__)


if(local_server):
    app.config['SQLALCHEMY_DATABASE_URI'] = parameter["local_uri"]
else:
    app.config['SQLALCHEMY_DATABASE_URI'] = parameter["prod_uri"]

db = SQLAlchemy(app)

class Contact(db.Model):
    sno = db.Column(db.Integer,primary_key=True)
    name=db.Column(db.String(50),nullable=False)
    email = db.Column(db.String(50),nullable=False)
    phone = db.Column(db.String(13),nullable=False)
    msg = db.Column(db.String(250),nullable=False)
    date = db.Column(db.String(12),nullable=True)

class Posts(db.Model):
    sno = db.Column(db.Integer,primary_key=True)
    title=db.Column(db.String(50),nullable=False)
    subtitle = db.Column(db.String(50),nullable=False)
    slug = db.Column(db.String(21),nullable=False)
    content = db.Column(db.String(500),nullable=False)
    img_file = db.Column(db.String(100),nullable=True )
    date = db.Column(db.String(12),nullable=True)


@app.route("/")
def home():
    posts = Posts.query.filter_by().all() #[0:parameter['post_num']] we have used to filter how many post we want on home page
    last = math.ceil(len(posts)/int(parameter['post_num']))
    #logic to jump between pages
    #if we are on page one(1) the we go to next page it is Paage1+1
    #if we are on last page and we want to jump to second last page that is Page(last)-1
    #if we are on any page between 1st and last page we have to create two functions Middle Page + 1 for next and Middle Page - 1  for previous one
    #page_num is our page that is 1st or last or middle one
    page_num = (request.args.get('page_num'))
    if(not str(page_num).isnumeric()):
        page_num = 1
    page_num = int(page_num)
    posts = posts[(page_num-1)*int(parameter['post_num']) : (page_num-1)*int(parameter['post_num'])+int(parameter['post_num'])] #page_num-1bcz we want to multiply with zero that is initial page
    '''else:
        page_num = request.args.get('page_num')'''
    if (page_num == 1):
        previous = "#"
        next = "/?page_num=" + str(page_num+1)
    elif (page_num == last):
        previous = "/?page_num=" + str(page_num - 1)
        next = "#"
    else:
        previous = "/?page_num=" + str(page_num - 1)
        next = "/?page_num=" + str(page_num + 1)

    return render_template("home.html",parameter=parameter,posts=posts, previous=previous, next=next)
@app.route("/about")
def about():
    return render_template("about.html",parameter=parameter)

@app.route("/post/<string:post_slug>",methods=["GET"])
def route_post(post_slug):
    post = Posts.query.filter_by(slug=post_slug).first()
    return render_template("post.html",parameter=parameter,post=post)


@app.route("/contact",methods=["GET","POST"])
def contact():
    if request.method=="POST":
        name1 = request.form.get('name')
        email1 = request.form.get('email')
        phone1 = request.form.get('phone')
        message = request.form.get('message')
        entry = Contact(name=name1, email=email1, phone=phone1, msg=message, date=datetime.now())
        db.session.add(entry)
        db.session.commit()
    return render_template("contact.html",parameter=parameter)
#remaining changes in html file as per json and post
if __name__ == '__main__':
    app.run(debug=True)