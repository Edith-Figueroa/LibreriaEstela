<?php

namespace Dao\Mnt;

use Dao\Table;
use Monolog\Handler\WhatFailureGroupHandler;

class Historial extends Table
{
    public static function getAll($userCode)
    {
        $sqlstr = "SELECT a.Titulo, a.Precio, b.Fecha from librosinventario a inner join transacciones b
        ON a.ID = b.Libro inner join Usuario c
        ON b.Usuario = c.usercod
        where c.usercod = :userCode";
        $sqlParams = array("userCode" => $userCode);
        return self::obtenerRegistros($sqlstr, $sqlParams);
    }

    public static function insert($Libro, $Usuario)
    {
        $sqlstr = "INSERT INTO `transacciones` ( `Libro`, `Usuario`) VALUES (:Libro, :Usuario)";
        $sqlParams = [
            "Libro" => $Libro,
            "Usuario" => $Usuario,
        ];
        return self::executeNonQuery($sqlstr, $sqlParams);
    }

    public static function Total($Usuario){
        $sqlstr = "
        select sum(b.Precio) as Total from Transacciones a inner join LibrosInventario b
        on a.Libro = b.ID  
        where a.Usuario =:Usuario";
        $sqlParams = array("Usuario" => $Usuario);
        return self::obtenerRegistros($sqlstr, $sqlParams);
    }


    public static function TotalLibros($Usuario){
        $sqlstr = "
        select count(*) as Total from Transacciones a inner join LibrosInventario b
        on a.Libro = b.ID  
        where a.Usuario = :Usuario";
        $sqlParams = array("Usuario" => $Usuario);
        return self::obtenerRegistros($sqlstr, $sqlParams);
    }
}
