<?php

namespace Controllers\Checkout;

use Controllers\PublicController;
use Dao\Mnt\MisLibros as DaoMislibros;
use Dao\Mnt\Historial as DaoHistorial;
use Dao\Mnt\Pasarela as DaoPasarela;

class Accept extends PublicController{
    public function run():void
    {
        $dataview = array();
        $token = $_GET["token"] ?: "";
        $session_token = $_SESSION["orderid"] ?: "";
        $ID = $_SESSION["ID"];
        
        if ($token !== "" && $token == $session_token) {
            $result = \Utilities\Paypal\PayPalCapture::captureOrder($session_token);
            //insertamos en la biblioteca del usuario
            DaoMislibros::Insert($ID, \Utilities\Security::getUserId());
            //Eliminamos el producto de la pasarela
            DaoPasarela::delete($ID, \Utilities\Security::getUserId());
            //Insertamos el producto en el historial del usuario
            DaoHistorial::insert($ID, \Utilities\Security::getUserId());
            $dataview["orderjson"] = json_encode($result, JSON_PRETTY_PRINT);
            \Utilities\Site::redirectTo(
                "http://localhost/ProyectoFinal/index.php?page=mnt_mislibros"
            );
            
        } else {
            $dataview["orderjson"] = "No Order Available!!!";
        }
        \Views\Renderer::render("paypal/accept", $dataview);
    }
}

?>
