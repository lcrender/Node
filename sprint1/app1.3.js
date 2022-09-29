//nivel 1 ejercicio 1
const haveBalance = true;
const balance = new Promise((resolve, reject) => {
    if(haveBalance === true) {
        const balanceDetails = {
            Eur: 8000,
            Usd: 7300,
            Ars: 2843578 
        }
        resolve(balanceDetails);
    } else {
        reject(new Error("No hay saldo en su cuenta."))
    }
});
balance
    .then( res => {
        console.log("El saldo total del usuario x es de:");
        console.log(res);
        console.log(`
fin de consulta

`)
    })
    .catch( err => {
        console.log(err.message);
    });
    //nivel 1 ejercicio 2
    const message = (age, callback) => {
        const userAge = age
        callback(userAge);
    }
    let saludo = age => { 
        if(age > 17) {
            console.log("Bienvenido");
        }
        else { console.log(`No eres bienvenido`)}
    }
    message(19, saludo);
    //3
    let employees = [{
        id: 1,
        name: 'Linux Torvalds'
    }, {
        id: 2,
        name: 'Bill Gates'
    },{
        id: 3,
        name: 'Jeff Bezos'
    }];
    let salaries = [{
        id: 1,
        salary: 4000
    }, {
        id: 2,
        salary: 1000
    }, {
        id: 3,
        salary: 2000
    }]; 
    const getEmployee = (searchId) => {
        return new Promise((result, reject) => {
            let i = 0;
            let clientFound = false;
            while (i < employees.length && clientFound === false) {
                if (searchId === employees[i].id) {
                    clientFound = true;
                    const employeeName = employees[i].name
                    const employeesFound = { Nombre: employeeName}
                    result(employeesFound);
                 } 
                else {i++}
                } // termina el buscador
                if (clientFound === false) {
                    reject(new Error("Empleado no encontrado."))
                }    
        } ); //fin promesa
    }
    const getSalary = (searchId) => {
        return new Promise((result, reject) => {
            let i = 0;
            let clientFound = false;
            while (i < employees.length && clientFound === false) {
                if (searchId === employees[i].id) {
                    clientFound = true;
                    const employeeSalary = salaries[i].salary
                    const salariesFound = { Salario: employeeSalary}
                    result(salariesFound);
                 } 
                else {i++}
                } // termina el buscador
                if (clientFound === false) {
                    reject(new Error("Usuario no encontrado."))
                }    
        } ); //fin promesa
    }
    const search = (id) => {
        getEmployee(id)
            .then( res => {
                console.log("Usuario Encontrado");
                console.log(res);
            })
            .catch( err => {
                console.log(err.message);
            });
        getSalary(id)
            .then( res => {
                console.log(res);
            })
            .catch( err => {
            });
    }
    //busqueda de usuario
    search(1)
    
