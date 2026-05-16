<#assign arr = [5, 3, 1, 4, 2]>
<#assign sorted = arr?sort>
<ul>
<#list sorted as val>
  <li>${val}</li>
</#list>
</ul>
