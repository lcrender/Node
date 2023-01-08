const enc = () => {
const cOne = () => {
    scrypt(password, 'salt', 24, (err, key) => {
      if (err) throw err;
      // Then, we'll generate a random initialization vector
      randomFill(new Uint8Array(16), (err, iv) => {
        if (err) throw err;
        const cipher = createCipheriv(algorithm, key, iv);
        const inputB64 = createReadStream('./hello.base64.txt');
        const outputB64 = createWriteStream('hello.base64.enc');
        pipeline(inputB64, cipher, outputB64, (err) => {
          if (err) throw err;
        });
      });
    });
  };
  cOne();
  const cTwo = () => {
    scrypt(password, 'salt', 24, (err, key) => {
      if (err) throw err;
      // Then, we'll generate a random initialization vector
      randomFill(new Uint8Array(16), (err, iv) => {
        if (err) throw err;
    
        const cipher = createCipheriv(algorithm, key, iv);
        const inputHex = createReadStream('./hello.hex.txt');
        const outputHex = createWriteStream('hello.hex.enc');
        pipeline(inputHex, cipher, outputHex, (err) => {
            if (err) throw err;
        });
      });
    });
  };
  cTwo();
};
enc();