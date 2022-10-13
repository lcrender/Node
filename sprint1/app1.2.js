//Nivel 1
console.log((( num1, num2 ) => {
    return ( num1 + num2 );
  })( 2, 8 ))

//Nivel 2, ejercicio 1
const createScenery = (scenary) => (this.scenary = scenary);
console.log(createScenery('Ciudad Gotica'));
//console.log(typeof createScenery);
//Nivel 2, ejercicio 2. Nivel 3
class Person {
	name;
	constructor(name) {
		this.name = name;
	}
}
class Power extends Person {
	constructor(name, nacionalidad, fuerza) {
		super(name);
		this.nacionalidad = nacionalidad;
		this.fuerza = fuerza;
	}
}
const personList = [];
function newPerson(name, nacionalidad, fuerza) {
	let createPerson = new Power(name, nacionalidad, fuerza);
	personList.push(createPerson);
}
newPerson('Batman', 'Paraguay', '100%');
console.log(personList[0]);