from system.core.router import routes
routes['default_controller'] = 'Quotes'
routes['POST']['/login']="Quotes#login"
routes['POST']['/register']="Quotes#register"
routes['GET']['/quotes']="Quotes#quotes"
routes['POST']['/add_quote']="Quotes#add_quote"
routes['POST']['/add_fav']="Quotes#add_fav"
routes['GET']['/users/<id>']="Quotes#users"
# routes['POST']['users']
routes['GET']['/logout']='Quotes#logout'