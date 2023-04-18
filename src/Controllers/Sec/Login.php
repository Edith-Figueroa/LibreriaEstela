<?php

namespace Controllers\Sec;

use Dao\Mnt\Pasarela as DaoPasarela;

class Login extends \Controllers\PublicController
{
    private $txtEmail = "";
    private $txtPswd = "";
    private $errorEmail = "";
    private $errorPswd = "";
    private $generalError = "";
    private $hasError = false;

    public function run(): void
    {
        if ($this->isPostBack()) {
            $this->txtEmail = $_POST["txtEmail"];
            $this->txtPswd = $_POST["txtPswd"];

            if (!\Utilities\Validators::IsValidEmail($this->txtEmail)) {
                $this->errorEmail = "¡Correo no tiene el formato adecuado!";
                $this->hasError = true;
            }
            if (\Utilities\Validators::IsEmpty($this->txtPswd)) {
                $this->errorPswd = "¡Debe ingresar una contraseña!";
                $this->hasError = true;
            }
            if (!$this->hasError) {
                if ($dbUser = \Dao\Security\Security::getUsuarioByEmail($this->txtEmail)) {
                    if ($dbUser["userest"] != \Dao\Security\Estados::ACTIVO) {
                        $this->generalError = "¡Credenciales son incorrectas!";
                        $this->hasError = true;
                        error_log(
                            sprintf(
                                "ERROR: %d %s tiene cuenta con estado %s",
                                $dbUser["usercod"],
                                $dbUser["useremail"],
                                $dbUser["userest"]
                            )
                        );
                    }
                    if (!\Dao\Security\Security::verifyPassword($this->txtPswd, $dbUser["userpswd"])) {
                        $this->generalError = "¡Credenciales son incorrectas!";
                        $this->hasError = true;
                        error_log(
                            sprintf(
                                "ERROR: %d %s contraseña incorrecta",
                                $dbUser["usercod"],
                                $dbUser["useremail"]
                            )
                        );
                        // Aqui se debe establecer acciones segun la politica de la institucion.
                    }
                    if (!$this->hasError) {
                        $Sesion = '';

                        if (isset($_SESSION['SesionAnonima'])) {
                            $Sesion = $_SESSION['SesionAnonima'];
                        }
                        $Libro = DaoPasarela::getById($Sesion);

                        \Utilities\Security::login(
                            $dbUser["usercod"],
                            $dbUser["username"],
                            $dbUser["useremail"]
                        );


                        if (isset($_SESSION['SesionAnonima'])) {
                            $IdUser = \Utilities\Security::getUserId();
                            DaoPasarela::insert($Libro["ID"], $IdUser);

                            $IdSesion = DaoPasarela::getIdSesion($Sesion);
                            DaoPasarela::DeleteSesion($IdSesion["ID"]);

                            unset($_SESSION['SesionAnonima']);

                            if (\Utilities\Context::getContextByKey("redirto") !== "") {
                                \Utilities\Site::redirectTo(
                                    \Utilities\Context::getContextByKey("redirto")
                                );
                            } else {
                                \Utilities\Site::redirectTo("index.php?page=mnt_pasarela");
                            }
                        } else {
                            if (\Utilities\Context::getContextByKey("redirto") !== "") {
                                \Utilities\Site::redirectTo(
                                    \Utilities\Context::getContextByKey("redirto")
                                );
                            } else {
                                \Utilities\Site::redirectTo("index.php?page=mnt_index");
                            }
                        }
                    }
                } else {
                    error_log(
                        sprintf(
                            "ERROR: %s trato de ingresar",
                            $this->txtEmail
                        )
                    );
                    $this->generalError = "¡Credenciales son incorrectas!";
                }
            }
        }
        $dataView = get_object_vars($this);
        \Views\Renderer::render("security/login", $dataView);
    }
}
