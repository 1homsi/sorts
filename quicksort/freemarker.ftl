<#assign arr = [3, 6, 8, 10, 1, 2, 1]>
<#assign sorted = arr?sort>
<ul>
<#list sorted as x>
    <li>${x}</li>
</#list>
</ul>
