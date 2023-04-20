<section class="depth-1">  
</section>
<section style="width: 95%; margin: 5% 0%;">
  <table style="width: 100%;" >
    <thead  style="text-align: center; width: 300px; width: 300px;">
      <tr>
      <th>Código</th>
      <th>Correo</th>
      <th>Estado</th>
      <th>
        {{if CanInsert}}
        <svg xmlns="http://www.w3.org/2000/svg" height="40" width="40" class="SVGProducts" onclick="location.href='index.php?page=mnt_usuario&mode=INS&id=0'"><path d="M18.708 28.333h2.75V21.5h6.875v-2.792h-6.875v-7.041h-2.75v7.041h-7.041V21.5h7.041ZM20 36.667q-3.458 0-6.479-1.313-3.021-1.312-5.292-3.583t-3.583-5.292Q3.333 23.458 3.333 20t1.313-6.5q1.312-3.042 3.583-5.292t5.292-3.562Q16.542 3.333 20 3.333t6.5 1.313q3.042 1.312 5.292 3.562t3.562 5.292q1.313 3.042 1.313 6.5t-1.313 6.479q-1.312 3.021-3.562 5.292T26.5 35.354q-3.042 1.313-6.5 1.313Zm0-2.792q5.792 0 9.833-4.042 4.042-4.041 4.042-9.833t-4.021-9.833Q25.833 6.125 20 6.125q-5.792 0-9.833 4.021Q6.125 14.167 6.125 20q0 5.792 4.042 9.833 4.041 4.042 9.833 4.042ZM20 20Z"/>                            
        {{endif CanInsert}}
      </th>
      </tr>
    </thead>
    <tbody>
      {{foreach Usuarios}}
      <tr style="text-align: center;">
        <td>{{usercod}}</td>
        <td>
          {{if ~CanView}}
          <a href="index.php?page=mnt_usuario&mode=DSP&id={{usercod}}">{{useremail}}</a>
          {{endif ~CanView}}

          {{ifnot ~CanView}}
              {{useremail}}
          {{endifnot ~CanView}}
        </td>
        <td>{{userest}}</td>
        <td>
          {{if ~CanUpdate}}          
            <span title="Editar Usuario"><svg xmlns="http://www.w3.org/2000/svg" height="40" width="40" class="SVGProducts" id="btnEdit" onclick="location.href='index.php?page=mnt_usuario&mode=UPD&id={{usercod}}'"><path d="M7.792 32.208h2l17.083-17.083-2-2L7.792 30.208Zm25-19.083L26.875 7.25l1.917-1.958q.791-.792 1.958-.792 1.167 0 1.958.792l2 2q.792.791.813 1.937.021 1.146-.771 1.938Zm-2 2L10.917 35H5v-5.917L24.875 9.208Zm-4.917-1-1-1 2 2Z"/></svg></span>                        
          {{endif ~CanUpdate}}          
          {{if ~CanView}}
            <span title="Historia De Trasacciones" onclick="Historial({{usercod}})"><svg xmlns="http://www.w3.org/2000/svg" height="40" width="40" class="SVGProducts"><path d="M9.5 36.667q-1.917 0-3.25-1.334Q4.917 34 4.917 32.083v-5.125h5.208V3.333l2.5 2.5 2.458-2.5 2.5 2.5 2.5-2.5 2.5 2.5 2.5-2.5 2.5 2.5 2.5-2.5 2.5 2.5 2.5-2.5v28.75q0 1.917-1.333 3.25-1.333 1.334-3.25 1.334Zm21-2.792q.792 0 1.292-.5t.5-1.292V7.792H12.875v19.166h15.833v5.125q0 .792.5 1.292t1.292.5Zm-15.583-19.5v-2.75h10v2.75Zm0 5.417V17h10v2.792Zm13.708-5.417q-.583 0-1-.396-.417-.396-.417-.979t.417-.979q.417-.396 1-.396.542 0 .958.396.417.396.417.979t-.417.979q-.416.396-.958.396Zm0 5.25q-.583 0-1-.396-.417-.396-.417-.979t.417-.979q.417-.396 1-.396.542 0 .958.396.417.396.417.979t-.417.979q-.416.396-.958.396ZM9.458 33.875h16.459v-4.167H7.708v2.375q0 .792.5 1.292t1.25.5Zm-1.75 0v-4.167 4.167Z"/></svg></span>
          {{endif ~CanView}}
        </td>
      </tr>
      {{endfor Usuarios}}
    </tbody>
  </table>
</section>
