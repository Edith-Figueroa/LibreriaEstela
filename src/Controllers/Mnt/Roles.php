<?php

namespace Controllers\Mnt;

use Controllers\PrivateController;

class Roles extends PrivateController{
    public function run():void
    {
        $viewData = array();
        $viewData["Roles"] = \Dao\Security\Security::AllRolls();
        
        $viewData["CanInsert"] = self::isFeatureAutorized("Controllers\Mnt\Roles\New");
        $viewData["CanUpdate"] = self::isFeatureAutorized("Controllers\Mnt\Roles\Upd");
        $viewData["CanDelete"] = self::isFeatureAutorized("Controllers\Mnt\Roles\Del");
        $viewData["CanView"] = self::isFeatureAutorized("Controllers\Mnt\Roles\Dsp");

        \Views\Renderer::render("mnt/roles", $viewData);
    }
}

?>
