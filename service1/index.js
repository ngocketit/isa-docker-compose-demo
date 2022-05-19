const express = require('express')
const app = express()
const port = 9001

app.get('/greet/:name', (req, res) => {
  res.json({
    message: `Hello ${req.params.name}`,
  })
})

app.listen(port, () => {
  console.log(`App listening on port ${port}`)
})
