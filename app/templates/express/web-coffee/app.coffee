# [Application]
# =============
#
# > (c) 2014 [Joe Doe] <jdoe@example.com>

'use strict'


# Module dependencies
# -------------------
express = require 'express'
routes  = require './routes'
http    = require 'http'
path    = require 'path'

app = express()


# Configuration
# -------------

# Configure all environments.
app.set 'port', process.env.PORT or 3000
app.set 'views', __dirname + '/views'
app.set 'view engine', 'hjs'
app.use express.favicon()
app.use express.logger 'dev'
app.use express.bodyParser()
app.use express.methodOverride()
app.use express.cookieParser 'your secret here'
app.use express.session()
app.use app.router
app.use express.static path.join __dirname, 'public'

# Configure development environment.
if app.get 'env' is 'development'
  app.use express.errorHandler()


# Routes
# ------
app.get '/', routes.index


# Initiation
# ----------
http.createServer(app).listen app.get('port'), () ->
  console.log 'Express server listening on port ' + app.get 'port'
