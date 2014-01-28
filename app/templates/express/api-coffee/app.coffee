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
# https   = require 'https'
path    = require 'path'

app = express()

# Configuration
# -------------

# Configure all environments.
app.configure () ->
  app.set 'port', process.env.PORT or 3000
  app.use express.favicon()
  app.use express.logger 'dev'
  app.use express.bodyParser()
  app.use express.methodOverride()
  app.use app.router
  app.use express.static path.join __dirname, 'public'

# Configure development environment.
app.configure 'development', () ->
  app.use express.errorHandler()

# Define routings
# ---------------
app.get '/', routes.index

# Create app
# ----------
http.createServer(app).listen app.get('port'), () ->
  console.log 'Express server listening on port ' + app.get 'port'
