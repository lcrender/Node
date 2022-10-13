//Nivel uno, ejercicio 1 / Nivel 2 ejercicio 1
function myName(userName, name, sur) {
	const user = userName;
	const firstName = name;
	const surName = sur;
	const messageOne = `
Nombre de usuario: ${userName}

Nombre: ${firstName}
Apellido: ${surName}
`;

	return console.log(messageOne);
}

myName('aldob', 'Aldo', 'Bonzi');

const finEj = `_________________
`;
console.log(finEj); //fin ejercicio

//Nivel 2 ejercicio 2
//Esta funcion le añade 4 años a la fecha actual para establecer la fecha de renovacion del documento
function expirationDate() {
	let date = new Date();
	let year = date.getFullYear();
	let expirationDate = year + 4;
	let output =
		String(date.getDate()).padStart(2, '0') +
		'/' +
		String(date.getMonth() + 1).padStart(2, '0') +
		'/' +
		expirationDate;
	return output;
}
console.log(
	`${myName('aldob', 'Aldo', 'Bonzi')}

Felizitaciones su licencia de conducir a sido renovada.
    
Proximo vencimiento: ${expirationDate()}


`
);
console.log(finEj); //fin ejercicio

//nivel 3
let array = [];

function funcCounter() {
	let c = [];
	for (i = 0; i < 10; ) {
		c.push(i);
		console.log(c[i]);
		i = i + 1;
	}
	console.log(`
`);
}

function funcTen() {
	for (c = 0; c < 10; c++) {
		array.push(funcCounter());
	}
}
funcTen();
//ejercicio n3.2 funcion autoejecutable

(function(name) {
	console.log(name);
})('Aldo');
