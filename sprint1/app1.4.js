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
//Nivel 1, ejercicio 1
const getEmployee = (searchId) => {
	return new Promise((resolve, reject) => {
		let i = 0;
		let clientFound = false;
		while (i < employees.length && clientFound === false) {
			if (searchId === employees[i].id) {
				clientFound = true;
				resolve(employees[i].name);
			} else {
				i++;
			}
		} // termina el buscador
		if (clientFound === false) {
			reject(new Error('Empleado no encontrado.'));
		}
	}); //fin promesa
};
const getSalary = (employeeId) => {
	return new Promise((resolve, reject) => {
		let i = 0;
		let clientFound = false;
		while (i < employees.length && clientFound === false) {
			if (employeeId === employees[i].id) {
				clientFound = true;
				resolve(salaries[i].salary);
			} else {
				i++;
			}
		}
		if (clientFound === false) {
			reject(new Error('El id del empleado no existe'));
		}
	});
};
async function search(id) {
	const employeeMsj = await getEmployee(id);
	const salaryMsj = await getSalary(id);
	const resumenMsj = employeeMsj + ' ' + salaryMsj;
	return console.log(resumenMsj);
}
//Ejecuta las funciones getEmployee y getSalary anidadas
search(1).catch((err) => {
	console.log(err.message);
});

//Nivel 1, ejercicio 2
//esta funcion saluda a alguien despues de 2000ms
const goodbye = (name) => {
	return new Promise((resolve) => {
		const bye = `Gracias por su consulta ${name}`;
		setTimeout(() => {
			resolve(bye);
		}, 2000);
	});
};
async function sayGoodbye(name) {
	const bye = await goodbye(name);
	return console.log(bye);
}
//Ejecuta funcion saludar a alguien
sayGoodbye('Humberto');

//Nivel 2, ejercicio 1
//Funcion para multiplicar por 2 un numero y mostrar el resultado despues de 2000 ms
const math = (n) => {
	return new Promise((resolve, reject) => {
		if (isNaN(n)) {
			reject(new Error('ERROR Eso no parece un numero!'));
		} else {
			const multy = n * 2;
			setTimeout(() => {
				resolve(multy);
			}, 2000);
		}
	});
};
//funcion para sumar 3 numeros y multiplicar por 2
async function add(n1, n2, n3) {
	let total = n1 + n2 + n3;
	const finalResult = await math(total);
	//return finalResult;
	return console.log(finalResult); //en el enunciado del ejercicio no pide que se muestre por consola pero yo lo agrego para poder ver el resultado correcto de la funcion.
}
//Ejecuto funcion para sumar 3 numeros y multiplicar por 2
try {
    add(1, 1, 1)
}
catch(err) {
	console.log(err.message);
};