<?php
 namespace Controllers\Mnt;

use Controllers\PublicController;
use Views\Renderer;
use Dao\Mnt\Libros as DaoLibro;

class Index extends PublicController
{
  private $viewData = array();  

    public function run():void
    {                    
        error_log(json_encode($this->viewData));   
        
        $LibrosPopulares = DaoLibro::LibrosPopulares();
        $this->viewData["LibrosPopulares"] = array();
        
        foreach($LibrosPopulares as $librosPop){
          $librosPop['Imagen64'] = "data:image/jpg;base64," . base64_encode($librosPop['Imagen']);          
          $this->viewData["LibrosPopulares"][] = $librosPop;
        }

        $LibrosPublicidad = DaoLibro::LibrosPublicidad();
        $this->viewData["LibrosPublicidad"] = array();
        foreach($LibrosPublicidad as $librosPup){
          $librosPup['Imagen64'] = "data:image/jpg;base64," . base64_encode($librosPup['Imagen2']);
          $this->viewData["LibrosPublicidad"][] = $librosPup;
        }

        $LibrosPublicidad2 = DaoLibro::LibrosPublicidad2();
        $this->viewData["LibrosPublicidad2"] = array();
        foreach($LibrosPublicidad2 as $librosPup2){
          $librosPup2['Imagen64'] = "data:image/jpg;base64," . base64_encode($librosPup2['Imagen2']);
          $this->viewData["LibrosPublicidad2"][] = $librosPup2;
        }

        $LibrosRecie = DaoLibro::LibrosRecientes();
        $this->viewData["LibrosRecientes"] = array();        
        foreach($LibrosRecie as $libros){
          $libros['Imagen64'] = "data:image/jpg;base64," . base64_encode($libros['Imagen']);
          $this->viewData["LibrosRecientes"][] = $libros;
        }

        $Mangas = DaoLibro::Mangas();
        $this->viewData["LibrosMangas"] = array();
        foreach($Mangas as $LibrosMangas){
          $LibrosMangas['Imagen64'] = "data:image/jpg;base64," . base64_encode($LibrosMangas['Imagen2']);
          $this->viewData["LibrosMangas"][] = $LibrosMangas;
        }

        $Mangas2 = DaoLibro::Mangas2();
        $this->viewData["LibrosMangas2"] = array();
        foreach($Mangas2 as $LibrosMangas2){
          $LibrosMangas2['Imagen64'] = "data:image/jpg;base64," . base64_encode($LibrosMangas2['Imagen2']);
          $this->viewData["LibrosMangas2"][] = $LibrosMangas2;
        }


        $GenerosLit = DaoLibro::ObtenerGenerosSeccion('Manga');
        $this->viewData["GenerosLiterarios"] = array();
        foreach($GenerosLit as $Generos){
          $Generos['Imagen64'] = "data:image/jpg;base64," . base64_encode($Generos['Imagen']);
          $this->viewData["GenerosLiterarios"][] = $Generos;
        }   
        Renderer::render('mnt/index', $this->viewData);
    }
}
