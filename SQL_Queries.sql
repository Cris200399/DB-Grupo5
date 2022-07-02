/*Cristopher Rondon Añaños*/
/*Query 1*/
CREATE FUNCTION f_max_inmueble_per_arr() returns TABLE
AS RETURN
  SELECT TOP 1 nombre, Quantity FROM
  (SELECT nombre, COUNT(Inmueble.arrendatario_id) Quantity FROM Arrendatario 
      JOIN Inmueble ON Inmueble.arrendatario_id = Arrendatario.id 
      GROUP BY nombre)  
  as Result ORDER BY Quantity DESC
SELECT * FROM f_max_inmueble_per_arr()
/*Query 2*/
CREATE PROCEDURE sp_find_by_district
  @district_id int 
AS
BEGIN
  SELECT d.id, nombre, provincia, arrendatario_id, precio, cbaños, area, direccion
  FROM Distrito D, Inmueble I
  WHERE I.distrito_id = @district_id AND D.id = @district_id
END;

/*Italo Clavijo*/
/*Query 1*/
CREATE PROCEDURE sp_propiedades_cantidad_de_area @area_input int as
    BEGIN
        SELECT nombre, COUNT (*)
        FROM Inmueble Inmu
        JOIN Arrendatario Arr on Inmu.arrendatario_id = Arr.id
        WHERE area >= @area_input
        GROUP BY nombre
    END;
/*Query 2*/
SELECT universidad_id, COUNT (universidad_id) AS Total_Por_Universidad
FROM Universitario
GROUP BY universidad_id
ORDER BY Total_Por_Universidad DESC

/*Bruno Orue*/
/*Query 1*/
CREATE PROCEDURE sp_buscar_inmueble_por_id @id_input int as
    begin
        select distrito_id,precio,cbaños,area,direccion
        from Inmueble
        where Inmueble.id = @id_input
        group by distrito_id, precio, cbaños, area, direccion
    END;
   
/*Omar Huaman*/
/*Query 1*/
        SELECT Arrendatario_id, COUNT ( Arrendatario_id) AS Total_En_Propiedades
        FROM Inmueble
        GROUP BY Arrendatario_id
        ORDER BY Total_En_Propiedades DESC
  /*Query 2*/   
    CREATE PROCEDURE sp_propiedades_precio_menor @precio_input int as
    BEGIN
        SELECT nombre, COUNT (*)
        FROM Inmueble P
        JOIN Arrendatario S on P.arrendatario_id = S.id
        WHERE precio <= @precio_input
        GROUP BY nombre
    END;
    
    EXECUTE sp_propiedades_precio_menor 400
    
    
 /*Stalin Ramos*/
 /*Query 1*/
        SELECT Distrito_id, COUNT ( Distrito_id) AS Total_En_Distrito
        FROM Inmueble
        GROUP BY Distrito_id
        ORDER BY Total_En_Distrito DESC
 /*Query 2*/   
    ALTER PROCEDURE sp_propiedades_by_arrendador @Arrendatario_id int as
    begin 
      select nombre, Apellido, precio, area, direccion
      from Inmueble P
          join Arrendatario S on P.Arrendatario_id = S.id
      where Arrendatario_id = @Arrendatario_id
    end;
    EXECUTE sp_propiedades_by_arrendador @Arrendatario_id:2
    
