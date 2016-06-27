from system.core.model import Model
import re

class Quote(Model):
    def __init__(self):
        super(Quote, self).__init__()

    def quotes_by_id(self, user_id):
        query="SELECT users.alias, quotes.author, quotes.id, quotes.content from users join quotes on users.id=quotes.users_id where users.id = :user_id"
        data={
            "user_id":user_id
        }
        quotes_id=self.db.query_db(query, data)
        return quotes_id
    
    def quotable_quotes(self, user_id):
        query="SELECT users.alias, quotes.author, quotes.content, quotes.users_id from users join quotes on users.id=quotes.users_id"
        data={
            "user_id":user_id
        }
        quotable=self.db.query_db(query, data)
        return quotable
    
    def add_favorite(self, user_id, quotes_id):
        query="INSERT INTO favorites (created_at, updated_at, users_id, quotes_id) VALUES (NOW(), NOW(), :users_id, :quotes_id)"
        print user_id
        print quotes_id
        data={
            "users_id": user_id, 
            "quotes_id": quotes_id
        }
        add_a_fav=self.db.query_db(query, data)
        return add_a_fav

    def show_favorites(self, user_id):
        print user_id
        query="SELECT favorites.id, favorites.users_id, quotes.content, quotes.author from quotes join favorites on quotes.id=favorites.id where favorites.users_id=:users_id"
        data={
            'users_id': user_id
        }
        show_fav = self.db.query_db(query, data)
        return show_fav

    def show_quotes(self, id):
        print id
        query="SELECT COUNT(id) from quotes where users_id= :users_id"
        data={
            'users_id':id
        }
        show=self.db.query_db(query, data)
        print 'Donn',show
        return show

    def add_quotes(self, info, user_id):
        add_errors=[]
        if not info['author']:
            add_errors.append("Author cannot be blank")
        elif len(info['author'])<3:
            add_errors.append("Author must be longer than 3 characters")
        if not info['content']:
            add_errors.append("Content cannot be blank")
        elif len(info['content'])<10:
            add_errors.append("Content must be longer than 10 characters")
        if add_errors:
            return {'status': False, "add_errors": add_errors}
        else: 
            query="INSERT INTO quotes (author, content, created_by, updated_by, users_id) VALUES (:author, :content, 'NOW()', 'NOW()', :users_id)"
            data={
                "users_id": user_id, 
                "author":info['author'], 
                "content":info['content']
            }
            add=self.db.query_db(query, data)
            print add
            print "THIS IS THE ADD QUOTES METHOD"
            return {'status': True, "add":add}

    def user_by_id(self, id):
        query="SELECT * FROM users WHERE id=:id"
        data={'id': id}
        return self.db.query_db(query, data)

    def login(self, info):
        errors=[]
        query="SELECT * FROM users WHERE email=:email"
        data={
            'email':info['email'], 
            'password': info['password']
        }
        user_login=self.db.query_db(query,data)
        print user_login
        if user_login and self.bcrypt.check_password_hash(user_login[0]['password'], info['password']):
            return {'status': True, "user_login":user_login}
        else:
            errors.append('Invalid user or password!')
            return {'status': False, "errors": errors} 
        #check PW and if validates, return success w/ user data 
        # Go back to Controller

    def register(self, info):
        EMAIL_REGEX = re.compile(r'^[a-za-z0-9\.\+_-]+@[a-za-z0-9\._-]+\.[a-za-z]*$')
        errors=[]
        if not info['name']:
            errors.append('Name cannot be blank')
        elif len(info['name'])<2:
            errors.append('Name must be at least 2 characters long')
        if not info['alias']:
            errors.append('Alias cannot be blank')
        elif len(info['alias'])<2:
            errors.append('Alias must be at least 2 characters long')
        if not info['email']:
            errors.append('Email cannot be blank')
        elif not EMAIL_REGEX.match(info['email']):
            errors.append('Email format must be valid')
        if not info['password']:
            errors.append('Password cannot be blank')
        elif len(info['password'])<8:
            errors.append('Password must be at least 8 characters long')
        elif info['password'] != info['pconfirm']:
            errors.append('Password and confirmation must match!')
        # if not info['bday']:
        #     errors.append('You must be older than 16 to join!')
        if errors:
            return {'status': False, "errors": errors}
        else:
            encrypt = self.bcrypt.generate_password_hash(info['password'])
            query = "INSERT INTO users (name, alias, email, password, bday, created_at, updated_at) VALUES (:name, :alias, :email, :password, :bday, NOW(), NOW())"
            data={
                "name":info['name'], 
                "alias":info['alias'], 
                "email":info['email'], 
                "password":encrypt, 
                "bday": info['bday']
                }
            #get_user_query="SELECT * FROM users ORDER BY id DESC LIMIT 1"
            user_id = self.db.query_db(query, data)
            return { "status": True, "user_id": user_id}