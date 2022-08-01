# My Basecamp

[My Basecamp Demo](http://azizcamp.herokuapp.com/)

## Install

### Clone the repository

```shell
git clone https://github.com/azizdevfull/AzizCamp.git
cd Azizcamp
```

### Check your Ruby version

```shell
ruby -v
```

The ouput should start with something like `ruby 3.1.2`

If not, install the right ruby version using [rbenv](https://github.com/rbenv/rbenv) (it could take a while):

```shell
rbenv install 3.1.2
```

### Install dependencies

Using [Bundler](https://github.com/bundler/bundler):

```shell
bundle
```

### Initialize the database

```shell
rails db:migrate
```

## Server

```shell
rails s
```
