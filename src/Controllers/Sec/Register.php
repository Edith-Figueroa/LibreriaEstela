<?php

namespace Controllers\Sec;

use Controllers\PublicController;
use \Utilities\Validators;
use Exception;
use \Dao\Security\Security as Seguridad;

class Register extends PublicController
{
    private $txtEmail = "";
    private $txtPswd = "";
    private $Usuario = "";
    private $userId = "";
    private $errorEmail ="";
    private $errorPswd = "";
    private $hasErrors = false;
    public function run() :void
    {        
        if ($this->isPostBack()) {
            $this->txtEmail = $_POST["txtEmail2"];
            $this->txtPswd = $_POST["txtPswd2"];
            $this->Usuario = $_POST["txtUsuario"];
            //validaciones
            if (!(Validators::IsValidEmail($this->txtEmail))) {
                $this->errorEmail = "El correo no tiene el formato adecuado";
                $this->hasErrors = true;
            }
            if (!Validators::IsValidPassword($this->txtPswd)) {
                $this->errorPswd = "La contraseña debe tener al menos 8 caracteres una mayúscula, un número y un caracter especial.";
                $this->hasErrors = true;
            }
            
            if (!$this->hasErrors) {
                try{                    
                    if (Seguridad::newUsuario($this->txtEmail, $this->txtPswd, $this->Usuario)){
                        $this->userId = Seguridad::getUsuarioByEmail($this->txtEmail);
                        Seguridad::createRol($this->userId["usercod"]);
                        \Utilities\Site::redirectToWithMsg("index.php?page=sec_login", "¡Usuario Registrado Satisfactoriamente!");
                    }
                } catch (Error $ex){
                    die($ex);
                }
            }
        }
        $viewData = get_object_vars($this);
        \Views\Renderer::render("security/sigin", $viewData);
    }
}
?>
