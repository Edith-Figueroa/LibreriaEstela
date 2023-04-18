<?php

namespace Controllers\Checkout;

use Controllers\PublicController;

class Checkout extends PublicController{
    public function run():void
    {
        $viewData = array();
        if ($this->isPostBack()) {
            $PayPalOrder = new \Utilities\Paypal\PayPalOrder(
                "test".(time() - 10000000),
                "http://localhost/ProyectoFinal/index.php?page=checkout_error",
                "http://localhost/ProyectoFinal/index.php?page=checkout_accept"
            );
            $PayPalOrder->addItem("Test", "TestItem1", "PRD1", 100, 15, 1, "DIGITAL_GOODS");

            $response = $PayPalOrder->createOrder();
            $_SESSION["orderid"] = $response[1]->result->id;
            \Utilities\Site::redirectTo($response[0]->href);
            die();
        }

        \Views\Renderer::render("paypal/checkout", $viewData);
    }
}
?>
