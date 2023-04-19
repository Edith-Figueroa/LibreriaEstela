<?php

namespace Controllers\Mnt;

use Controllers\PublicController;
use Views\Renderer;
use Dao\Mnt\Historial as DaoHistorial;

class Historial extends PublicController
{
    private $viewData = array();      

    public function run():void
    {   

        $this->init();

        // Cuando es método GET (se llama desde la lista)
        if (!$this->isPostBack()) {
            $this->procesarGet();
        }

        $this->viewData["Historial"] = DaoHistorial::getAll($this->viewData["ID"]);        
        $this->viewData["Total"] = DaoHistorial::Total($this->viewData["ID"]);        
        $this->viewData["TotalLibros"] = DaoHistorial::TotalLibros($this->viewData["ID"]);        
        error_log(json_encode($this->viewData));
        Renderer::render('mnt/historial', $this->viewData);
    }


    private function init()
    {
        $this->viewData = array();        
        $this->viewData["ID"] = "";        
    }

    private function procesarGet()
    {        
        if (isset($_GET["id"])) {
            $this->viewData["ID"] = intval($_GET["id"]);            
        }
    }

}




