<section class="CajaProducto" style="width: 120%; margin-left:-8%">
    <h4>{{mode_desc}}</h4>

    <form action="index.php?page=mnt_rol" method="post">
        <input type="hidden" name="mode" value="{{mode}}" />
        <input type="hidden" name="crsf_token" value="{{crsf_token}}"/>            

        <div class="Box1">
            <fieldset style="position: absolute; left:0%; margin: 25% 5%">
                <button class="btnCancelar" name="btnCancelar" id="btnCancelar" style="width: 200px; height: 100px">Cancelar</button>
                <button class="btnEnviar" type="submit" name="btnEnviar">{{btnEnviarText}}</button>
            </fieldset>
            <label for="rolescod">Codigo del rol</label>
            <input type="text" autocomplete="off" {{if readonly}} readonly {{endif readonly}} name="rolescod"
                id="rolescod" value="{{rolescod}}" />
            {{if error_rolescod}}
            {{foreach error_rolescod}}
            <div class="error">{{this}}</div>
            {{endfor error_rolescod}}
            {{endif error_rolescod}}

            <label for="rolesdsc">Descripción</label>
            <input type="text" autocomplete="off" {{if readonly}} readonly {{endif readonly}} name="rolesdsc"
                id="rolesdsc" value="{{rolesdsc}}" />
            {{if error_rolesdsc}}
            {{foreach error_rolesdsc}}
            <div class="error">{{this}}</div>
            {{endfor error_rolesdsc}}
            {{endif error_rolesdsc}}


            <label for="rolesest">Estado Del Rol</label>
            <input type="text" autocomplete="off" {{if readonly}} readonly {{endif readonly}} name="rolesest"
                id="rolesest" value="{{rolesest}}" />
            {{if error_rolesest}}
            {{foreach error_rolesest}}
            <div class="error">{{this}}</div>
            {{endfor error_rolesest}}
            {{endif error_rolesest}}
        </div>
        <div class="Box1">
            <h1>Funciones Del Rol</h1>
            <table style="width: 100%; border-radius: 15px;">
                <thead style="text-align: center; width: 300px; width: 300px;">
                    <tr>
                        <th>Descripción</th>
                        <th>Estado de la Funcion</th>
                        <th>Fecha De expiración</th>
                        <th>Opción</th>
                    </tr>
                </thead>
                <tbody>
                    {{foreach Funciones}}
                    <tr style="text-align: center;">
                        <td>{{fncod}}</td>
                        <td>{{fnrolest}}</td>
                        <td>{{fnexp}}</td>
                        <td>
                            <svg xmlns="http://www.w3.org/2000/svg" height="40" width="40" class="SVGProducts2"
                                id="btnDelete" onclick="DelFun('{{~rolescod}}','{{FncodSg}}','{{~rolescod}}')">
                                <path d="m10.458 31.458-1.916-1.916 9.5-9.542-9.5-9.542 1.916-1.916 9.542 9.5 9.542-9.5 1.916 1.916-9.5 9.542 9.5 9.542-1.916 1.916-9.542-9.5Z" />
                            </svg>
                        </td>
                    </tr>
                    {{endfor Funciones}}
                </tbody>
            </table>

        </div>
        <div class="Box2">

            <h1>Funciones</h1>
            <table style="width: 100%; border-radius: 15px;">
                <thead style="text-align: center; width: 300px; width: 300px;">
                    <tr>
                        <th>Descripción</th>
                        <th>Estado de la Funcion</th>
                        <th>Tipo Funcion</th>
                        <th>Opción</th>
                    </tr>
                </thead>
                <tbody>
                    {{foreach TodasFunciones}}
                    <tr style="text-align: center;">
                        <td>{{fncod}}</td>
                        <td>{{fnest}}</td>
                        <td>{{fntyp}}</td>
                        <td>
                            <svg xmlns="http://www.w3.org/2000/svg" height="40" width="40" class="SVGProducts"
                                onclick="AddFun('{{~rolescod}}','{{FncodSg}}', '{{~rolescod}}')">
                                <path d="M18.708 28.333h2.75V21.5h6.875v-2.792h-6.875v-7.041h-2.75v7.041h-7.041V21.5h7.041ZM20 36.667q-3.458 0-6.479-1.313-3.021-1.312-5.292-3.583t-3.583-5.292Q3.333 23.458 3.333 20t1.313-6.5q1.312-3.042 3.583-5.292t5.292-3.562Q16.542 3.333 20 3.333t6.5 1.313q3.042 1.312 5.292 3.562t3.562 5.292q1.313 3.042 1.313 6.5t-1.313 6.479q-1.312 3.021-3.562 5.292T26.5 35.354q-3.042 1.313-6.5 1.313Zm0-2.792q5.792 0 9.833-4.042 4.042-4.041 4.042-9.833t-4.021-9.833Q25.833 6.125 20 6.125q-5.792 0-9.833 4.021Q6.125 14.167 6.125 20q0 5.792 4.042 9.833 4.041 4.042 9.833 4.042ZM20 20Z" />
                        </td>
                    </tr>
                    {{endfor TodasFunciones}}
                </tbody>
            </table>
        </div>
    </form>



</section>

<script>
    document.addEventListener('DOMContentLoaded', function () {
        document.getElementById('btnCancelar').addEventListener('click', function (e) {
            e.preventDefault();
            e.stopPropagation();
            window.location.href = 'index.php?page=mnt_roles';
        });
    });
</script>