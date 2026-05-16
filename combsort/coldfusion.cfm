<cffunction name="combSort" returntype="array">
    <cfargument name="arr" type="array" required="true">
    <cfset var n = ArrayLen(arr)>
    <cfset var gap = n>
    <cfset var sorted = false>
    <cfset var tmp = 0>
    <cfloop condition="NOT sorted">
        <cfset gap = Int(gap / 1.3)>
        <cfif gap LTE 1>
            <cfset gap = 1>
            <cfset sorted = true>
        </cfif>
        <cfloop from="1" to="#(n - gap)#" index="i">
            <cfif arr[i] GT arr[i + gap]>
                <cfset tmp = arr[i]>
                <cfset arr[i] = arr[i + gap]>
                <cfset arr[i + gap] = tmp>
                <cfset sorted = false>
            </cfif>
        </cfloop>
    </cfloop>
    <cfreturn arr>
</cffunction>
