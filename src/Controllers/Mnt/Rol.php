<?php

namespace Controllers\Mnt;

use Controllers\PublicController;
use Dao\Security\Security as Seguridad;
use Utilities\Validators;
use Views\Renderer;

class Rol extends PublicController
{
    private $viewData = array();
    private $arrModeDesc = array();
    private $hasErrors = false;

    public function run(): void
    {
        $this->init();
        // Cuando es método GET (se llama desde la lista)
        if (!$this->isPostBack()) {
            $this->procesarGet();
        }

        if ($this->isPostBack()) {
            $this->procesarPost();
        }
        
        $UnaFuncion = Seguridad::getFeatureRoles($this->viewData["rolescod"]);
        
        foreach($UnaFuncion as $Funcion){
            $Funcion['FncodSg'] = str_replace('\\', '-', $Funcion["fncod"]);          
            $this->viewData["Funciones"][] = $Funcion;            
        }

         $Funciones = Seguridad::AllFeatures();
         foreach($Funciones as $Funcion){
            $Funcion['FncodSg'] = str_replace('\\', '-', $Funcion["fncod"]);          
            $this->viewData["TodasFunciones"][] = $Funcion;            
        }

        $this->processView();
        Renderer::render('mnt/rol', $this->viewData);
    }

    private function init()
    {
        $this->viewData = array();
        $this->viewData["mode"] = "";
        $this->viewData["mode_desc"] = "";
        $this->viewData["btnEnviarText"] = "Guardar";
        $this->viewData["readonly"] = false;
        $this->viewData["disabled"] = false;
        $this->viewData["showBtn"] = true;
        $this->viewData["crsf_token"] = "";

        //Errores de campos vacios
        $this->viewData["error_rolescod"] = array();
        $this->viewData["error_rolesdsc"] = array();
        $this->viewData["error_rolesest"] = array();

        //Datos del rol
        $this->viewData["rolescod"] = '';
        $this->viewData["rolesdsc"] = '';
        $this->viewData["rolesest"] = '';

        $this->viewData["fncod"] = '';
        $this->viewData["Rol"] = '';

        $this->arrModeDesc = array(
            "ADD" => "",
            "INS" => "",
            "UPD" => "Editando %s %s",
            "DSP" => "Detalle de %s %s",
            "DEL" => "Eliminado %s %s"
        );
    }

    private function procesarGet()
    {
        if (isset($_GET["mode"])) {
            $this->viewData["mode"] = $_GET["mode"];

            if (!isset($this->arrModeDesc[$this->viewData["mode"]])) {
                error_log('Error: (Rol) Mode solicitado no existe.');
                \Utilities\Site::redirectToWithMsg(
                    "index.php?page=mnt_roles",
                    "No se puede procesar su solicitud!"
                );
            }
        }

        if ($this->viewData["mode"] !== "INS" && isset($_GET["id"])) {
            $this->viewData["rolescod"] = $_GET["id"];
            $tpmRol = Seguridad::getRoles($this->viewData["rolescod"]);
            error_log(json_encode($tpmRol));
            \Utilities\ArrUtils::mergeFullArrayTo($tpmRol, $this->viewData);
        }

        if (isset($_GET["Fncod"]) && isset($_GET["Rol"])) {
             $fncod = $_GET["Fncod"];                                     
             $this->viewData["fncod"] = str_replace('-', '\\', $fncod);                         
            $this->viewData["Rol"] =  $_GET["Rol"];
        }

        switch ($this->viewData["mode"]) {
            case "ADD":                
                Seguridad::InsertFunRol($this->viewData["Rol"], $this->viewData["fncod"]);                
                break;
            case "DEL":
                Seguridad::removeFunFromRol($this->viewData["Rol"], $this->viewData["fncod"]);                
                break;
        }
    }

    private function CampoVacio($Campo)
    {
        if (Validators::IsEmpty($this->viewData["$Campo"])) {
            $this->viewData["error_$Campo"][]
                = "El $Campo del Rol es requerido";
            $this->hasErrors = true;
        }
    }

    private function procesarPost()
    {
        \Utilities\ArrUtils::mergeArrayTo($_POST, $this->viewData);
        if (
            isset($_SESSION[$this->name . "crsf_token"])
            && $_SESSION[$this->name . "crsf_token"] !== $this->viewData["crsf_token"]
        ) {
            \Utilities\Site::redirectToWithMsg(
                "index.php?page=mnt_roles",
                "ERROR: Algo inesperado sucedió con la petición Intente de nuevo."
            );
        }

        $this->CampoVacio("rolescod");
        $this->CampoVacio("rolesdsc");
        $this->CampoVacio("rolesest");


        if (!$this->hasErrors) {
            $result = null;

            switch ($this->viewData["mode"]) {
                case 'INS':
                    $result = Seguridad::addNewRol(
                        $this->viewData["rolescod"],
                        $this->viewData["rolesdsc"],
                        $this->viewData["rolesest"],
                    );
                    if ($result) {
                        \Utilities\Site::redirectToWithMsg(
                            "index.php?page=mnt_roles",
                            "el rol se ha Guardado Satisfactoriamente!"
                        );
                    }
                    break;
            }
        }
    }

    private function processView()
    {
        if ($this->viewData["mode"] === "INS") {
            $this->viewData["mode_desc"]  = $this->arrModeDesc["INS"];
            $this->viewData["btnEnviarText"] = "Guardar";
        } else {
            if ($this->viewData["mode"] === "DSP") {
                $this->viewData["readonly"] = true;
                $this->viewData["showBtn"] = false;
            }
            if ($this->viewData["mode"] === "DEL") {
                $this->viewData["readonly"] = true;
                $this->viewData["btnEnviarText"] = "Eliminar";
            }
            if ($this->viewData["mode"] === "UPD") {
                $this->viewData["readonly"] = false;
                $this->viewData["btnEnviarText"] = "Actualizar";
            }
        }
        $this->viewData["crsf_token"] = md5(getdate()[0] . $this->name);
        $_SESSION[$this->name . "crsf_token"] = $this->viewData["crsf_token"];
    }
}
