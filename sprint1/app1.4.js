const fs = require('fs');
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
//Nivel 1, ejercicio 1 y 2
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
async function printEmployeer(searchId) {
	return new Promise((resolve, reject) => {
		let i = 0;
		let clientFound = false;
		while (i < employees.length && clientFound === false) {
			if (searchId === employees[i].id) {
				clientFound = true;
				let message = `Nombre: ${employees[i].name}
Salario: ${salaries[i].salary}`;
				fs.writeFile('./resumen.app1.4.txt', message, function(err) {
					if (err) {
						console.log(err);
					}
					console.log('Archivo creado');
				});
			}
		}
	});
}
async function search(id) {
	getEmployee(id)
		.then((res) => {
			console.log('Usuario Encontrado');
			console.log(res);
		})
		.catch((err) => {
			console.log(err.message);
		});
	getSalary(id).then((res) => {
		console.log(res);
	});
	setTimeout(() => {
		printEmployeer(id);
	}, 2000);
}
//busqueda de usuario
search(1);

//Nivel 2 y Nivel 3
const math = (n) => {
	return new Promise((resolve, reject) => {
		if (isNaN(n)) {
			reject(new Error('No es un numero.'));
		} else {
			resolve(n * 2);
		}
	});
};
async function add(n1, n2, n3) {
	return new Promise((resolve, reject) => {
		if (isNaN(n1, n2, n3)) {
			reject(new Error('No es un numero.'));
		} else {
			let total = (n1 + n2 + n3) * 2;
			resolve(total);
		}
	});
}
setTimeout(() => {
	math(22)
		.then((res) => {
			console.log(res);
		})
		.catch((err) => {
			console.log(err);
		});
}, 2000);
setTimeout(() => {
	add(2, 4, 2)
		.then((res) => {
			console.log(res);
		})
		.catch((err) => {
			console.log(err);
		});
}, 4000);