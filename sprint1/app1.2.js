//Nivel 1
console.log((( num1, num2 ) => {
    return ( num1 + num2 );
  })( 2, 8 ))

//Nivel 2, ejercicio 1
const createScenery = (scenary) => {
    let obj = new Object()
    obj.ciudad = scenary
    return obj
}
//Ejemplo para probar la funcion
//console.log(createScenery("Ciudad Gotica"))

//Nivel 2, ejercicio 2
class Persona {
	nom;
	constructor(nom) {
		this.nom = nom;
	}
	dirNom(nom) {
		return console.log(this.nom);
	}
}
const newPersona = new Persona('Batman');
newPersona.dirNom();

//Nivel 3

console.log(`
Nivel 3
`)

class Person {
	name;
	constructor(name) {
		if (this.constructor == Person) {
			throw new Error("Person es una classe abstracta y no puede ser instanciada.");
		}
	this.name = name
	}
	caminar() {
		console.log("caminando");
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
const heroList = [];
newPerson('Batman', 'Paraguay', '100%');

console.log(`Nombre: ${personList[0].name}`)
console.log(`Nacionalidad: ${personList[0].nacionalidad}`)
console.log(`Fuerza: ${personList[0].fuerza}`)
personList[0].caminar()
