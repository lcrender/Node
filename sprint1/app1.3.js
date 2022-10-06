//Nivel 1, ejercicio 1
//Cuando la constante haveBalance esta en "true" muestra el saldo de la cuenta por medio de la const balanceDetails
//Cuando la constante haveBalance esta en "False" muestra el mensaje de error "No hay saldo"
const haveBalance = true;
const balance = new Promise((resolve, reject) => {
	if (haveBalance === true) {
		const balanceDetails = {
			Eur: 8000,
			Usd: 7300,
			Ars: 2843578
		};
		resolve(balanceDetails);
	} else {
		reject(new Error('No hay saldo en su cuenta.'));
	}
});
balance
	.then((res) => {
		console.log('El saldo total del usuario x es de:');
		console.log(res);
		console.log(`
fin de consulta

`);
	})
	.catch((err) => {
		console.log(err.message);
	});
    
//Nivel 1, ejercicio 2
const message = (age, callback) => {
	const userAge = age;
	if (isNaN(userAge)) {
		const errorMessage = console.log('ERROR: La edad debe ser un numero');
		return errorMessage;
	} else {
		return callback(userAge);
	}
};
let welcome = (age) => {
	if (age >= 18) {
		const welcomeMessage = console.log('Tienes mas de 18 años, eres bienvenido al club');
		return welcomeMessage;
	} else {
		const notWelcomeMessage = console.log('Tienes menos de 18 años, NO eres bienvenido');
		return notWelcomeMessage;
	}
};
//La funcion message va seguida de una edad y una funcion callback, en este caso un mensaje de bienvenida al club si es mayor o igual de 18 años.
message('20', welcome);

//Nivel 2, ejercicio 1, 2, 3. Nivel 3, ejercicio 1 
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
	return new Promise((result, reject) => {
		let i = 0;
		let clientFound = false;
		while (i < employees.length && clientFound === false) {
			if (searchId === employees[i].id) {
				clientFound = true;
				const employeeName = employees[i].name;
				const employeesFound = { Nombre: employeeName };
				result(employeesFound);
			} else {
				i++;
			}
		} // termina el buscador
		if (clientFound === false) {
			reject(new Error('Empleado no encontrado.'));
		}
	}); //fin promesa
};
const getSalary = (searchId) => {
	return new Promise((result, reject) => {
		let i = 0;
		let clientFound = false;
		while (i < employees.length && clientFound === false) {
			if (searchId === employees[i].id) {
				clientFound = true;
				const employeeSalary = salaries[i].salary;
				const salariesFound = { Salario: employeeSalary };
				result(salariesFound);
			} else {
				i++;
			}
		} // termina el buscador
		if (clientFound === false) {
			reject(new Error('Usuario no encontrado.'));
		}
	}); //fin promesa
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
};
//busqueda de usuario
search(1);
