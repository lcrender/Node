let fs = require('fs')
const { createGzip } = require('zlib');
const { pipeline } = require('stream');
const { createReadStream, createWriteStream } = require('fs');
const { spawn } = require('child_process');
const {scrypt, randomFill, createCipheriv} = require('node:crypto');
require('events').EventEmitter.prototype._maxListeners = 100;

function createFile () {
	return new Promise ((resolve, reject) => {
		let message = `Hola mundo cruel`;
		fs.writeFile('./data/hello.txt', message, function(err) {
		if (err) {
			reject (new Error(err));
		}
		resolve ('Archivo creado');
		});
	});
};
//Nivel 1, ejercicio 2
const read = () => {
	fs.readFile('./data/hello.txt', function(err, data) {
		if (err) {console.log(err)};
		const readFile = data.toString();
		console.log(`Contenido del archivo:\n${readFile}\n`);
	});
};
//Nivel 1, Ejercicio 3
function compGzip() {
    const gzip = createGzip();
    const source = createReadStream('./data/hello.txt')
    const destination = createWriteStream('./data/hello.txt.gz');
    pipeline(source, gzip, destination, (err) => {
        if (err) {
            console.error('Error al intentar crear el archivo:', err);
            process.exitCode = 1;
        }
        else {console.log("Archivo comprimirdo GZIP\n")}
    }); 
};
//Nivel 2, ejercicio 1
function sing (numero) {
    setTimeout(() => {
        if (numero === 0) {
            return;
        }
        else {
            console.log(`Espere ${numero - 1}`);
            return (sing(numero - 1));
        }
    }, 1000);
}
//Nivel 2, ejercicio 2
function listUserFolder () {
    const ls = spawn('ls', ['-lh', './data/']);
    ls.stdout.on('data', (data) => {
        const msg = `Archivos: ${data}`
        console.log(msg)
    });
    ls.stderr.on('data', (data) => {
        console.error(`stderr: ${data}`);
    });
}
// Nivel 3
function firstConvert () {
	return new Promise((resolve, reject) => {
		fs.readFile('./data/hello.txt', function(err, data) {
			if (err) {
				reject(new Error(err));
			}
			const readFile = data.toString();
			const newBuffer = Buffer.from(readFile);
			const hex = newBuffer.toString('hex');
			const base64 = newBuffer.toString('base64');
			fs.writeFile('./data/hello.hex.txt', hex, function(err) {
				if (err) {
					reject(new Error(err));
				}
			});
			fs.writeFile('./data/hello.base64.txt', base64, function(err) {
				if (err) {
					console.log(err);
				}
			});
		});
		resolve ("Archivos Codificados");
	});
};
const algorithm = 'aes-192-cbc';
const password = 'alibaba';
function cOne() {
	return new Promise ((resolve, reject) => {
		scrypt(password, 'salt', 24, (err, key) => {
			if (err) {reject(new Error(err))};
			randomFill(new Uint8Array(16), (err, iv) => {
			  if (err) {reject(new Error(err))};
			  const cipher = createCipheriv(algorithm, key, iv);
			  const inputB64 = createReadStream('./data/hello.base64.txt');
			  const outputB64 = createWriteStream('./data/hello.base64.enc');
			  const inputHex = createReadStream('./data/hello.hex.txt');
			  const outputHex = createWriteStream('./data/hello.hex.enc');
			  pipeline(inputB64, cipher, outputB64, (err) => {
				if (err) {reject(new Error(err))}
			  });
			  pipeline(inputHex, cipher, outputHex, (err) => {
				  if (err) {reject(new Error(err))}
			  });
			});
		  });
		resolve (console.log("Archivos Encriptados"))
	});
};
// const fsP = require('fs').promises
// const cTwo = () => {
    
//     fsP.unlink('./data/hello.base64.txt')
//     .then(() => {
//         console.log('Archivo hello.base64.txt borrado')
//     })
//     fsP.unlink('./data/hello.hex.txt')
//         .then(() => {
//             console.log('Archivo hello.hex.txt borrado')
//         })
//         .catch(err => {
//             console.error('Problema al intentar borrar el archivo', err)
//         })
//     }


//////////Ejecuto Funciones////////////
//Crea archivo hello.txt
// createFile()
// 	.then((res)=> {
// 		console.log(res)
//         read();
//         compGzip();
//         sing(4) // El numero 4 indica la cantidad de veces que se repetira el mensaje    
//         setTimeout(() => {
//             listUserFolder() 
//         }, 5000);   
//     })
// 	.catch((err)=>{
// 		console.log(err)
// 	});
// setTimeout(()=> {
//     firstConvert ()
//     .then((res)=>{
//         console.log(res)
//         cOne()
// 	        .then((res)=> {
// 		        console.log(res)
//                 //cTwo()
// 	        })
//         })
//     .catch((err)=>{
//         console.log(err)
//     })
// }, 6000)
