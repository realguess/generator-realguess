# Settings
# ========
#
# Load settings.
#
# The loading is a synchronous and blocking process, otherwise, the other files
# that requiring this file will load unfinished settings.
#
# Steps:
#
# 1. Load default settings `config/default.yml`.
# 2. Load environment specific settings that override the default, see
#    directory `config/environments`.
# 3. Load custom settings specified by environment variable `SETTINGS` via
#    command line or `config/settings.yml`. The former takes precedence if both
#    options are available.
#
# If the file `config/settings.yml` is not found, it will be ignored, no error
# will be thrown, in three other cases (via environment variable, environment
# file in `config`, and the default settings file), errors will be thrown.
#
# The supported environment variables are `SETTINGS` and `PORT`. If the
# environment variable `PORT` is set, it will override the existing value in
# `settings.port`.
#
# Multi-document sources are not supported. For more information, see
# <https://github.com/nodeca/js-yaml>.
#
# > (c)

'use strict'

# Load module dependencies.
fs     = require 'fs'
read   = fs.readFileSync
exists = fs.existsSync
load   = require('js-yaml').safeLoad
env    = require './env'

# Set configurations.
configDir = "../config"
options   = { encoding: 'utf8' }
settings  = {}

# Extend settings by specifying file path.
extend = (file) ->
  obj = load read file, options
  settings[prop] = obj[prop] for prop of obj if obj

# Build settings.
files = ["#{configDir}/default.yml", "#{configDir}/environments/#{env}.yml"]
extend file for file in files

if process.env.SETTINGS
  extend process.env.SETTINGS
else
  file = "#{configDir}/settings.yml"
  if exists file then extend file

# Update environment.
settings.env = env

# Configure port number via environment if available.
if process.env.PORT then settings.port = process.env.PORT;

module.exports = settings
