<cffunction name="merge" returntype="array">
    <cfargument name="left" type="array">
    <cfargument name="right" type="array">
    <cfset var result = []>
    <cfset var i = 1>
    <cfset var j = 1>
    <cfloop condition="i LTE ArrayLen(left) AND j LTE ArrayLen(right)">
        <cfif left[i] LTE right[j]>
            <cfset ArrayAppend(result, left[i])>
            <cfset i++>
        <cfelse>
            <cfset ArrayAppend(result, right[j])>
            <cfset j++>
        </cfif>
    </cfloop>
    <cfloop condition="i LTE ArrayLen(left)"><cfset ArrayAppend(result, left[i])><cfset i++></cfloop>
    <cfloop condition="j LTE ArrayLen(right)"><cfset ArrayAppend(result, right[j])><cfset j++></cfloop>
    <cfreturn result>
</cffunction>

<cffunction name="mergeSort" returntype="array">
    <cfargument name="arr" type="array">
    <cfset var n = ArrayLen(arr)>
    <cfif n LTE 1><cfreturn arr></cfif>
    <cfset var mid = Int(n / 2)>
    <cfset var left = mergeSort(arr[1..mid])>
    <cfset var right = mergeSort(arr[mid+1..n])>
    <cfreturn merge(left, right)>
</cffunction>

<cfset arr = [38, 27, 43, 3, 9, 82, 10]>
<cfset sorted = mergeSort(arr)>
<cfoutput>#ArrayToList(sorted, " ")#</cfoutput>
