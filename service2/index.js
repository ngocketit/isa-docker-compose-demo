const express = require('express')
const axios = require('axios')
const app = express()
const port = 9002

app.get('/message/:name', (req, res) => {
  axios.get(`http://service1:9001/greet/${req.params.name}`).then(resp => {
    res.json({
      message: resp.data.message,
    })
  }).catch(err => {
    console.error(err)
    res.status(500).json({
      error: 'Something went wrong',
    })
  })
})

app.listen(port, () => {
  console.log(`App listening on port ${port}`)
})
