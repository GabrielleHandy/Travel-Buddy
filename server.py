import os
import requests
from flask import Flask, render_template, request, redirect
from werkzeug.utils import secure_filename
from PIL import Image
basedir = os.path.abspath(os.path.dirname(__file__))


UPLOAD_FOLDER = os.getcwd() + '/app/static/'

app = Flask(__name__)
app.secret_key = 'erwjrkmfw]r77\544rew'
app.config['UPLOAD_FOLDER'] = UPLOAD_FOLDER
OCR_API = os.environ['OCR_KEY']

@app.route('/')
def homepage():
    """Show homepage."""

    return render_template('homepage.html')


@app.route('/recieve_pic', methods=["POST","GET"])
def show_afterparty_form():

    if request.form.get('submit') == 'submit':
        f = request.files['image']
        print(f)
        filename = secure_filename(f.filename)
        print(filename)
        f.save(os.path.join(app.config['UPLOAD_FOLDER'], filename))
        print(app.config['UPLOAD_FOLDER'])
    # print(image)
    # url = 'https://api.ocr.space/parse/imageurl'
    # payload = {'apikey': OCR_API}
    # payload['file'] = image

    
    # res = requests.get(url, params = payload)
    
    
    # - Use form data from the user to populate any search parameters
    #
    # - Make sure to save the JSON data from the response to the `data`
    #   variable so that it can display on the page. This is useful for
    #   debugging purposes!
    #
    # - Replace the empty list in `events` with the list of events from your
    #   search results

    # data = res
    # print(data)

    return redirect('/')

if __name__ == '__main__':
    app.debug = True
    app.run(host='0.0.0.0')