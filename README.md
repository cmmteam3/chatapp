# README


$ git config --global user.name "MyoHtet"

$ git config --global user.email myohtet@mm.cybermissions.co.jp

$ git init

$ git add 

$ git status

$ git commit -m "Initialize repository"

$ git push -u origin master



Heroku deploy

$ heroku --version

$ heroku login

$ heroku apps:create team3chatapp

$ heroku git:remote a team3chatapp

$ git push heroku master

$ heroku run rails db:migrate