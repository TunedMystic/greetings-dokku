
### Run Server

```python
python manage.py runserver 0.0.0.0:7000
```


### Seed the database

```shell
python manage.py shell
```

```python
Greeting.objects.bulk_create([
    Greeting(text='Hello'),
    Greeting(text='Bonjour'),
    Greeting(text='Hola'),
    Greeting(text='Zdravstvuyte'),
    Greeting(text='Nǐn hǎo'),
    Greeting(text='Salve'),
    Greeting(text='Konnichiwa'),
    Greeting(text='Guten Tag'),
    Greeting(text='Olá'),
    Greeting(text='Anyoung haseyo'),
])
```


### Build Image
```shell
docker build -t greetings .
```


### Run Image
```shell
docker run -it --name greetings -p 7000:7000 greetings
```
