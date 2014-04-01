2014-04-01
----------

Add following test cases for `app/templates/lib/settings.coffee`:
```
$ coffee app.coffee 
{ env: 'development' }
$ PORT=3000 coffee app.coffee 
{ env: 'development', port: '3000' }
$ ENV=production coffee app.coffee
{ env: 'production' }
$ ENV=production PORT=3000 coffee app.coffee
{ env: 'production', port: '3000' }
$ NODE_ENV=production PORT=3000 coffee app.coffee
{ env: 'production', port: '3000' }
```
