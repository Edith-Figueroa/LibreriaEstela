<?php

namespace Controllers\Mnt;

use Controllers\PublicController;
use Views\Renderer;
use Dao\Mnt\Libros as DaoLibro;
use Dao\Mnt\Pasarela as DaoPasarela;

class Compra extends PublicController
{    
    private $viewData = array();
    public function run(): void
    {
        $this->init();

        if (!$this->isPostBack()) {
            $this->procesarGet();
        }

        if ($this->isPostBack()) {
            $this->procesarPost();
        }

        $Libro = DaoLibro::obtenerLibro($this->viewData['ID']);

        $this->viewData["Compra"] = array();
        foreach ($Libro as $Lb) {
            $Lb['Imagen64'] = "data:image/jpg;base64," . base64_encode($Lb['Imagen']);
            $this->viewData["Compra"][] = $Lb;
        }
        
        $this->processView();        
        Renderer::render('mnt/compra', $this->viewData);
    }


    private function init()
    {
        $this->viewData = array();
        $this->viewData["mode"] = "";
        $this->viewData['ID'] = "";        
        $this->viewData["crsf_token"] = "";

        $this->arrModeDesc = array(
            "Compra" => "Detalle de %s %s",
        );        
    }    
    
    private function genera_codigo ($longitud) {
        $caracteres = array("0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z");
        $codigo = '';
        for ($i = 1; $i <= $longitud; $i++) {
            $codigo .= $caracteres[$this->numero_aleatorio(0, 35)];
        }
        return $codigo;
    }
    
    private function numero_aleatorio ($ninicial, $nfinal) {
        $numero = rand($ninicial, $nfinal);
        return $numero;
    }

    private function procesarGet()
    {
        if (isset($_GET["mode"])) {
            $this->viewData["mode"] = $_GET["mode"];

            if (!isset($this->arrModeDesc[$this->viewData["mode"]])) {
                error_log('Error: (Libro) Mode solicitado no existe.');
                \Utilities\Site::redirectToWithMsg(
                    "index.php?page=mnt_index",
                    "No se puede procesar su solicitud!"
                );
            }
        }

        if (isset($_GET["id"])) {
            $this->viewData["ID"] = $_GET["id"];
        }
    }

    private function procesarPost()
    {        
        \Utilities\ArrUtils::mergeArrayTo($_POST, $this->viewData);
        error_log(json_encode($this->viewData));
        if (
            isset($_SESSION[$this->name . "crsf_token"])
            && $_SESSION[$this->name . "crsf_token"] !== $this->viewData["crsf_token"]
        ) {            
            \Utilities\Site::redirectTo(
                "index.php?page=mnt_index",
                "ERROR: Algo inesperado sucedió con la petición Intente de nuevo."
            );
        }                

        if (isset($_SESSION['SesionAnonima'])){        
            echo "Sesión Anonima: " . $_SESSION['SesionAnonima'];    
        }else{            
            $Codigo = $this->genera_codigo(6);
            $_SESSION["SesionAnonima"] = $Codigo;
        }

        switch ($this->viewData["mode"]) {
            case 'Compra':
                $IdUser = \Utilities\Security::getUserId();

                if($IdUser === 0){
                    $Sesion = $_SESSION["SesionAnonima"];
                    $result = DaoPasarela::insertAnon(
                        $this->viewData["ID"],
                        $IdUser,                        
                        $Sesion
                    );
                    if ($result) {
                        \Utilities\Site::redirectTo(
                            "index.php?page=mnt_pasarela"                        
                        );
                    }
                }else{
                    $result = DaoPasarela::insert(
                        $this->viewData["ID"],
                        $IdUser
                    );
                    if ($result) {
                        \Utilities\Site::redirectTo(
                            "index.php?page=mnt_pasarela"                        
                        );
                    }
                }
                break;
        }
    }
    private function processView()
    {        
        $this->viewData["crsf_token"] = md5(getdate()[0] . $this->name);
        $_SESSION[$this->name . "crsf_token"] = $this->viewData["crsf_token"];
    }
}

?>