<?php

namespace Controllers\Mnt;

use Controllers\PublicController;
use Dao\Security\Security as Seguridad;
use Utilities\Validators;
use Views\Renderer;

class Usuario extends PublicController
{
    private $viewData = array();
    private $arrModeDesc = array();


    public function run(): void
    {
        $this->init();                
        // Cuando es método GET (se llama desde la lista)
        if (!$this->isPostBack()) {
            $this->procesarGet();
        }

        $this->viewData["TodosLosRoles"] = Seguridad::AllRolls();
        $this->viewData["RolesUsuario"] = Seguridad::getRolesByUsuario($this->viewData["usercod"]);

        $this->processView();
        Renderer::render('mnt/usuario', $this->viewData);
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

        //Datos del usuario
        $this->viewData["Rol"] = "";
        $this->viewData["usercod"] = "";        
        $this->viewData["useremail"] = '';
        $this->viewData["username"] = '';
        $this->viewData["userest"] = '';
        $this->viewData["usertipo"] = '';                   

        $this->arrModeDesc = array(
            "ADD" => "",
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
                error_log('Error: (Usuarios) Mode solicitado no existe.');
                \Utilities\Site::redirectToWithMsg(
                    "index.php?page=mnt_usuarios",
                    "No se puede procesar su solicitud!"
                );
            }
        }

        if ($this->viewData["mode"] !== "INS" && isset($_GET["id"])) {                        
            $this->viewData["usercod"] =  $_GET["id"];                                                           
            $tmpUsuario = Seguridad::getUsuarioById($this->viewData["usercod"]);
            error_log(json_encode($tmpUsuario));
            \Utilities\ArrUtils::mergeFullArrayTo($tmpUsuario, $this->viewData);           
        }        

        if(isset($_GET["Rol"]) && isset($_GET["id"])){
            $this->viewData["Rol"] = $_GET["Rol"];                        
            $this->viewData["usercod"] =  intval($_GET["id"]);            
        }        



        switch($this->viewData["mode"]){
            case "ADD":                                
                Seguridad::InsertRolUser($this->viewData["usercod"],$this->viewData["Rol"]);                
                break;                
            case "DEL":                                                
                Seguridad::removeRolFromUser($this->viewData["usercod"], $this->viewData["Rol"]);
                break;
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
                $this->viewData["disabled"] = true;                    
            }
            if ($this->viewData["mode"] === "DEL") {
                $this->viewData["readonly"] = true;
                $this->viewData["disabled"] = true;                
            }
            if ($this->viewData["mode"] === "UPD") {
                $this->viewData["readonly"] = false;                                
            }
        }
        $this->viewData["crsf_token"] = md5(getdate()[0] . $this->name);
        $_SESSION[$this->name . "crsf_token"] = $this->viewData["crsf_token"];
    }
}
