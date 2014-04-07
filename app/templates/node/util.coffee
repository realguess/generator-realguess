# Utility
# =======
#
# > (c)

'use strict'


# Days Passed
# -----------
#
# Return the number days has passed since the beginning of the year or from a
# specific `start` date. The date must be in the format of 'YYYY-MM-DD' string.
#
# See gist: <https://gist.github.com/realguess/6528734>
#
# TODO: Update gists due to the new parameter.
daysPassed = (start) ->
  seconds = 60 * 60 * 24
  if start
    start = new Date start
  else
    start = new Date '' + new Date().getFullYear()
  today   = new Date new Date().toISOString().substr 0, 10

  return (today.getTime() - start.getTime()) / (1000 * seconds)
