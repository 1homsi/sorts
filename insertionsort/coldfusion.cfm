<cffunction name="insertionSort" returntype="array">
    <cfargument name="arr" type="array" required="true">
    <cfset local.n = arrayLen(arguments.arr)>
    <cfloop from="2" to="#local.n#" index="i">
        <cfset local.key = arguments.arr[i]>
        <cfset local.j = i - 1>
        <cfloop condition="local.j GTE 1 AND arguments.arr[local.j] GT local.key">
            <cfset arguments.arr[local.j + 1] = arguments.arr[local.j]>
            <cfset local.j = local.j - 1>
        </cfloop>
        <cfset arguments.arr[local.j + 1] = local.key>
    </cfloop>
    <cfreturn arguments.arr>
</cffunction>
