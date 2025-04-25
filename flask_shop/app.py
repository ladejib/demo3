from flask import Flask, render_template, redirect, url_for, request, session, flash

app = Flask(__name__)
app.secret_key = 'your_secret_key'

# Dummy user and products
users = {'admin': 'password'}
products = [
    {'id': 1, 'name': 'Laptop', 'price': 1000},
    {'id': 2, 'name': 'Phone', 'price': 600},
    {'id': 3, 'name': 'Headphones', 'price': 150},
]

@app.route('/')
def index():
    return redirect(url_for('login'))

@app.route('/login', methods=['GET', 'POST'])
def login():
    if request.method == 'POST':
        user = request.form['username']
        pw = request.form['password']
        if users.get(user) == pw:
            session['user'] = user
            session['cart'] = []
            return redirect(url_for('product_list'))
        flash('Invalid credentials')
    return render_template('login.html')

@app.route('/logout')
def logout():
    session.clear()
    return redirect(url_for('login'))

# @app.route('/products')
# def products():
#     if 'user' not in session:
#         return redirect(url_for('login'))
#     return render_template('products.html', products=products)


@app.route('/products')
def product_list():
    if 'user' not in session:
        return redirect(url_for('login'))
    return render_template('products.html', products=products)


@app.route('/add_to_cart/<int:product_id>')
def add_to_cart(product_id):
    if 'user' not in session:
        return redirect(url_for('login'))
    product = next((p for p in products if p['id'] == product_id), None)
    if product:
        session['cart'].append(product)
    return redirect(url_for('cart'))

@app.route('/cart')
def cart():
    if 'user' not in session:
        return redirect(url_for('login'))
    return render_template('cart.html', cart=session.get('cart', []))

@app.route('/purchase')
def purchase():
    if 'user' not in session:
        return redirect(url_for('login'))
    total = sum(item['price'] for item in session.get('cart', []))
    session['cart'] = []
    return render_template('purchase.html', total=total)

if __name__ == '__main__':
    app.run(debug=True, host='0.0.0.0', port=5000)
