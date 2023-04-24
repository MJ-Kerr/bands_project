from flask_app import app
from flask import render_template, request, redirect, session, flash
from flask_app.models.users_models import User
from flask_app.models.bands_models import Band


# ===============create page==============
@app.route("/bands/new")
def new_band():
    logged_in_user = User.get_user(session["user_id"])
    return render_template("new_band.html", logged_in_user=logged_in_user)


# ===============create method==============
@app.route("/bands/create", methods=["POST"])
def create_band():
    if not Band.validate(request.form):
        return redirect("/bands/new")

    Band.create_band(request.form)
    return redirect("/dash")


# ============= Get one band =============
@app.route("/bands/<int:id>")
def get_band(id):
    band = Band.get_band(id)
    return render_template("band_card.html", band=band)


# ============= Update band Render=============
@app.route("/update/<int:id>")
def update_band(id):
    band = Band.get_band(id)
    return render_template("update_band.html", band=band)


# ============= Update band =============
@app.route("/bands/update", methods=["POST"])
def update_bands():
    if not Band.validate(request.form):
        return redirect(f"/update/{request.form['id']}")
    Band.update(request.form)
    return redirect("/dash")


# ============= Delete band =============
@app.route("/bands/delete/<int:id>", methods=["POST"])
def delete_band(id):
    Band.delete({'band_id': id})
    return redirect("/dash")
