const fs = require('fs').promises

const cTwo = () => {
fs.unlink('hello.base64.txt')
fs.unlink('hello.hex.txt')
  .then(() => {
    console.log('Files removed')
  }).catch(err => {
    console.error('Something wrong happened removing the file', err)
  })
}

// cOne()
cTwo()