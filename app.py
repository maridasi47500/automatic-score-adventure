from flask import Flask, render_template, request
from yourappdb import query_db, get_db
from flask import g

app = Flask(__name__)
def init_db():
    with app.app_context():
        db = get_db()
        with app.open_resource('schema.sql', mode='r') as f:
            db.cursor().executescript(f.read())
        db.commit()
init_db()

@app.teardown_appcontext
def close_connection(exception):
    db = getattr(g, '_database', None)
    if db is not None:
        db.close()

@app.route("/")
def hello_world():
    user = query_db('select * from contacts')
    the_username = "anonyme"
    one_user = query_db('select * from contacts where first_name = ?',
                [the_username], one=True)
    return render_template("hey.html", users=user, one_user=one_user, the_title="my title")
@app.route("/add_one_user", methods=["GET","POST"])
def add_one_user():

    if request.method == 'POST':

        the_username = "anonyme"
        one_user = query_db("insert into user (username,country_id,phone,email) values (:username,:country_id,:phone,:email)",request.form)
        user = query_db('select * from user')
        return render_template("userform.html", users=user, one_user=one_user, the_title="add new user")
    user = query_db('select * from user')
    one_user = query_db("select * from user limit 1", one=True)
    return render_template("userform.html", users=user, one_user=one_user, the_title="add new user")
@app.route("/add_one_score", methods=["GET","POST"])
def add_one_score():

    if request.method == 'POST':

        the_username = "anonyme"
        one_user = query_db("insert into score (title,description,content,city_id) values (:title,:description,:content,:city_id)",request.form)
        user = query_db('select * from score')
        return render_template("scoreform.html", scores=user, one_user=one_user, the_title="add new score")
    user = query_db('select * from score')
    one_user = query_db("select * from score limit 1", one=True)
    return render_template("scoreform.html", scores=user, one_user=one_user, the_title="add new score")

@app.route("/add_one_adventure", methods=["GET","POST"])
def add_one_adventure():

    if request.method == 'POST':

        the_username = "anonyme"
        one_user = query_db("insert into adventure (title,description) values (:title,:description)",request.form)
        user = query_db('select * from adventure')
        return render_template("adventureform.html", adventures=user, one_user=one_user, the_title="add new adventure")
    user = query_db('select * from adventure')
    one_user = query_db("select * from adventure limit 1", one=True)
    return render_template("adventureform.html", adventures=user, one_user=one_user, the_title="add new adventure")

@app.route("/add_one_adventurehasscores", methods=["GET","POST"])
def add_one_adventurehasscores():

    if request.method == 'POST':

        the_username = "anonyme"
        one_user = query_db("insert into adventurehasscores (adventure_id,score_id) values (:adventure_id,:score_id)",request.form)
        user = query_db('select * from adventurehasscores')
        return render_template("adventurehasscoresform.html", adventurehasscoress=user, one_user=one_user, the_title="add new adventurehasscores")
    user = query_db('select * from adventurehasscores')
    one_user = query_db("select * from adventurehasscores limit 1", one=True)
    return render_template("adventurehasscoresform.html", adventurehasscoress=user, one_user=one_user, the_title="add new adventurehasscores")

@app.route("/add_one_city", methods=["GET","POST"])
def add_one_city():

    if request.method == 'POST':

        the_username = "anonyme"
        one_user = query_db("insert into city (name) values (:name)",request.form)
        user = query_db('select * from city')
        return render_template("cityform.html", citys=user, one_user=one_user, the_title="add new city")
    user = query_db('select * from city')
    one_user = query_db("select * from city limit 1", one=True)
    return render_template("cityform.html", citys=user, one_user=one_user, the_title="add new city")

@app.route("/add_one_adventurehasusers", methods=["GET","POST"])
def add_one_adventurehasusers():

    if request.method == 'POST':

        the_username = "anonyme"
        one_user = query_db("insert into adventurehasusers (adventure_id,user_id) values (:adventure_id,:user_id)",request.form)
        user = query_db('select * from adventurehasusers')
        return render_template("adventurehasusersform.html", adventurehasuserss=user, one_user=one_user, the_title="add new adventurehasusers")
    user = query_db('select * from adventurehasusers')
    one_user = query_db("select * from adventurehasusers limit 1", one=True)
    return render_template("adventurehasusersform.html", adventurehasuserss=user, one_user=one_user, the_title="add new adventurehasusers")

