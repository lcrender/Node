(() => {console.log(2 + 8)})();
//2
const createSkate = model => this.model = model;
console.log(createSkate("Skate Blind - Codey McEntrie 8.5"));
console.log(typeof createSkate)
//3
const personList = []
class Person {
    name
    constructor(name) {
        this.name = name
    }
}
/*function newPerson(name) {
    let createPerson = new Person (name)
    personList.push(createPerson)
}*/
function newPerson(name, fuerza, nacionalidad) {
    let createPerson = new Person (name, fuerza, nacionalidad)
    personList.push(createPerson)
}
newPerson("Diegote")
newPerson("Torrente")
console.log(personList[0].name)
//4
class Power {
    constructor(fuerza) {
    this.fuerza = fuerza
    }
}
class Person extends Power {
    name
    constructor(name, fuerza, nacionalidad){
        this.name = name
        super(fuerza);
        this.nacionalidad = nacionalidad;
    }
}


newPerson("Rambo", "100%", "Paraguay")
console.log(personList[2])