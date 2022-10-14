//Nivel 1
function userName(userName) {
	return console.log(userName);
}
userName('aldob')
//Nivel 2
function myName(name, sur) {
	const firstName = name;
	const surName = sur;
	const messageOne = `

Nombre: ${firstName}
Apellido: ${surName}
`

	return messageOne
};
console.log(`${myName('Aldo', 'Bonzi')}

Bienvenido al club!
    
`
);
//Nivel 3, Ejercicio 1
function funcTen() {
	for (c = 0; c < 10; c++) {
		console.log(`
Vuelta nº ${c + 1}
`);
		funcCounter();
		function funcCounter() {
			let c = 0;
			for (i = 0; i < 10; ) {
				console.log(i);
				i = i + 1;
			}
		}
	}
}
funcTen();
//Nivel 3, ejercicio 2
autoName = (function(name) {
	console.log(name);
})('Aldo');