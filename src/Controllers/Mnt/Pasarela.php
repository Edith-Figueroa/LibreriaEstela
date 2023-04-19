<?php

namespace Controllers\Mnt;

use Controllers\PublicController;
use Dao\Dao;
use Views\Renderer;
use Dao\Mnt\Pasarela as DaoPasarela;
use Dao\Mnt\MisLibros as DaoMislibros;
use Dao\Mnt\Historial as DaoHistorial;
use Dao\Mnt\Libros as DaoLibros;
use Symfony\Component\VarDumper\VarDumper;

class Pasarela extends PublicController
{
    private $Libro = "";
    private $viewData = array();

    public function run(): void
    {
        $this->init();

        if (!$this->isPostBack()) {
            $this->procesarGet();
        }

        $userId = \Utilities\Security::getUserId();

        if ($userId === 0) {
            $Carrito = DaoPasarela::CargarCarritoAnon($this->viewData["Sesion"]);
            $this->viewData["CargarCarrito"] = array();
            foreach ($Carrito as $Carr) {
                $Carr['Imagen64'] = "data:image/jpg;base64," . base64_encode($Carr['Imagen']);
                $this->viewData["CargarCarrito"][] = $Carr;
            }
            $this->viewData["CargarTotal"] = DaoPasarela::CarritoTotal($userId);
        } else {
            $this->viewData["CantidadLibros"] = DaoPasarela::CarritoCount($userId);

            $Carrito = DaoPasarela::CargarCarrito($userId);
            $this->viewData["CargarCarrito"] = array();
            foreach ($Carrito as $Carr) {
                $Carr['Imagen64'] = "data:image/jpg;base64," . base64_encode($Carr['Imagen']);
                $this->viewData["CargarCarrito"][] = $Carr;
            }
            $this->viewData["CargarTotal"] = DaoPasarela::CarritoTotal($userId);
        }

        error_log(json_encode($this->viewData));
        Renderer::render('mnt/pasarela', $this->viewData);
    }


    private function init()
    {
        $this->viewData = array();
        $this->viewData["mode"] = "";
        $this->viewData['ID'] = "";
        $this->viewData["crsf_token"] = "";
        $this->viewData["Sesion"] = "";
        $this->viewData["Cantidad"] = false;

        //Datos Libro        
        $this->viewData["ProductoNombre"] = "";
        $this->viewData["Precio"] = "";
        $this->viewData["Descripcion"] = "";

        $userId = \Utilities\Security::getUserId();

        if ($userId === 0) {
            $this->viewData['Loggeado'] = false;
            $this->viewData['NoLoggeado'] = true;
        } else {
            $this->viewData['Loggeado'] = true;
            $this->viewData['NoLoggeado'] = false;
        }

        if (isset($_SESSION['SesionAnonima'])) {
            $this->viewData["Sesion"] = $_SESSION['SesionAnonima'];
        }

        $Cantidad = DaoPasarela::CarritoCount($userId);

        if ($Cantidad["LibrosCarrito"] > 0) {
            $this->viewData["Cantidad"] = true;
        } else {
            $this->viewData["Cantidad"] = false;
        }

        $this->arrModeDesc = array(
            "ADD" => "Detalle de %s %s",
            "DEL" => "Detalle de %s %s",
        );
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
            $this->Libro = DaoLibros::obtenerLibro($this->viewData["ID"]);
        }

        switch ($this->viewData["mode"]) {
            case 'ADD':
                $PayPalOrder = new \Utilities\Paypal\PayPalOrder(
                    "test" . (time() - 10000000),
                    "http://localhost/ProyectoFinal/index.php?page=mnt_index",
                    "http://localhost/ProyectoFinal/index.php?page=checkout_accept"
                );
                $Precio = $this->Libro[0]["Precio"];
                $Precio = round($Precio / 24.23);
                
                $PayPalOrder->addItem($this->Libro[0]["Titulo"], "Libro", "PRD1", $Precio, 0, 1, "DIGITAL_GOODS");

                $_SESSION["ID"] = $this->viewData["ID"];                

                $response = $PayPalOrder->createOrder();
                $_SESSION["orderid"] = $response[1]->result->id;
                \Utilities\Site::redirectTo($response[0]->href);

                break;
            case 'DEL':
                $result = DaoPasarela::delete(
                    $this->viewData["ID"],
                    \Utilities\Security::getUserId()
                );
                if ($result) {
                    \Utilities\Site::redirectTo(
                        "index.php?page=mnt_pasarela",
                    );
                }
                break;
        }
    }
}
