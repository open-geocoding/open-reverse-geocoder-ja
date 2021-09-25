const readline = require("readline")
const optimise = require('./optimise.js')

const reader = readline.createInterface({
  input: process.stdin,
});

reader.on("line", (chunk) => {
  const f = JSON.parse(chunk)
  process.stdout.write(`\x1e${JSON.stringify(optimise(f))}\n`)
});