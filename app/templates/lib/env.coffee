# Environment
# ===========
#
# Establish process running environment.
#
# Two environment variables are supported: `ENV` and `NODE_ENV`. First it will
# check the value of `ENV`, then `NODE_ENV`, and fall back to the development
# environment if none is set. Note that all these environment variables will be
# set to a consistent value.
#
# Command usage that sets this exported environment value:
#
#     $ ENV=production coffee app.coffee
#
# or
#
#     $ NODE_ENV=production coffee app.coffee
#
# > (c)

'use strict'

env = process.env.ENV or process.env.NODE_ENV or 'development'

process.env.ENV      = env
process.env.NODE_ENV = env
module.exports       = env
