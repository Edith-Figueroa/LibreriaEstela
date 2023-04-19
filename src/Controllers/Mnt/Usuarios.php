<?php

namespace Controllers\Mnt;

use Controllers\PrivateController;

class Usuarios extends PrivateController{
    public function run():void
    {
        $viewData = array();
        $viewData["Usuarios"] = \Dao\Security\Security::getUsuarios();
        $viewData["CanInsert"] = self::isFeatureAutorized("Controllers\Mnt\Usuario\New");
        $viewData["CanUpdate"] = self::isFeatureAutorized("Controllers\Mnt\Usuario\Upd");
        $viewData["CanDelete"] = self::isFeatureAutorized("Controllers\Mnt\Usuario\Del");
        $viewData["CanView"] = self::isFeatureAutorized("Controllers\Mnt\Usuario\Dsp");
        \Views\Renderer::render("mnt/usuarios", $viewData);
    }
}


?>
