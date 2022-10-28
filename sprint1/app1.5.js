const fs = require('fs');
//Nivel 1, ejercicio 1

const createFile = () => {
	let message = `Hola mundo`;
	fs.writeFile('./hello.txt', message, function(err) {
		if (err) {
			console.log(err);
		}
		//console.log('Archivo creado');
	});
};
//Ejecuta la funcion
createFile();

//Nivel 1, ejercicio 2
const read = () => {
	fs.readFile('./hello.txt', function(err, data) {
		if (err) {
			console.log(err);
		}
		const readFile = data.toString();
		console.log(readFile);
	});
};
//Ejecuta la funcion
read();

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
//El programa cantara una pequeña cancion de daftpunk que conlleva una letra muy elaborada (ironicamente hablando) para hacer una pausa relajante
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

const firstConvert = () => {
	fs.readFile('./hello.txt', function(err, data) {
		if (err) {
			console.log(err);
		}
		const readFile = data.toString();
		const newBuffer = Buffer.from(readFile);
		const hex = newBuffer.toString('hex');
		const base64 = newBuffer.toString('base64');
		fs.writeFile('./hello.hex.txt', hex, function(err) {
			if (err) {
				console.log(err);
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
};
//Ejecuto la funcion para crear 2 archivos codificados
firstConvert()

//var crypto  = require( 'crypto' );
//var cipher  = crypto.createCipher( 'aes-192-ecb', datasources.api.auth.encryptionKey );

  