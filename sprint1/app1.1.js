//Nivel uno, ejercicio 1 / Nivel 2 ejercicio 2
function myName(userName, name, sur) {
const user = userName;
const firstName = name
const surName = sur
const messageOne = `
Nombre de usuario: ${userName}

Nombre: ${firstName}
Apellido: ${surName}
`
//console.log(messageOne)
return messageOne
}

console.log(myName("aldob", "Aldo", "Bonzi"))
const finEj = `_________________
`
console.log(finEj)

//Nivel 2
//Esta funcion le añade 4 años a la fecha actual para establecer la fecha de renovacion del documento
function expirationDate() {
    let date = new Date();
    let year = date.getFullYear();
    let expirationDate = year + 4;
    let output = String(date.getDate()).padStart(2, '0') + '/' + String(date.getMonth() + 1).padStart(2, '0') + '/' + expirationDate;
    return output;
}
console.log(
`${myName("aldob", "Aldo", "Bonzi")}

Felizitaciones su licencia de conducir a sido renovada.
    
Proximo vencimiento: ${expirationDate()}


`);
console.log(finEj)

//nivel 3
function funcCounter(){
    let array = []
    let i = 0
    do {
        array.push(i)
        i++
    }
    while (i < 10)
    console.log(array)
};
let counter = 0
do {
funcCounter()
counter++
}
while
(counter < 10)
//ejercicio n3.2
var myApp = (function(){
    var name = 'Aldo';
    return{
      name : name
    }
  })();
   
  console.log( myApp.name );
