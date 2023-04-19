<?php

namespace Dao\Mnt;

use Dao\Table;

class MisLibros extends Table
{
    public static function Insert($Libro, $Usuario)
    {
        $sqlstr = "INSERT INTO mislibros (`ID`, `IdLibro`,`IdUsuario`) VALUES(:Libro, :Libro, :Usuario)";
        $sqlParams = array("Libro" => $Libro, "Usuario" => $Usuario);
        return self::executeNonQuery($sqlstr, $sqlParams);
    }

    public static function ObtenerMisLibros(int $ID)
    {
        $sqlstr = "
        select c.username as Usuario, a.IdUsuario ,b.* from MisLibros a inner join librosInventario b 
        ON a.IdLibro = b.ID inner join Usuario c  ON c.usercod = a.IdUsuario where a.IdUsuario = :ID";
        $sqlParams = array("ID" => $ID);
        return self::obtenerRegistros($sqlstr, $sqlParams);
    }

    public static function CantidadLibros(int $ID){
        $sqlstr = "
        select count(*) as CantidadLibros from MisLibros a inner join librosInventario b 
        ON a.IdLibro = b.ID inner join Usuario c  ON c.usercod = a.IdUsuario where a.IdUsuario = :ID";
        $sqlParams = array("ID" => $ID);
        return self::obtenerRegistros($sqlstr, $sqlParams);
    }
}
