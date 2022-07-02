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
