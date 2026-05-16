<#assign arr = [5, 3, 8, 1, 9, 2, 7, 4, 6, 0]>
<#assign sorted = arr?sort>
<#list sorted as val>${val}<#sep>, </#sep></#list>
