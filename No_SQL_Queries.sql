/*Cristopher Rondon*/
/*Query 1*/
db.universitario.find({edad: {$lte:23}},{nombre:1,apellido:1,edad:1});
/*Query 2*/
db.universidad.find({provincia:"Lima"});

/*Italo Clavijo*/
/*Query 1*/
db.universitario.find({$or: [{genero:"F"},{edad: {$lt: 25}},{_id:0,carrera:0,email:0,}]});
/*Query 2*/
db.universitario.find({$or: [{genero:"M"},{edad: {$lt: 20}},{carrera:"Ingeneria de Petroleo"},{_id:0,carrera:0,email:0,}]});

/*Omar Huaman*/
/*Query 1*/
/*Busqueda de universitarios mayores a 20 años*/
db.universitario.aggregate([
    {$match:{edad:{$gte:20}}},
    {$group:{_id:"$year", quantity: {$count:{}}}}
]);
/*Query 2*/
/*Universitarios que estan ubicados en Ate*/
db.universidad.find({distrito: "Ate"},{_id:0});

/*Stalin Ramos*/
/*Query 1*/
/*La cantidad de universidades por distrito*/
db.universidad.aggregate([
    {$group:{_id:"$distrito", quantity: {$count:{}}}}
]);
/*Query 2*/
/*Universitarios que esten en la carrera de Ingenieria de Sistemas*/
db.universitario.find({carrera:"Ingenieria de sistemas"},{_id:0, genero:0, edad:0, email:0,});

/*Bruno Orue*/
/*Query 1*/
/*universitarios que se diferencie segun su genereo (masculino o femenino)*/
db.universitario.find({$or: [{genero:"M"}]})
