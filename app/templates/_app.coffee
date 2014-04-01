# <%= appname %>
# <%= new Array(appname.length + 1).join('=') %>
#
# > (c) <%= new Date().getFullYear() %> <%= pkg.author.name %> <<%= pkg.author.email %>>

'use strict'


# Module Dependencies
# ===================
settings = require './lib/settings'


# Main
# ====
console.log settings
