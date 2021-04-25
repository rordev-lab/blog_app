# BLOG APP

Simple demo rails blog app. Uses devise gem for authentication and pundit gem for authorization. It used ckeditor for writing html based blog post.

1. It allows user to create blog post.
2. Blogger can update and delete their posts.
3. Blogger can add comments on different posts but can oly update, destroy their comment.

Blog app consist of an admin panel. Admin can perform CURD operations on any post.

<b>Stack</b>:

* Ruby version: 3.0.0

* Rails version: 6.1.3

* Database : Postgres Sql

* Heroku URL : https://venuerific-blog-app.herokuapp.com/

## Rails Setup
    git clone https://github.com/rordev-lab/blog_app
    cd blog_app
    # edit config/database.yml with the desired database endpoint
    bundle
    rails db:create db:migrate db:seed
    rails server # start server

Now you can should be able to go to the url endpoints to see the demo page.

* http://localhost:3000
* http://localhost:3000/admin/dashboard # admin dashboard
* http://localhost:3000/posts # demo CRUD with post
* http://localhost:3000/admin/posts # demo CRUD with post (Admin)


To deploy this Rails app to heroku.

    cd blog_app
    heroku login (login via heroku cli)
    heroku create (created heroku app)
    git push heroku master # deploys to heroku
    heroku run rails db:migrate
    heroku run rails db:seed

## Basic logins

    First Blogger login : first_blogger@blogapp.com / password
    Sec Blogger login   : sec_blogger@blogapp.com / password
    Admin login         : admin@blogapp.com / password
