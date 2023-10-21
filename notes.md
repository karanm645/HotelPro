# Next up
## save changes and push up to github
## create a boolean value with open/closed room -- logic in model
## the logic should exist when rooms are created -- so room controller will have a method implemented in it 



## Rubucop prompts
- bundle exec rubocop
- bundle exec rubocop --format offenses
  - organize Rubocop’s output by running
- bundle exec rubocop -a
  - Automatically correcting offenses
- bundle exec rubocop --auto-gen-config 
  - this ignores existing violations


- Postgres cluster hotel-pro created
  - Username:    postgres
  - Password:    74UpWoBl94G8sNZ
  - Hostname:    hotel-pro.internal
  - Flycast:     fdaa:0:fd83:0:1::3
  - Proxy port:  5432
  - Postgres port:  5433
  - Connection string: postgres://postgres:74UpWoBl94G8sNZ@hotel-pro.flycast:5432

Save your credentials in a secure place -- you won't be able to see them again!

## fly.io prompts

https://medium.com/@NadyaShevtsova/fly-io-import-postgres-dump-b7c643ccb673

# Dashboard 
- on the left bar, there will be only guests arriving today
  - so create a model method that has the guests arriving only today in the Guest model
- underneath the guests arriving today, there will be a check in process where the guest will be checked in and put into a room which will reflect on the list of all rooms section with a conditional