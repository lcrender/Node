class Person {
	name;
    nationality;
	constructor(name, nationality) {
		if (this.constructor === Person) {
			throw new Error("Person es una classe abstracta y no puede ser instanciada.");
		}
	this.name = name
    this.nationality = nationality
	}
	caminar() {console.log("caminando");}
    
}
const personList = [];
Person.__proto__.newPerson = (name) => {
    let createPerson = new Person(name);
    personList.push(createPerson)
}
Person.__proto__.newPerson("batman")
// Person.prototype.newPerson = (name) {
//     let createPerson = new Person(name);
// 	personList.push(createPerson);
// }


// newPerson("Batman", "Paraguay")

// console.log(`Nombre: ${personList}`)

