<?php
namespace Controllers\Sec;
class Logout extends \Controllers\PublicController
{
    public function run():void
    {
        unset($_SESSION['SesionAnonima']);
        \Utilities\Security::logout();
        \Utilities\Site::redirectTo("index.php?page=mnt-index");        
    }
}

?>
