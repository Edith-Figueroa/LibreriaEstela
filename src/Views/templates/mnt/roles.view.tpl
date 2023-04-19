<section class="depth-1">  
</section>
<section style="width: 95%; margin: 5% 0%;">
  <table style="width: 100%;" >
    <thead  style="text-align: center; width: 300px; width: 300px;">
      <tr>
      <th>Código Del Rol</th>
      <th>Descripción</th>
      <th>Estado Del Rol</th>
      <th>
        {{if CanInsert}}
        <svg xmlns="http://www.w3.org/2000/svg" height="40" width="40" class="SVGProducts" onclick="location.href='index.php?page=mnt_rol&mode=INS'"><path d="M18.708 28.333h2.75V21.5h6.875v-2.792h-6.875v-7.041h-2.75v7.041h-7.041V21.5h7.041ZM20 36.667q-3.458 0-6.479-1.313-3.021-1.312-5.292-3.583t-3.583-5.292Q3.333 23.458 3.333 20t1.313-6.5q1.312-3.042 3.583-5.292t5.292-3.562Q16.542 3.333 20 3.333t6.5 1.313q3.042 1.312 5.292 3.562t3.562 5.292q1.313 3.042 1.313 6.5t-1.313 6.479q-1.312 3.021-3.562 5.292T26.5 35.354q-3.042 1.313-6.5 1.313Zm0-2.792q5.792 0 9.833-4.042 4.042-4.041 4.042-9.833t-4.021-9.833Q25.833 6.125 20 6.125q-5.792 0-9.833 4.021Q6.125 14.167 6.125 20q0 5.792 4.042 9.833 4.041 4.042 9.833 4.042ZM20 20Z"/>                            
        {{endif CanInsert}}
      </th>
      </tr>
    </thead>
    <tbody>
      {{foreach Roles}}
      <tr style="text-align: center;">
        <td>{{rolescod}}</td>
        <td>
          {{if ~CanView}}
          <a href="index.php?page=mnt_rol&mode=DSP&id={{rolescod}}">{{rolescod}}</a>
          {{endif ~CanView}}

          {{ifnot ~CanView}}
              {{rolesdsc}}
          {{endifnot ~CanView}}
        </td>        
        <td>{{rolesest}}</td>
        <td>
          {{if ~CanUpdate}}          
            <svg xmlns="http://www.w3.org/2000/svg" height="40" width="40" class="SVGProducts" id="btnEdit" onclick="location.href='index.php?page=mnt_rol&mode=UPD&id={{rolescod}}'"><path d="M7.792 32.208h2l17.083-17.083-2-2L7.792 30.208Zm25-19.083L26.875 7.25l1.917-1.958q.791-.792 1.958-.792 1.167 0 1.958.792l2 2q.792.791.813 1.937.021 1.146-.771 1.938Zm-2 2L10.917 35H5v-5.917L24.875 9.208Zm-4.917-1-1-1 2 2Z"/></svg>
          {{endif ~CanUpdate}}
          &nbsp;
          {{if ~CanDelete}}          
            <svg xmlns="http://www.w3.org/2000/svg" height="40" width="40" class="SVGProducts2" id="btnDelete"><path d="M11.125 35Q10 35 9.188 34.188q-.813-.813-.813-1.98V9.167H6.667V6.375h8V5h10.666v1.375h8v2.792h-1.708v23.041q0 1.125-.813 1.959Q30 35 28.875 35Zm17.75-25.833h-17.75v23.041h17.75ZM15.208 28.708h2.75V12.625h-2.75Zm6.834 0h2.75V12.625h-2.75ZM11.125 9.167v23.041Z"/></svg>                    
          {{endif ~CanDelete}}
        </td>
      </tr>
      {{endfor Roles}}
    </tbody>
  </table>
</section>
