# Settings
# ========
#
# Load settings.
#
# Steps:
#
# 1. Load default settings `config/default.yml`.
# 2. Load environment specific settings that override the default, see
#    directory `config/environments`.
# 3. Load custom settings specified by shell environment via command line or
#    `config/settings.yml`.

'use strict'

# Load module dependencies.
_    = require 'underscore'
yaml = require 'js-yaml'
env  = require './env'

# Load default settings.
settings = require('../config/default') or {}

# Add environment.
settings.env = env

# Settings are overridden by the environment settings.
#
# TODO: Migrate to JS-YAML 3.x
settings = _.extend settings, require "../config/environments/#{env}.yml"

# Settings are overridden via custom command line file.
if process.env.SETTINGS
  settings = _.extend settings, require process.env.SETTINGS
else
  try
    settings = _.extend settings, require '../config/settings'

# Configure port number if via environment.
if process.env.PORT
  settings.port = process.env.PORT;

module.exports = settings
