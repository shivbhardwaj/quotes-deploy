from system.core.controller import *

class Quotes(Controller):
    def __init__(self, action):
        super(Quotes, self).__init__(action)

        self.load_model('Quote')
        self.db = self._app.db
   
    def index(self):
        return self.load_view('index.html')

    def register(self):
        create_status=self.models['Quote'].register(request.form)
        if create_status['status']:
            session['user_id']=create_status['user_id']
            return redirect('/quotes')
        else: 
            for message in create_status['errors']:
                flash(message, 'regis_errors')
            return redirect('/')
    
    def login(self):
        #whatever we set equal is what is returned
        users=self.models['Quote'].login(request.form)
        session['user_id']=users['user_login'][0]['id']
        return redirect('/quotes')

    def quotes(self):
        user=self.models['Quote'].user_by_id(session['user_id'])
        quotable=self.models['Quote'].quotable_quotes(session['user_id'])
        show_favs=self.models['Quote'].show_favorites(session['user_id'])
        return self.load_view('quotes.html', user=user[0], quotable=quotable, show_favs=show_favs)

    def users(self, id):
        user=self.models['Quote'].user_by_id(id)
        quotable=self.models['Quote'].quotes_by_id(id)
        quote_show=self.models['Quote'].show_quotes(id)
        session['quotes_id']=quotable[0]['id']
        return self.load_view('users.html', user=user[0], quotable=quotable, quote_show=quote_show)

    def add_quote(self):
        add=self.models['Quote'].add_quotes(request.form, session['user_id'])
        if add['status']:
            return redirect('/quotes')
        else:
            for message in add['add_errors']:
                flash(message, 'regis_errors')
                return redirect('/quotes')

    def add_fav(self):
        print "THIS IS THE ID IN add_fav METHOD"
        print "THIS IS THE ID IN add_fav METHOD"
        print "THIS IS THE ID IN add_fav METHOD"
        print "THIS IS THE ID IN add_fav METHOD"
        print "THIS IS THE ID IN add_fav METHOD"
        favorites=self.models['Quote'].add_favorite(session['user_id'], session['quotes_id'])
        #show_favs=self.models['Quote'].show_favorites(session['user_id'])
        print favorites
        #print show_favs
        print "this is favs"
        print "this is favs"
        print "this is favs"
        print "this is favs"
        print "this is favs"
        print "this is favs"
        #favorites=self.models['Quote'].add_favorite(session['quotes_id'], session['user_id'])
        return redirect('/quotes')

    def logout(self):
        session.pop('user_id')
        return redirect('/')
