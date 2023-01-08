let fs = require('fs')
require('events').EventEmitter.prototype._maxListeners = 100;
//Nivel 1, ejercicio 1

function createFile () {
	return new Promise ((resolve, reject) => {
		let message = `Hola mundo`;
		fs.writeFile('./hello.txt', message, function(err) {
		if (err) {
			reject (new Error(err));
		}
		resolve ('Archivo creado');
		});
	});
};



//Nivel 1, Ejercicio 3

const { createGzip } = require('zlib');
const { pipeline } = require('stream');
const { createReadStream, createWriteStream } = require('fs');

const gzip = createGzip();
const source = createReadStream('hello.txt')
const destination = createWriteStream('hello.txt.gz');

pipeline(source, gzip, destination, (err) => {
	if (err) {
		console.error('Error al intentar crear el archivo:', err);
		process.exitCode = 1;
	}
});

//Nivel 2, ejercicio 1
let sing = (numero) => {
	setTimeout(() => {
		if (numero === 0) {
			return;
		}
		pauseMessage = 'Around the World';
		console.log(pauseMessage);
		return sing(numero - 1);
	}, 1000);
};
// El numero 8 indica la cantidad de veces que se repetira el mensaje
sing(8);

//Nivel 2, ejercicio 2
const { spawn } = require('child_process');

const listUserFolder = () => {
    const ls = spawn('ls', ['-lh', '/usr']);
    ls.stdout.on('data', (data) => {
        console.log(`stdout: ${data}`);
    });
    
    ls.stderr.on('data', (data) => {
        console.error(`stderr: ${data}`);
    });
}
//Ejecuto la funcion
listUserFolder()

//Nivel 3

function firstConvert () {
	return new Promise((resolve, reject) => {
		fs.readFile('./hello.txt', function(err, data) {
			if (err) {
				reject(new Error(err));
			}
			const readFile = data.toString();
			const newBuffer = Buffer.from(readFile);
			const hex = newBuffer.toString('hex');
			const base64 = newBuffer.toString('base64');
			fs.writeFile('./hello.hex.txt', hex, function(err) {
				if (err) {
					reject(new Error(err));
				}
				console.log('Archivo hexadecimal creado');
			});
			fs.writeFile('./hello.base64.txt', base64, function(err) {
				if (err) {
					console.log(err);
				}
				console.log('Archivo base64 creado');
			});
		});
		resolve ("Archivos Codificados");
	})
	
};


const {
	scrypt,
	randomFill,
	createCipheriv
  } =  require('node:crypto');
  
  const algorithm = 'aes-192-cbc';
  const password = 'alibaba';
  
function cOne() {
	return new Promise ((resolve, reject) => {
		scrypt(password, 'salt', 24, (err, key) => {
			if (err) throw err;
			// Then, we'll generate a random initialization vector
			randomFill(new Uint8Array(16), (err, iv) => {
			  if (err) throw err;
			  const cipher = createCipheriv(algorithm, key, iv);
			  const inputB64 = createReadStream('./hello.base64.txt');
			  const outputB64 = createWriteStream('./hello.base64.enc');
			  const inputHex = createReadStream('./hello.hex.txt');
			  const outputHex = createWriteStream('./hello.hex.enc');
			  pipeline(inputB64, cipher, outputB64, (err) => {
				if (err) { reject(new Error(err))}
			  });
			  pipeline(inputHex, cipher, outputHex, (err) => {
				  if (err) { reject(new Error(err))}
			  });
			});
		  });
		resolve (console.log("Archivos encriptados"))


	})
}

fs = require('fs').promises
const cTwo = () => {
fs.unlink('hello.base64.txt')
fs.unlink('hello.hex.txt')
  .then(() => {
    console.log('Files removed')
  }).catch(err => {
    console.error('Something wrong happened removing the file', err)
  })
}

//Crea archivo hello.txt
createFile()
	.then((res)=> {
		console.log(res)
	})
	.catch((err)=>{
		console.log(err)
	});




//Ejecuto la funcion para crear 2 archivos codificados
firstConvert()
	.then

cOne()
	.then((res) => {
		console.log(res)
		cTwo()
	})
	.catch((err) => {
		console.log(err)
	})
// cTwo()

