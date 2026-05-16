<ROUTINE INSERTION-SORT (ARR N)
    <PROG ((I 1) (J 0) (KEY 0))
        <REPEAT ()
            <COND (<IGRTR? I N> <RETURN>)>
            <SET KEY <GET .ARR .I>>
            <SET J <- .I 1>>
            <REPEAT ()
                <COND (<OR <LESS? .J 0>
                           <NOT <IGRTR? <GET .ARR .J> .KEY>>>
                       <RETURN>)>
                <PUT .ARR <- .J 1> <GET .ARR .J>>
                <SET J <- .J 1>>
            >
            <PUT .ARR <- .J 1> .KEY>
            <SET I <+ .I 1>>
        >
    >
>
