<?xml version="1.0" encoding="utf-8"?>
<sch:schema xmlns:sch="http://purl.oclc.org/dsdl/schematron" queryBinding="exslt"><sch:ns uri="http://exslt.org/dynamic" prefix="dyn"/><sch:ns uri="http://devnetbro.com/employment-data" prefix="empdata"/><sch:ns uri="urn:ietf:params:xml:ns:netconf:base:1.0" prefix="nc"/><sch:let name="root" value="/nc:data"/><sch:pattern id="employment-data"><sch:rule context="/nc:data/empdata:employee-info/empdata:employee"><sch:report test="preceding-sibling::empdata:employee[empdata:employee-id=current()/empdata:employee-id]">Duplicate key "empdata:employee-id"</sch:report><sch:assert test="preceding-sibling::empdata:employee or count(../empdata:employee)&lt;=1024">Number of list entries must be at most 1024</sch:assert><sch:report test="preceding-sibling::empdata:employee[empdata:full-name=current()/empdata:full-name]">Violated uniqueness for "empdata:full-name"</sch:report></sch:rule><sch:rule context="/nc:data/empdata:employee-info/empdata:employee-record/empdata:employee"><sch:report test="preceding-sibling::empdata:employee[empdata:employee-name=current()/empdata:employee-name]">Duplicate key "empdata:employee-name"</sch:report></sch:rule><sch:rule context="/nc:data/empdata:employee-info/empdata:employee-record/empdata:employee/empdata:employee-name"><sch:report test="not(../../../empdata:employee/empdata:full-name=.)">Leaf "../../../empdata:employee/empdata:full-name" does not exist for leafref value "<sch:value-of select="."/>"</sch:report></sch:rule><sch:rule context="/nc:data/empdata:employee-info/empdata:employee-record/empdata:employee/empdata:grade-a"><sch:assert test="../empdata:is-active != 'false' and ../empdata:salary &gt; 50000">Employee is not currently active and has earns less than 50000</sch:assert></sch:rule><sch:rule context="/nc:data/empdata:employee-info/empdata:employee-record/empdata:employee/empdata:grade-b"><sch:assert test="ancestor-or-self::*[processing-instruction('dsrl')] or (../empdata:is-active != 'false' and ../empdata:salary &lt; 50000)">Node "empdata:grade-b" is only valid when "../empdata:is-active != 'false' and ../empdata:salary &lt; 50000"</sch:assert></sch:rule><sch:rule context="/nc:data/empdata:employee-info/empdata:employee-record/empdata:employee/empdata:credentials"><sch:report test=". = preceding-sibling::empdata:credentials">Duplicate leaf-list entry "<sch:value-of select="."/>".</sch:report></sch:rule></sch:pattern></sch:schema>