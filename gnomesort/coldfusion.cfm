<cffunction name="gnomeSort" returntype="array">
    <cfargument name="arr" type="array" required="true">
    <cfset var i = 1>
    <cfset var n = arrayLen(arguments.arr)>
    <cfset var tmp = 0>
    <cfloop condition="i LTE n">
        <cfif i EQ 1 OR arguments.arr[i] GTE arguments.arr[i - 1]>
            <cfset i = i + 1>
        <cfelse>
            <cfset tmp = arguments.arr[i]>
            <cfset arguments.arr[i] = arguments.arr[i - 1]>
            <cfset arguments.arr[i - 1] = tmp>
            <cfset i = i - 1>
        </cfif>
    </cfloop>
    <cfreturn arguments.arr>
</cffunction>
