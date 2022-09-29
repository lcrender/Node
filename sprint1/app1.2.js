(() => {console.log(2 + 8)})();
//2
const createScenery = scenary => this.scenary = scenary;
console.log(createScenery("Ciudad Gotica"));
console.log(typeof createScenery)

class Person {
    name
    constructor(name) {
    this.name = name
    }
}
class Power extends Person {
    constructor(name, nacionalidad, fuerza){
        super(name);
        this.nacionalidad = nacionalidad;
        this.fuerza = fuerza;
    }
}
const personList = []
function newPerson(name, nacionalidad, fuerza) {
    let createPerson = new Power (name, nacionalidad, fuerza)
    personList.push(createPerson)
}
newPerson("Batman", "Paraguay", "100%")
console.log(personList[0])
