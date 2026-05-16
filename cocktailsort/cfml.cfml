<cffunction name="cocktailSort" returntype="array">
    <cfargument name="arr" type="array" required="true">
    <cfset var swapped = true>
    <cfset var start = 1>
    <cfset var ending = arrayLen(arguments.arr)>
    <cfset var tmp = 0>
    <cfloop condition="swapped">
        <cfset swapped = false>
        <cfloop from="#start#" to="#ending - 1#" index="i">
            <cfif arguments.arr[i] gt arguments.arr[i + 1]>
                <cfset tmp = arguments.arr[i]>
                <cfset arguments.arr[i] = arguments.arr[i + 1]>
                <cfset arguments.arr[i + 1] = tmp>
                <cfset swapped = true>
            </cfif>
        </cfloop>
        <cfif not swapped><cfbreak></cfif>
        <cfset swapped = false>
        <cfset ending = ending - 1>
        <cfloop from="#ending - 1#" to="#start#" index="i" step="-1">
            <cfif arguments.arr[i] gt arguments.arr[i + 1]>
                <cfset tmp = arguments.arr[i]>
                <cfset arguments.arr[i] = arguments.arr[i + 1]>
                <cfset arguments.arr[i + 1] = tmp>
                <cfset swapped = true>
            </cfif>
        </cfloop>
        <cfset start = start + 1>
    </cfloop>
    <cfreturn arguments.arr>
</cffunction>
