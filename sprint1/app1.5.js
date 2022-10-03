const fs = require('fs');
/*
let employees = [
	{
		id: 1,
		name: 'Linux Torvalds'
	},
	{
		id: 2,
		name: 'Bill Gates'
	},
	{
		id: 3,
		name: 'Jeff Bezos'
	}
];

let salaries = [
	{
		id: 1,
		salary: 4000
	},
	{
		id: 2,
		salary: 1000
	},
	{
		id: 3,
		salary: 2000
	}
];

const getEmployee = (searchId) => {
	return new Promise((resolve, reject) => {
		let i = 0;
		let clientFound = false;
		while (i < employees.length && clientFound === false) {
			if (searchId === employees[i].id) {
				clientFound = true;
				const employeeName = employees[i].name;
				resolve(employeeName);
			} else {
				i++;
			}
		}
		if (clientFound === false) {
			reject(new Error('Empleado no encontrado.'));
		}
	});
};

const getSalary = (searchId) => {
	return new Promise((resolve, reject) => {
		let i = 0;
		let clientFound = false;
		while (i < employees.length && clientFound === false) {
			if (searchId === employees[i].id) {
				clientFound = true;
				const employeeSalary = salaries[i].salary;
				resolve(employeeSalary);
			} else {
				i++;
			}
		}
		if (clientFound === false) {
			reject(new Error('Usuario no encontrado.'));
		}
	});
};

const printEmployeer = (searchId) => {
	return new Promise((resolve, reject) => {
		let i = 0;
		let clientFound = false;
		while (i < employees.length && clientFound === false) {
			if (searchId === employees[i].id) {
				clientFound = true;
				let message = `Nombre: ${employees[i].name}
Salario: ${salaries[i].salary}`;
				fs.writeFile('./resumen.app1.5.txt', message, function(err) {
					if (err) {
						console.log(err);
					}
					console.log('Archivo creado');
				});
			}
		}
	});
};

const search = (id) => {
	getEmployee(id)
		.then((res) => {
			console.log('Usuario Encontrado');
			console.log(res);
		})
		.catch((err) => {
			console.log(err.message);
		});
	getSalary(id)
		.then((res) => {
			console.log(res);
		})
		.catch((err) => {});
	setTimeout(() => {
		printEmployeer(id);
	}, 2000);
};
//Busqueda de usuario
search(1);
//2
fs.readFile('./resumen.app1.5.txt', function(err, data) {
	if (err) {
		console.log(err);
	}
	const readFile = data.toString();
	const fileMessage = `Leyendo el archivo creado:

${readFile}`;
	setTimeout(() => {
		console.log(fileMessage);
	}, 4000);
});
*/
//3
const archiver = require ('archiver');
var filePath = './' // Obtener la ruta del archivo
var dirList = fs.readdirSync (filePath); // Obtener lista de archivos
var zipPath = './resumen.app1.5.zip'; // Ruta de generación de paquetes comprimidos
var level = 9; // nivel de compresión
// Crea el flujo de salida del archivo empaquetado final
var output = fs.createWriteStream(zipPath);
// Genera el objeto archivador, el tipo de empaque es zip
var archive = archiver('zip', {
   zlib: {
       level: level
   }
});
