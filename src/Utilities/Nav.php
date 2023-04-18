<?php

namespace Utilities;

class Nav {

    public static function setNavContext(){
        $tmpNAVIGATION = array();
        $userID = \Utilities\Security::getUserId();
        
        if (\Utilities\Security::isAuthorized($userID, "MntUsuarios")) {
            $tmpNAVIGATION[] = array(
                "nav_url" => "index.php?page=mnt_usuarios",
                "nav_label" => "Usuarios",                
            );
        }
        if (\Utilities\Security::isAuthorized($userID, "MntRoles")) {
            $tmpNAVIGATION[] = array(
                "nav_url" => "index.php?page=mnt_roles",
                "nav_label" => "Roles",                
            );
        }

        if (\Utilities\Security::isAuthorized($userID, "MntLibros")) {
            $tmpNAVIGATION[] = array(
                "nav_url" => "index.php?page=mnt_libros",
                "nav_label" => "Libros del sistema",                
            );
        }

        if (\Utilities\Security::isAuthorized($userID, "MntMisLibros")) {
            $tmpNAVIGATION[] = array(
                "nav_url" => "index.php?page=mnt_Mislibros",
                "nav_label" => "Mis Libros",                
            );
        }        
       
        \Utilities\Context::setContext("NAVIGATION", $tmpNAVIGATION);
    }


    private function __construct()
    {
        
    }
    private function __clone()
    {
        
    }
}
?>
