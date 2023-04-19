<?php

namespace Dao\Mnt;

use Dao\Table;

class Pasarela extends Table
{
    public static function ObtenerLibro(int $ID)
    {
        $sqlstr = "
        SELECT * FROM carrito where Libro = :ID";
        $sqlParams = array("ID" => $ID);
        return self::obtenerUnRegistro($sqlstr, $sqlParams);
    }


    public static function insert($Libro, $Usuario)
    {
        $sqlstr = "INSERT INTO `Carrito` ( `Libro`, `Usuario`) VALUES (:Libro, :Usuario)";
        $sqlParams = [
            "Libro" => $Libro,
            "Usuario" => $Usuario,
        ];
        return self::executeNonQuery($sqlstr, $sqlParams);
    }

    public static function insertAnon($Libro, $Usuario, $Sesion)
    {
        $sqlstr = "INSERT INTO `Carrito` (`Libro`, `Usuario`, `Sesion`) VALUES (:Libro, :Usuario, :Sesion)";
        $sqlParams = [
            "Libro" => $Libro,
            "Usuario" => $Usuario,
            "Sesion" => $Sesion
        ];
        return self::executeNonQuery($sqlstr, $sqlParams);
    }

    
    public static function Delete($Libro, $Usuario)
    {
        $sqlstr = "DELETE from carrito where Libro = :Libro and Usuario = :Usuario";
        $sqlParams = [
            "Libro" => $Libro,
            "Usuario" => $Usuario,
        ];
        return self::executeNonQuery($sqlstr, $sqlParams);
    }

    public static function DeleteSesion($IdSesion)
    {
        $sqlstr = "DELETE from carrito where ID = :IdSesion";
        $sqlParams = [
            "IdSesion" => $IdSesion,            
        ];
        return self::executeNonQuery($sqlstr, $sqlParams);
    }


    public static function CargarCarritoAnon($Sesion)
    {
        $sqlstr = "
        select b.ID, a.Sesion, a.Usuario, b.Titulo, b.Autor, b.Genero, b.Imagen, b.Genero, b.Idioma, b.Precio, b.Fecha from Carrito a inner join LibrosInventario b
        on a.Libro = b.ID 
        where a.Sesion = :Sesion";
        $sqlParams = array("Sesion" => $Sesion);
        return self::obtenerRegistros($sqlstr, $sqlParams);
    }

    public static function CargarCarrito($Usuario)
    {
        $sqlstr = "
        select b.ID, a.Sesion, a.Usuario, b.Titulo, b.Autor, b.Genero, b.Imagen, b.Genero, b.Idioma, b.Precio, b.Fecha from Carrito a inner join LibrosInventario b
        on a.Libro = b.ID 
        where a.Usuario = :Usuario";
        $sqlParams = array("Usuario" => $Usuario);
        return self::obtenerRegistros($sqlstr, $sqlParams);
    }


    public static function CarritoTotal($Usuario){
        $sqlstr = "
        select sum(b.Precio) as Total from Carrito a inner join LibrosInventario b
        on a.Libro = b.ID  
        where a.Usuario = :Usuario";
        $sqlParams = array("Usuario" => $Usuario);
        return self::obtenerRegistros($sqlstr, $sqlParams);
    }


    public static function CarritoCount($Usuario){
        $sqlstr = "
        select count(*) as LibrosCarrito from Carrito a inner join LibrosInventario b
        on a.Libro = b.ID 
        where a.Usuario = :Usuario";
        $sqlParams = array("Usuario" => $Usuario);
        return self::obtenerUnRegistro($sqlstr, $sqlParams);
    }

   
    public static function getById($Sesion)
    {
        $sqlstr = "SELECT b.ID from Carrito a inner join LibrosInventario b
        on a.Libro = b.ID 
        where a.Sesion = :Sesion";
        $sqlParams = array("Sesion" => $Sesion);
        return self::obtenerUnRegistro($sqlstr, $sqlParams);
    }

    public static function getIdSesion($Sesion)
    {
        $sqlstr = "SELECT ID from Carrito where Sesion = :Sesion";
        $sqlParams = array("Sesion" => $Sesion);
        return self::obtenerUnRegistro($sqlstr, $sqlParams);
    }

}
