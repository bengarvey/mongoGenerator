re "fs"

to="mongoData.json"
records = []

getUnixTimestamp = () ->
  range = 1449964800 - 1104537600
  return Math.round((Math.random() * range)) + 1104537600

getDateString = (unixTimestamp) ->
  date = new Date(unixTimestamp * 1000);
  return date.toISOString()

for index in [0..100000]
  stamp = getUnixTimestamp()
  record =
    id: index
    ts: stamp
    modified_at: getDateString(stamp)
  records.push(record)

fs.writeFile(to, JSON.stringify(records), (err) ->
  if err 
    return console.log err 
  console.log "Wrote to #{to}"
)
