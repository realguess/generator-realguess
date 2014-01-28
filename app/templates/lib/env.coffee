# Environment
# ===========
#
# > (c) 2014 Example, Inc. <info@example.com>

'use strict'

module.exports = process.env['ENV'] or process.env['NODE_ENV'] or 'development'
process.env['ENV'] = process.env['NODE_ENV'] = module.exports
