const firstName = "Aldo";
const surName = "Bonzi";
const message = `Nombre: ${firstName}
Apellido: ${surName}`;
//Esta funcion le añade 4 años a la fecha actual para establecer la fecha de renovacion del documento
function expirationDate() {
    let date = new Date();
    let year = date.getFullYear();
    let expirationDate = year + 4;
    let output = String(date.getDate()).padStart(2, '0') + '/' + String(date.getMonth() + 1).padStart(2, '0') + '/' + expirationDate;
    return output;
}
console.log(
`${message}

Felizitaciones su licencia de conducir a sido renovada.
    
Proximo vencimiento: ${expirationDate()}


`);
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