<?php
 namespace Controllers\Mnt;

use Controllers\PublicController;
use Views\Renderer;
use Dao\Mnt\Libros as DaoLibro;

class Visualizar extends PublicController
{
    private $viewData = array();
    public function run():void
    {
        $this->init();
        
        if (!$this->isPostBack()) {
            $this->procesarGet();
        }         
        
        $Libro = DaoLibro::obtenerLibro($this->viewData['LibroEncontrado']);
        
        $this->viewData["Libro"] = array();
        foreach($Libro as $Lb){
            $Lb['Imagen64'] = "data:image/jpg;base64," . base64_encode($Lb['Imagen']);          
            $Lb['Imagen65'] = "data:image/jpg;base64," . base64_encode($Lb['Imagen2']);          
            $this->viewData["Libro"][] = $Lb;
        }
        
        error_log(json_encode($this->viewData));      
        Renderer::render('mnt/visualizar', $this->viewData);
    }    


    private function init()
    {
        $this->viewData = array();        
        $this->viewData['LibroEncontrado']= '';                                    
    }


    private function procesarGet()
    {        
        if (isset($_GET["Libro"])) {
            $this->viewData["LibroEncontrado"] = intval($_GET["Libro"]);            
        }
    }
}

?>