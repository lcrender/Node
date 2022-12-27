console.log(`\nNivel 1 \n`)
const showBalance = (haveBalance) => {
	return new Promise((resolve, reject) => {
		if (haveBalance > 0) {
			let msg = "Su saldo es de " + haveBalance + " Euros."
			resolve(console.log(msg));
		}  
		else {reject('No hay saldo en su cuenta.');}
	});
};
//le paso el saldo 10 euros como parametro a la funcion
showBalance(10)
	.then((res) => {
		 console.log(res);
	})
	.catch((err) => {
		//este .catch me genera un undefined debajo del console.log de la linea 49, no puedo encontrar el por que.
		 console.log(err);
	});

//////////////////////////////////////
console.log(`\nNivel 1 Ejercicio 2 \n`)
//Funcion Callback
let msg = ""
const welcome = (msg) => {
	console.log(msg);
};
const message = (age, welcome) => {
	const userAge = age;
	if (isNaN(userAge)) {
		let msg = 'ERROR: La edad debe ser un numero';
		welcome(msg)
	}
	if (age >= 18) {
		let msg = "Mensaje de bienvenida:\nTienes mas de 18 años, eres bienvenido al club.\n\n";
		welcome(msg)
	} else {
		let msg = "Mensaje de rechazo:\nTienes menos de 18 años, NO eres bienvenido.\n\n";
		welcome(msg)
	}
};
//La funcion message va seguida de una edad y una funcion callback, en este caso un mensaje de bienvenida al club si es mayor o igual de 18 años.
//Primer mensaje
message('20', welcome);
//Segundo mensaje
message('17', welcome);
//////////////////////////////////////
//Nivel 2 y 3
console.log('Nivel 2 y 3\n');
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
		let empFound = false;
		let empName = '';
		employees.map((i) => {
			if (searchId === i.id) {
				empFound = true;
				empName = i.name;
			}
		});
		if (empFound === true) {
			resolve(`Empleado encontrado:\nNombre: ${empName}`);
		} else {
			reject(new Error('Usuario no encontrado'));
		}
	});
};
const getSalary = (employeeId) => {
    return new Promise((resolve, reject) => {
        let i = 0;
		let clientFound = false;
		while (i < employees.length && clientFound === false) {
			if (employeeId === employees[i].id) {
                clientFound = true
                resolve (`Salario: ${salaries[i].salary} \n`);
			} else {
				i++;
			}
		} // termina el buscador
		if (clientFound === false) {
			reject(new Error(`No se encontro usuario con id ${employeeId}`));
		}
	}); //fin promesa
};

const search = (id) => {
    getEmployee(id)
 		.then((res) => {
 			console.log(res);
 		})
 		.catch((err) => {
 			return (err.message);
 		});
    getSalary(id)
        .then((res) => {
            console.log(res);
        })
        .catch((err) => {
            console.log(err.message);
        });
};
search(0)
search(1)
search(2)
search(3)
search(4)