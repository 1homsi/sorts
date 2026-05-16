<cfset MIN_RUN = 32>

<cffunction name="insertionSort">
    <cfargument name="arr" type="array">
    <cfargument name="left" type="numeric">
    <cfargument name="right" type="numeric">
    <cfset var i = left + 1>
    <cfloop condition="i LTE right">
        <cfset var key = arr[i]>
        <cfset var j = i - 1>
        <cfloop condition="j GTE left AND arr[j] GT key">
            <cfset arr[j+1] = arr[j]>
            <cfset j = j - 1>
        </cfloop>
        <cfset arr[j+1] = key>
        <cfset i = i + 1>
    </cfloop>
</cffunction>

<cffunction name="mergeParts">
    <cfargument name="arr" type="array">
    <cfargument name="left" type="numeric">
    <cfargument name="mid" type="numeric">
    <cfargument name="right" type="numeric">
    <cfset var lp = []>
    <cfset var rp = []>
    <cfloop from="#left#" to="#mid#" index="x"><cfset arrayAppend(lp, arr[x])></cfloop>
    <cfloop from="#mid+1#" to="#right#" index="x"><cfset arrayAppend(rp, arr[x])></cfloop>
    <cfset var i = 1><cfset var j = 1><cfset var k = left>
    <cfset var ln = arrayLen(lp)><cfset var rn = arrayLen(rp)>
    <cfloop condition="i LTE ln AND j LTE rn">
        <cfif lp[i] LTE rp[j]><cfset arr[k] = lp[i]><cfset i = i+1>
        <cfelse><cfset arr[k] = rp[j]><cfset j = j+1></cfif>
        <cfset k = k + 1>
    </cfloop>
    <cfloop condition="i LTE ln"><cfset arr[k] = lp[i]><cfset i=i+1><cfset k=k+1></cfloop>
    <cfloop condition="j LTE rn"><cfset arr[k] = rp[j]><cfset j=j+1><cfset k=k+1></cfloop>
</cffunction>

<cfset arr = [5,2,8,1,9,3,7,4,6]>
<cfset n = arrayLen(arr)>
<cfset i = 1>
<cfloop condition="i LTE n">
    <cfset right = min(i + MIN_RUN - 1, n)>
    <cfset insertionSort(arr, i, right)>
    <cfset i = i + MIN_RUN>
</cfloop>
<cfset size = MIN_RUN>
<cfloop condition="size LT n">
    <cfset left = 1>
    <cfloop condition="left LTE n">
        <cfset mid = min(left + size - 1, n)>
        <cfset right = min(left + 2*size - 1, n)>
        <cfif mid LT right><cfset mergeParts(arr, left, mid, right)></cfif>
        <cfset left = left + 2*size>
    </cfloop>
    <cfset size = size * 2>
</cfloop>
<cfoutput>#arrayToList(arr, " ")#</cfoutput>
