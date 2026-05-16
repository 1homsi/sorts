<#function insertionSort arr>
  <#assign a = arr>
  <#assign n = arr?size>
  <#list 1..(n-1) as i>
    <#assign key = a[i]>
    <#assign j = i - 1>
    <#list 0..n as k>
      <#if j >= 0 && a[j] > key>
        <#assign a = a[0..j-1] + [a[j]] + a[j+1..]>
        <#assign j = j - 1>
      </#if>
    </#list>
  </#list>
  <#return a>
</#function>
${insertionSort([5, 3, 1, 4, 2])?join(", ")}
