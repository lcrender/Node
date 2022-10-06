const {
    scrypt,
    randomFill,
    createCipheriv
  } = import('node:crypto');
  
  const algorithm = 'aes-192-cbc';
  const password = '123456';
  
  // First, we'll generate the key. The key length is dependent on the algorithm.
  // In this case for aes192, it is 24 bytes (192 bits).
  scrypt(password, 'salt', 24, (err, key) => {
    if (err) throw err;
    // Then, we'll generate a random initialization vector
    randomFill(new Uint8Array(16), (err, iv) => {
      if (err) throw err;
  
      // Once we have the key and iv, we can create and use the cipher...
      const cipher = createCipheriv(algorithm, key, iv);
  
      let encrypted = 'algo';
      cipher.setEncoding('hex');
  
      cipher.on('data', (chunk) => encrypted += chunk);
      cipher.on('end', () => console.log(encrypted));
  
      cipher.write('some clear text data');
      cipher.end();
    });
  });