fs = require "fs"

to="mongoData.json"
records = []

getUnixTimestamp = () ->
  range = 1449964800 - 1104537600
  return Math.round((Math.random() * range)) + 1104537600

getUnixTimestampMilliseconds = () ->
  range = 1449964800000 - 1104537600000
  return Math.round((Math.random() * range)) + 1104537600000

getDateString = (unixTimestamp, convertToMs=true) ->
  multiplier = if convertToMs then 1000 else 1
  date = new Date(unixTimestamp * multiplier);
  return date.toISOString()

for index in [0..100000]
  stamp = getUnixTimestampMilliseconds()
  record =
    id: index
    ts: stamp
    modified_at: getDateString(stamp, false)
  records.push(record)

fs.writeFile(to, JSON.stringify(records), (err) ->
  if err 
    return console.log err 
  console.log "Wrote to #{to}"
)
