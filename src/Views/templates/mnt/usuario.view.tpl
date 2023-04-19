<section class="CajaProducto">
    <h4>{{mode_desc}}</h4>

    <form action="index.php?page=mnt_usuario" method="post">
        <input type="hidden" name="mode" value="{{mode}}" />
        <input type="hidden" name="crsf_token" value="{{crsf_token}}" />
        <input type="hidden" name="usercod" value="{{usercod}}" />

        <div class="Box1">
            <label for="useremail">Correo</label>
            <input type="text" autocomplete="off" {{if readonly}} readonly {{endif readonly}} name="useremail" id="useremail"
                value="{{useremail}}" />
            {{if error_useremail}}
            {{foreach error_useremail}}
            <div class="error">{{this}}</div>
            {{endfor error_useremail}}
            {{endif error_useremail}}

            <label for="Usuario">Usuario</label>
            <input type="text" autocomplete="off" {{if readonly}} readonly {{endif readonly}} name="username"
                id="username" value="{{username}}" />
            {{if error_username}}
            {{foreach error_username}}
            <div class="error">{{this}}</div>
            {{endfor error_username}}
            {{endif error_username}}


            <label for="userest">Estado Del Usuario</label>
            <input type="text" autocomplete="off" {{if readonly}} readonly {{endif readonly}} name="userest"
                id="userest" value="{{userest}}" />
            {{if error_userest}}
            {{foreach error_userest}}
            <div class="error">{{this}}</div>
            {{endfor error_userest}}
            {{endif error_userest}}


            <label for="usertipo">Tipo De Usuario</label>
            <input type="text" autocomplete="off" {{if readonly}} readonly {{endif readonly}} name="usertipo"
                id="usertipo" value="{{usertipo}}" />
            {{if error_usertipo}}
            {{foreach error_usertipo}}
            <div class="error">{{this}}</div>
            {{endfor error_usertipo}}
            {{endif error_usertipo}}
        </div>

        <div class="Box3">
            <h1>Roles Del Usuario</h1>
            <table style="width: 100%; border-radius: 15px;">
                <thead style="text-align: center; width: 300px; width: 300px;">
                    <tr>
                        <th>Codigo del rol</th>
                        <th>Estado del rol</th>
                        <th>Fecha de creación del rol</th>
                        <th>Fecha de expiración del rol</th>
                        <th>Opción</th>
                    </tr>
                </thead>
                <tbody>
                    {{foreach RolesUsuario}}
                    <tr style="text-align: center;">
                        <td>{{rolescod}}</td>
                        <td>{{rolesest}}</td>
                        <td>{{roleuserfch}}</td>
                        <td>{{roleuserexp}}</td>                        
                        <td>
                            <svg xmlns="http://www.w3.org/2000/svg" height="40" width="40" class="SVGProducts2" id="btnDelete" onclick="DelRol('{{usercod}}', '{{rolescod}}')"><path d="m10.458 31.458-1.916-1.916 9.5-9.542-9.5-9.542 1.916-1.916 9.542 9.5 9.542-9.5 1.916 1.916-9.5 9.542 9.5 9.542-1.916 1.916-9.542-9.5Z"/></svg>    
                        </td>
                    </tr>
                    {{endfor RolesUsuario}}
                </tbody>
            </table>
            <h1>Roles Existentes del programa</h1>
            <table style="width: 100%; border-radius: 15px;">
                <thead style="text-align: center; width: 300px; width: 300px;">
                    <tr>
                        <th>Codigo de Rol</th>
                        <th>Descripcion Del Rol</th>
                        <th>Estado Del Rol</th>
                        <th>  
                            Opciones                          
                        </th>
                    </tr>
                </thead>
                <tbody>
                    {{foreach TodosLosRoles}}
                    <tr style="text-align: center;">
                        <td>{{rolescod}}</td>
                        <td>{{rolesdsc}}</td>
                        <td>{{rolesest}}</td>
                        <td>
                            <svg xmlns="http://www.w3.org/2000/svg" height="40" width="40" class="SVGProducts" onclick="AddRol('{{~usercod}}', '{{rolescod}}')"><path d="M18.708 28.333h2.75V21.5h6.875v-2.792h-6.875v-7.041h-2.75v7.041h-7.041V21.5h7.041ZM20 36.667q-3.458 0-6.479-1.313-3.021-1.312-5.292-3.583t-3.583-5.292Q3.333 23.458 3.333 20t1.313-6.5q1.312-3.042 3.583-5.292t5.292-3.562Q16.542 3.333 20 3.333t6.5 1.313q3.042 1.312 5.292 3.562t3.562 5.292q1.313 3.042 1.313 6.5t-1.313 6.479q-1.312 3.021-3.562 5.292T26.5 35.354q-3.042 1.313-6.5 1.313Zm0-2.792q5.792 0 9.833-4.042 4.042-4.041 4.042-9.833t-4.021-9.833Q25.833 6.125 20 6.125q-5.792 0-9.833 4.021Q6.125 14.167 6.125 20q0 5.792 4.042 9.833 4.041 4.042 9.833 4.042ZM20 20Z"/>                    
                        </td>
                    </tr>
                    {{endfor TodosLosRoles}}
                </tbody>
            </table>
        </div>

        <fieldset>            
            <button class="btnCancelar" name="btnCancelar" id="btnCancelar">Cancelar</button>
        </fieldset>
    </form>
</section>

<script>
    document.addEventListener('DOMContentLoaded', function () {
        document.getElementById('btnCancelar').addEventListener('click', function (e) {
            e.preventDefault();
            e.stopPropagation();
            window.location.href = 'index.php?page=mnt_usuarios';
        });
    });
</script>