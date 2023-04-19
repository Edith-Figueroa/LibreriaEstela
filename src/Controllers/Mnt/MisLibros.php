<?php
 namespace Controllers\Mnt;

use Controllers\PrivateController;
use Views\Renderer;
use Dao\Mnt\MisLibros as DaoMisLibros;

class MisLibros extends PrivateController
{
    private $viewData = array();    

    public function run():void
    {                
        $userId = \Utilities\Security::getUserId();

        $MisLibros = DaoMisLibros::ObtenerMisLibros($userId);

        $this->viewData["CargarLibros"] = array();
        
        foreach($MisLibros as $Lib){
            $Lib['Imagen64'] = "data:image/jpg;base64," . base64_encode($Lib['Imagen']);          
          $this->viewData["CargarLibros"][] = $Lib;
        }        

        $this->viewData["CantidadLibros"] = DaoMisLibros::CantidadLibros($userId);

        error_log(json_encode($this->viewData));
        Renderer::render('mnt/mislibros', $this->viewData);
    }
}

?>