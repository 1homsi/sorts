<cffunction name="selectionSort" returntype="array">
    <cfargument name="arr" type="array">
    <cfset var n = arrayLen(arr)>
    <cfset var minIdx = 0>
    <cfset var tmp = 0>
    <cfloop from="1" to="#n-1#" index="i">
        <cfset minIdx = i>
        <cfloop from="#i+1#" to="#n#" index="j">
            <cfif arr[j] LT arr[minIdx]>
                <cfset minIdx = j>
            </cfif>
        </cfloop>
        <cfset tmp = arr[i]>
        <cfset arr[i] = arr[minIdx]>
        <cfset arr[minIdx] = tmp>
    </cfloop>
    <cfreturn arr>
</cffunction>
